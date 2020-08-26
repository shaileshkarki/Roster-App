import React, { useEffect, useState } from "react";
import { MDBRow, MDBCol } from "mdbreact";
import PaginationTable from "rbtpagination";
// import "../../node_modules/rbtpagination/dist/index.css";
import LeftSidebar from "../LeftSidebar";

const weekInfo = {
  weekStart: "Wed Aug 26 2020",
  duration: 7,
};
const defaultItems = [
  {
    id: 12,
    group: 1,
    staff_name: "Nick",
    start_time: "7:00",
    end_time: "3:00",
    date: "Sun Aug 30 2020",
  },
  {
    id: 1,
    group: 1,
    staff_name: "John",
    start_time: "5:00",
    end_time: "8:15",
    date: "Wed Aug 26 2020",
  },
  {
    id: 2,
    group: 1,
    staff_name: "John",
    start_time: "5:00",
    end_time: "8:15",
    date: "Thu Aug 27 2020",
  },
  {
    id: 3,
    group: 1,
    staff_name: "John",
    start_time: "5:00",
    end_time: "8:15",
    date: "Fri Aug 28 2020",
  },
  {
    id: 4,
    group: 1,
    staff_name: "John",
    start_time: "5:00",
    end_time: "8:15",
    date: "Sat Aug 29 2020",
  },
  {
    id: 5,
    group: 1,
    staff_name: "John",
    start_time: "5:00",
    end_time: "8:15",
    date: "Sun Aug 30 2020",
  },
  {
    id: 6,
    group: 1,
    staff_name: "John",
    start_time: "5:00",
    end_time: "8:15",
    date: "Mon Aug 31 2020",
  },

  {
    id: 9,
    group: 1,
    staff_name: "Nick",
    start_time: "7:00",
    end_time: "3:00",
    date: "Thu Aug 27 2020",
  },
  {
    id: 10,
    group: 1,
    staff_name: "Nick",
    start_time: "7:00",
    end_time: "3:00",
    date: "Fri Aug 28 2020",
  },

  {
    id: 11,
    group: 1,
    staff_name: "Nick",
    start_time: "7:00",
    end_time: "3:00",
    date: "Sat Aug 29 2020",
  },

  {
    id: 13,
    group: 1,
    staff_name: "Nick",
    start_time: "7:00",
    end_time: "3:00",
    date: "Mon Aug 31 2020",
  },
  {
    id: 8,
    group: 1,
    staff_name: "Nick",
    start_time: "7:00",
    end_time: "3:00",
    date: "Wed Aug 26 2020",
  },

  {
    id: 16,
    group: 1,
    staff_name: "Aron",
    start_time: "12:00",
    end_time: "5:00",
    date: "Tue Sep 01 2020",
  },
  {
    id: 15,
    group: 1,
    staff_name: "Aron",
    start_time: "12:00",
    end_time: "5:00",
    date: "Wed Aug 26 2020",
  },
];
const searchByCriteraiList = [
  { label: "ID", key: "id" },
  { label: "Group", key: "group" },
  { label: "Name", key: "staff_name" },
  { label: "Start", key: "start_time" },
  { label: "End", key: "end_time" },
  { label: "Date", key: "date" },
];
const tableColumnsAndDataKeys = [
  { label: "ID", key: "id" },
  { label: "Group", key: "group" },
  { label: "Name", key: "staff_name" },
  { label: "Start", key: "start_time" },
  { label: "End", key: "end_time" },
  { label: "Date", key: "date" },
];
let blankDate = {
  id: 16,
  group: 1,
  staff_name: "Susan",
  start_time: "12:00",
  end_time: "5:00",
  date: "",
};

function RosterTemplate(props) {
  const fillingRoster = () => {
    const uniqueStaff = [];

    for (var i = 0; i < defaultItems.length; i++) {
      if (!uniqueStaff.includes(defaultItems[i].staff_name))
        uniqueStaff.push(defaultItems[i].staff_name);
    }
    let temp = [];

    uniqueStaff.forEach((staff) => {
      temp.push(
        defaultItems.filter((currentStaff) => {
          if (currentStaff.staff_name === staff) return currentStaff;
        })
      );
    });
    let match = false;
    let startDate = new Date(weekInfo.weekStart);
    console.log("temp[0]", temp[0]);
    temp.forEach((staffMember, index) => {
      for (var i = 0; i < 7; i++) {
        match = false;
        var date = new Date();
        date.setDate(startDate.getDate() + i);
        staffMember.forEach((shifts) => {
          if (shifts.date == date.toDateString()) {
            match = true;
            console.log(
              "staffMember.date equals date",
              shifts.staff_name,
              shifts.date
            );
          }
        });
        if (match == false) {
          staffMember.push(blankDate);
        }
      }
    });
    let arr1 = [];
    temp.forEach((arr2) => {
      arr1.push(...arr2);
    });
    return arr1;
  };
  const [rosterData, setRosterData] = useState([]);
  const loadData = () => {
    setRosterData(fillingRoster());
  };
  useEffect(() => {
    loadData();
  }, []);
  //   setRosterData(fillingRoster());
  console.log(rosterData);
  return (
    <div>
      <MDBRow center>
        <MDBCol sm="12" md="12" lg="12" xl="12">
          <LeftSidebar />
        </MDBCol>
      </MDBRow>
      <PaginationTable
        dataSet={rosterData}
        searchData={searchByCriteraiList}
        tableData={tableColumnsAndDataKeys}
        handleItemClick={true}
        itemClickRedirect="/StaffEditScreen"
        itemsPerPage={20}
      />
    </div>
  );
}

export default RosterTemplate;
