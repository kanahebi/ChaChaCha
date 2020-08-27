import React, { useState } from 'react';
import { WorkEntity, WorkEntityEmpty } from './WorkEntity';
import { FormGroup } from './FormGroup';
import { WorkForm } from './WorkForm';

interface IDailyReportWorksForm {
  dailyReportWorks: Work[]
  workContents: WorkContent[]
  workProperties: WorkProperty[]
}
// eslint-disable-next-line
const DailyReportWorksForm = ({ dailyReportWorks, workContents, workProperties }: IDailyReportWorksForm) => {
  const [works, setWorks] = useState<Work[]>(dailyReportWorks);
  const [newWork, setNewWork] = useState<Work | null>();
  const [addEnable, setAddEnable] = useState(false);

  const isValidWork = (work: Work) => {
    if (!work.workContentId || work.workContentId.toString() === '0') return false;
    if (!work.workPropertyId || work.workPropertyId.toString() === '0') return false;
    if (!work.startAt) return false;
    if (!work.endAt) return false;

    return true;
  };
  const handleChangeNewWork = (work: Work) => {
    setNewWork(work);
    setAddEnable(isValidWork(work));
  };

  const handleAdd = () => {
    setWorks([...works, newWork]);
    // フォームをリセット
    setNewWork({
      id: null,
      workContentId: 0,
      workPropertyId: 0,
      startAt: '',
      endAt: '',
      includeRest: false,
      workContent: null,
      workProperty: null,
    });
  };

  const handleDelete = (index: number) => {
    setWorks(works.filter((_, i) => i !== index));
  };

  return (
    <>
      <WorkForm
        workContents={workContents}
        workProperties={workProperties}
        newWork={newWork}
        handleChangeNewWork={handleChangeNewWork}
      />
      <FormGroup>
        <button type="button" onClick={handleAdd} className="btn-default block" disabled={!addEnable}>
          <i className="fas fa-plus-circle" />
          {' '}
          &quot;報告する内容&quot;に追加
        </button>
      </FormGroup>
      {works.length === 0
        ? <WorkEntityEmpty />
        : works.map((work, index) => (
          <WorkEntity
            key={index}
            work={work}
            handleDelete={handleDelete}
            index={index}
          />
        ))}
    </>
  );
};

export default DailyReportWorksForm;
