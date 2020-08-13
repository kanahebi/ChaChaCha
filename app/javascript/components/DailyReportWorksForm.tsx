import React from 'react';
import { FormGroup } from './FormGroup';

const DailyReportWorksForm = () => (
  <>
    <FormGroup>
      <input
        type="text"
        className="form-control"
        name="works[][work_content_id]"
        id="works__work_content_id"
        value="1"
      />
    </FormGroup>
    <FormGroup>
      <input
        type="text"
        className="form-control"
        name="works[][work_property_id]"
        id="works__work_property_id"
        value="1"
      />
    </FormGroup>
    <FormGroup>
      <input
        type="text"
        className="form-control"
        name="works[][start_at]"
        id="works__start_at"
        value="1"
      />
    </FormGroup>
    <FormGroup>
      <input
        type="text"
        className="form-control"
        name="works[][end_at]"
        id="works__end_at"
        value="1"
      />
    </FormGroup>
    <FormGroup>
      <input
        type="text"
        className="form-control"
        name="works[][include_rest]"
        id="works__include_rest"
        value="1"
      />
    </FormGroup>
  </>
);

export default DailyReportWorksForm;
