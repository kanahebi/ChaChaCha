import React from 'react';

interface IWorkEntity {
  work: Work
}

export const WorkEntity = ({ work }: IWorkEntity) => (
  <div className="work-entity">
    <div className="operation">
      <button type="button" className="delete-button">
        <i className="fas fa-minus-circle" />
      </button>
    </div>
    <div className="body">
      <div className="work-range">
        <span>{work.startAt}</span>
        -
        <span>{work.endAt}</span>
      </div>
      <div className="work-content">
        <i className="icon fab fa-font-awesome-flag" />
        {' '}
        {work.workContentId}
      </div>
      <div className="work-property">
        <i className="icon fas fa-list" />
        {' '}
        {work.workPropertyId}
      </div>
      {
        work.includeRest && (
        <div className="include-rest">
          <i className="fas fa-utensils" />
        </div>
        )
      }
    </div>
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
  </div>
);
