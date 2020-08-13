import React from 'react';
import { FormGroup, FormGroupToggle } from './FormGroup';

interface IWorkForm {
  newWork: Work
  setNewWork: (work: Work) => void
}

export const WorkForm = ({ newWork, setNewWork }) => (
  <>
    <FormGroup label="物件" required>
      <input
        type="text"
        className="form-control"
        value={newWork?.workContentId}
        onChange={(ev) => setNewWork({ ...newWork, workContentId: ev.target.value })}
      />
    </FormGroup>
    <FormGroup label="内容" required>
      <input
        type="text"
        className="form-control"
        value={newWork?.workPropertyId}
        onChange={(ev) => setNewWork({ ...newWork, workPropertyId: ev.target.value })}
      />
    </FormGroup>
    <FormGroup label="開始時刻" required>
      <input
        type="time"
        className="form-control"
        value={newWork?.startAt}
        onChange={(ev) => setNewWork({ ...newWork, startAt: ev.target.value })}
      />
    </FormGroup>
    <FormGroup label="終了時刻" required>
      <input
        type="time"
        className="form-control"
        value={newWork?.endAt}
        onChange={(ev) => setNewWork({ ...newWork, endAt: ev.target.value })}
      />
    </FormGroup>

    <FormGroupToggle label="休憩を含む">
      <input
        type="checkbox"
        className="form-control"
        value={newWork?.includeRest}
        onChange={(ev) => setNewWork({ ...newWork, includeRest: ev.target.checked })}
      />
    </FormGroupToggle>
  </>
);
