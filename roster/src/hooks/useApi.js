import { useState } from "react";
import axios from "axios";

export default function useApi(api) {
  const [data, setData] = useState([]);

  const request = async () => {
    const response = await axios.get(api);

    setData(response.data);
    return response;
  };

  return {
    data,
    request,
  };
}
