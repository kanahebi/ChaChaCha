import React, { ChangeEvent, useState } from 'react';
import { FormGroup } from './FormGroup';
import { WorkForm } from './WorkForm';

interface IDailyReportArigatonaForm {
  departments: Department[]
}
const DailyReportArigatonaForm = ({ departments }: IDailyReportArigatonaForm) => {
  const handleChangeDepartment = (ev: ChangeEvent) => {
    console.log(ev.target.value);
  };

  return (
    <div className="l-row">
      <div className="l-col col-6">
        <FormGroup>
          <select className="form-control" onChange={handleChangeDepartment}>
            {departments.map((department) => (
              <option key={department.id} value={department.id}>
                {department.name}
              </option>
            ))}
          </select>
        </FormGroup>
      </div>
      <div className="l-col col-6">
        b
      </div>
    </div>
  );
};

export default DailyReportArigatonaForm;
