import React, { useState } from 'react';
import { WorkEntity } from './WorkEntity';
import { FormGroup } from './FormGroup';
import { WorkForm } from './WorkForm';

const DailyReportWorksForm = () => {
  const [works, setWorks] = useState<Work[]>([]);
  const [newWork, setNewWork] = useState<Work | null>();

  const handleAdd = () => {
    setWorks([...works, newWork]);
    setNewWork({
      workContentId: null,
      workPropertyId: null,
      startAt: '',
      endAt: '',
      includeRest: false,
    });
  };

  return (
    <>
      <WorkForm newWork={newWork} setNewWork={setNewWork} />
      <FormGroup>
        <button type="button" onClick={handleAdd} className="btn-default block">
          <i className="fas fa-plus-circle" />
          {' '}
          &quot;報告する内容&quot;に追加
        </button>
      </FormGroup>
      {works.map((work) => <WorkEntity key={work.workPropertyId} work={work} />)}
    </>
  );
};

export default DailyReportWorksForm;
