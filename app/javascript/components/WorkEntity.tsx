import React from 'react';

interface IWorkEntity {
  work: Work
}

export const WorkEntity = ({ work }: IWorkEntity) => (
  <>
    <div>{work.workContentId}</div>
    <div>{work.workPropertyId}</div>
    <div>{work.startAt}</div>
    <div>{work.endAt}</div>
    <div>{work.includeRest}</div>
    <input
      type="hidden"
      className="form-control"
      name="works[][work_content_id]"
      value={work.workContentId}
    />
    <input
      type="hidden"
      className="form-control"
      name="works[][work_property_id]"
      value={work.workPropertyId}
    />
    <input
      type="hidden"
      className="form-control"
      name="works[][start_at]"
      value={work.startAt}
    />
    <input
      type="hidden"
      className="form-control"
      name="works[][end_at]"
      value={work.endAt}
    />
    <input
      type="hidden"
      className="form-control"
      name="works[][include_rest]"
      value={work.includeRest ? 1 : 0}
    />
  </>
);
