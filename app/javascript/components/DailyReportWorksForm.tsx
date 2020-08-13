import React, { useState } from 'react';
import { FormGroup } from './FormGroup';
import { WorkForm } from './WorkForm';

const DailyReportWorksForm = () => {
  const handleAdd = () => {
    console.log('add!');
  };

  return (
    <>
      <WorkForm />
      <FormGroup>
        <button type="button" onClick={handleAdd} className="btn-default block">
          <i className="fas fa-plus-circle" />
          {' '}
          &quot;報告する内容&quot;に追加
        </button>
      </FormGroup>
    </>
  );
};

export default DailyReportWorksForm;
