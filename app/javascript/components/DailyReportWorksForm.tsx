import React, { useState } from 'react';
import { WorkEntity } from './WorkEntity';

const DailyReportWorksForm = () => {
  const [worksCount, setWorksCount] = useState(1);

  const handleAdd = () => {
    setWorksCount(worksCount + 1);
  };

  return (
    <>
      {Array(worksCount).fill(null).map((_, i) => <WorkEntity key={i} />)}
      <button type="button" onClick={handleAdd}>&quot;報告する内容&quot;に追加</button>
    </>
  );
};

export default DailyReportWorksForm;
