import React from 'react';
import { FormGroup, FormGroupToggle } from './FormGroup';

interface IWorkForm {
  workContents: WorkContent[]
  workProperties: WorkProperty[]
  newWork: Work
  setNewWork: (work: Work) => void
}

export const WorkForm = ({
  workContents, workProperties, newWork, setNewWork,
}: IWorkForm) => (
  <>
    <FormGroup label="物件" required>
      <select
        className="form-control"
        onChange={(ev) => setNewWork(
          {
            ...newWork,
            workContentId: ev.target.value as unknown as number,
            workContent: {
              name: ev.target.options[ev.target.selectedIndex].innerText,
            },
          },
        )}
      >
        <option disabled selected>---</option>
        {
            workContents.map((workContent) => (
              <option key={workContent.id} value={workContent.id}>
                {workContent.name}
              </option>
            ))
          }
      </select>
    </FormGroup>
    <FormGroup label="内容" required>
      <select
        className="form-control"
        onChange={(ev) => setNewWork(
          {
            ...newWork,
            workPropertyId: ev.target.value as unknown as number,
            workProperty: {
              name: ev.target.options[ev.target.selectedIndex].innerText,
            },
          },
        )}
      >
        <option disabled selected>---</option>
        {
            workProperties.map((workProperty) => (
              <option key={workProperty.id} value={workProperty.id}>
                {workProperty.name}
              </option>
            ))
          }
      </select>
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
        checked={newWork?.includeRest}
        onChange={(ev) => setNewWork({ ...newWork, includeRest: ev.target.checked })}
      />
    </FormGroupToggle>
  </>
);
