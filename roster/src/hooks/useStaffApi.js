import { useState } from "react";
import axios from "axios";

export default function useStaffApi() {
  const [data, setData] = useState([]);
  const [isLastPage, setIsLastPage] = useState(false);

  const request = async (currentPage, numberOfRecords) => {
    const response = await axios.get("http://localhost:9000/staff");
    console.log("1" + data);
    let staff = [];
    const startPosition = currentPage * numberOfRecords;
    for (
      let i = startPosition;
      i < startPosition + numberOfRecords && i < response.data.length;
      i++
    ) {
      staff.push(response.data[i]);
      if (startPosition + numberOfRecords === response.data.length) {
        setIsLastPage(true);
      }
    }
    setData(staff);
    return response;
  };

  return {
    data,
    request,
    isLastPage,
  };
}
