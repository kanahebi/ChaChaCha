import React, { useState } from 'react';
import { WorkEntity } from './WorkEntity';

const DailyReportWorksForm = () => {
  const [worksCount, setWorksCount] = useState(1);

  const handleAdd = () => {
    setWorksCount(worksCount + 1);
    console.log(worksCount);
  };

  return (
    <>
      {Array(worksCount).fill(null).map((_, i) => <WorkEntity key={i} />)}
      <button type="button" onClick={handleAdd}>add</button>
    </>
  );
};

export default DailyReportWorksForm;
