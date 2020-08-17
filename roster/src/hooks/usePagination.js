import { useState } from "react";

export default function usePagination() {
  const [paginationData, setPaginationData] = useState([]);

  let data = [];
  const paginate = (list, currentPage, numberOfRecords) => {
    console.log("list = ", list);
    const startPosition = currentPage * numberOfRecords;
    for (
      let i = startPosition;
      i < startPosition + numberOfRecords && i < list.length;
      i++
    ) {
      data.push(list[i]);
    }
    setPaginationData(data);
    return paginate;
  };
  return {
    paginationData,
    paginate,
  };
}
