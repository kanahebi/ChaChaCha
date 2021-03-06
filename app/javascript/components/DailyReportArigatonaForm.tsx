import React, { useState } from 'react';
import { FormGroup } from './FormGroup';
import { useUsers } from '../hooks/api';

interface IDailyReportArigatonaForm {
  dailyReportArigatona: Arigatona
  departments: Department[]
}
// eslint-disable-next-line
const DailyReportArigatonaForm = ({ dailyReportArigatona, departments }: IDailyReportArigatonaForm) => {
  const [selectedUserId, setSelectedUserId] = useState(dailyReportArigatona?.user?.id || 0);
  const [selectedDepartmentId, setSelectedDepartmentId] = useState<number>(departments[0].id);
  const { users } = useUsers({ departmentId: selectedDepartmentId });
  const handleChangeDepartment = (ev: React.ChangeEvent<HTMLSelectElement>) => {
    setSelectedDepartmentId(ev.target.value as unknown as number);
  };

  return (
    <div className="l-row">
      <div className="l-col col-6">
        <FormGroup>
          <select className="form-control" onChange={handleChangeDepartment} defaultValue={dailyReportArigatona?.user?.department?.id || 0}>
            <option value={0}>---</option>
            {departments.map((department) => (
              <option key={department.id} value={department.id}>
                {department.name}
              </option>
            ))}
          </select>
        </FormGroup>
      </div>
      <div className="l-col col-6">
        <FormGroup>
          <select name="arigatona[user_id]" className="form-control" onChange={(ev) => setSelectedUserId(ev.target.value)} value={selectedUserId}>
            <option value={0}>---</option>
            {users
              && users.map((user) => (
                <option key={user.id} value={user.id}>
                  {user.name}
                </option>
              ))}
          </select>
        </FormGroup>
      </div>
    </div>
  );
};

export default DailyReportArigatonaForm;
