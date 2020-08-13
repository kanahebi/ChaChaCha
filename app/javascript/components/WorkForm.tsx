import React from 'react';
import { FormGroup, FormGroupToggle } from './FormGroup';

export const WorkForm = () => (
  <>
    <FormGroup label="物件" required>
      <input
        type="text"
        className="form-control"
        name="works[][work_content_id]"
        id="content_id"
        value="1"
      />
    </FormGroup>
    <FormGroup label="内容" required>
      <input
        type="text"
        className="form-control"
        name="works[][work_property_id]"
        id="property_id"
        value="1"
      />
    </FormGroup>

    <FormGroup label="開始時刻" required>
      <input
        type="time"
        className="form-control"
        name="works[][start_at]"
        id="start_at"
        value="1"
      />
    </FormGroup>
    <FormGroup label="終了時刻" required>
      <input
        type="time"
        className="form-control"
        name="works[][end_at]"
        id="end_at"
        value="1"
      />
    </FormGroup>

    <FormGroupToggle label="休憩を含む">
      <input
        type="checkbox"
        className="form-control"
        name="works[][include_rest]"
        id="include_rest"
        value="1"
      />
    </FormGroupToggle>
  </>
);
