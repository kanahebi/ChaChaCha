import React from 'react';

interface IWorkEntity {
  work: Work
}

export const WorkEntity = ({ work }: IWorkEntity) => (
  <>
    {work.endAt}
  </>
);
