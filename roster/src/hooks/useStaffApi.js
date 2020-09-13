import { useState } from "react";
import axios from "axios";

export default function useStaffApi() {
  const [data, setData] = useState([]);

  const request = async () => {
    const response = await axios.get("/staff/withroles");

    setData(response.data);
    return response;
  };

  return {
    data,
    request,
  };
}
