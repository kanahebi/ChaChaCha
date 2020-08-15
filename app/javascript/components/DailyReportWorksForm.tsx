import React, { useState } from 'react';
import { WorkEntity } from './WorkEntity';
import { FormGroup } from './FormGroup';
import { WorkForm } from './WorkForm';

interface IDailyReportWorksForm {
  workContents: WorkContent[]
  workProperties: WorkProperty[]
}
const DailyReportWorksForm = ({ workContents, workProperties }: IDailyReportWorksForm) => {
  const [works, setWorks] = useState<Work[]>([]);
  const [newWork, setNewWork] = useState<Work | null>();

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
        setNewWork={setNewWork}
      />
      <FormGroup>
        <button type="button" onClick={handleAdd} className="btn-default block">
          <i className="fas fa-plus-circle" />
          {' '}
          &quot;報告する内容&quot;に追加
        </button>
      </FormGroup>
      {works.map((work, index) => (
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
