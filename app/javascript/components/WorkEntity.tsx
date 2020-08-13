import React from 'react';
import { FormGroup } from './FormGroup';

export const WorkEntity = () => (
  <>
    <FormGroup label="物件" for="content_id" required>
      <input
        type="text"
        className="form-control"
        name="works[][work_content_id]"
        id="content_id"
        value="1"
      />
    </FormGroup>
    <FormGroup label="内容" for="property_id" required>
      <input
        type="text"
        className="form-control"
        name="works[][work_property_id]"
        id="property_id"
        value="1"
      />
    </FormGroup>
    <FormGroup label="開始時刻" for="start_at" required>
      <input
        type="text"
        className="form-control"
        name="works[][start_at]"
        id="start_at"
        value="1"
      />
    </FormGroup>
    <FormGroup label="終了時刻" for="end_at" required>
      <input
        type="text"
        className="form-control"
        name="works[][end_at]"
        id="end_at"
        value="1"
      />
    </FormGroup>
    <FormGroup label="休憩を含む" for="include_rest">
      <input
        type="text"
        className="form-control"
        name="works[][include_rest]"
        id="include_rest"
        value="1"
      />
    </FormGroup>
  </>
);
