import React, { useState, useEffect } from "react";
import Timeline from "react-calendar-timeline";
// make sure you include the timeline stylesheet or the timeline will not be styled
import "react-calendar-timeline/lib/Timeline.css";
import useApi from "../../hooks/useApi";
import moment from "moment";
import useStaffApi from "../../hooks/useStaffApi";
import ShiftDetail from "./ShiftDetail";

import { Button } from "react-bootstrap";
import axios from "axios";
import { useHistory } from "react-router-dom";
import AddShift from "./AddShift";

// const staff = ["Peter", "Glen", "Shailesh", "John"];

const createNext15MinuteTime = () => {
  let minutes15 = moment();
  minutes15 = Math.round(minutes15.minutes() / 15) * 15;
  let newStartTime = moment().minutes(minutes15);

  // console.log(newStartTime.toLocaleString());
  return newStartTime;
};

const itemStyles = {
  borderRadius: "5px",
  color: "red",
};

function Roster({
  shifts,
  groups,
  weekNumber,
  create,
  startDate,
  endDate,
  title,
}) {
  // const { shifts: groups, request: getAllGroups } = useApi(
  //   "/groups"

  // );
  console.log("^^^^^", new Date(startDate).toISOString());
  console.log("groups", groups);
  console.log("start date = " + startDate + " end date = " + endDate);
  const [items, setItems] = useState(shifts);
  const [roles, setRoles] = useState(groups);
  const [rosterWeekNumber, setRosterWeekNumber] = useState(weekNumber);
  const [shiftDetails, setShiftDetails] = useState(null);
  const [addShift, setAddShift] = useState(null);
  const { data: staff, request: getStaff } = useApi("/staff/roles");
  const [startTime, setStartTime] = useState(new Date(startDate));
  const [endTime, setEndTime] = useState(moment(endDate).add(24, "hours"));
  let history = useHistory();

  const handleAllocation = (name, id, e, staffId) => {
    let newItems = [...items];

    // debugger;
    for (let i = 0; i < newItems.length; i++) {
      console.log("newItems[i].id = ", newItems[i].id);
      console.log("id = ", id);
      if (newItems[i].id === id) {
        console.log(newItems[i].title);
        newItems[i].title = name;
        console.log(newItems[i].title);
        console.log(("selected", newItems[i].selected));
        // e.target.textContent = name;
        newItems[i].staff_id = staffId;

        break;
      }
    }

    setShiftDetails(null);
    setItems([...newItems]);
  };

  const handleDeallocate = (name, id, e) => {
    let newItems = [...items];

    for (let i = 0; i < newItems.length; i++) {
      if (newItems[i].id === id) {
        console.log(newItems[i].title);
        newItems[i].title = "Unallocated";
        console.log(newItems[i].title);
        //e.target.textContent = "unallocated";
        newItems[i].staff_id = "none";

        break;
      }
    }
    setShiftDetails(null);
    setItems([...newItems]);
  };
  // All staff from database
  const handleRemoveShift = (shiftId) => {
    let newItems = [...items];

    for (let i = 0; i < newItems.length; i++) {
      if (newItems[i].shift_id === shiftId) {
        newItems.isallocated = false;
        newItems.splice(i, 1);
        break;
      }
    }
    setShiftDetails(null);
    setItems([...newItems]);
  };

  const handleAddShift = () => {
    setAddShift(true);
  };

  const transformTimes = () => {
    let transformedData = [...shifts];
    for (let i = 0; i < shifts.length; i++) {
      console.log(
        "transformedData[i].start_time",
        transformedData[i].start_time
      );
      transformedData[i].start_time = moment.unix(
        transformedData[i].start_time
      );
      transformedData[i].end_time = moment.unix(transformedData[i].end_time);
      transformedData[i].id = i + 1;
    }

    console.log(2);
    // console.log("default items === ", defaultItems);
    console.log("transform items === ", transformedData);
    setItems(transformedData);
    console.log(3);
  };

  console.log("items ===", items);

  useEffect(() => {
    console.log(1);
    transformTimes();
    getStaff();

    // getAllGroups();
  }, []);
  {
    // console.log("items ===", items);
  }
  console.log(4);
  console.log("items ===", items);

  const handleItemResize = (itemId, time, edge) => {
    console.log("resize time = ", time);
    console.log("unix ", moment(time).toLocaleString());
    const newItems = [...items];
    newItems.forEach((item) => {
      const oldStartTime = item.start_time;
      const oldEndTime = item.end_time;
      const duration = oldEndTime - oldStartTime;
      if (item.id === itemId) {
        if (
          moment(time).unix() > moment(item.start_time).add(2.75, "hour").unix()
        ) {
          item.end_time = time;
          console.log(item.title);
          console.log("duration", duration / 60 / 1000);
        } else {
          alert("Minimum shift is 3hrs");
        }
      }
    });
    setItems([...newItems]);
  };

  const handleItemMove = (itemId, time) => {
    const newItems = [...items];
    newItems.forEach((item) => {
      const oldStartTime = item.start_time;
      const oldEndTime = item.end_time;
      const duration = oldEndTime - oldStartTime;
      if (item.id === itemId) {
        item.start_time = time;
        item.end_time = time + duration;
      }
    });
    setItems([...newItems]);
  };

  const handleItemClick = (itemId, e, time) => {
    // debugger;
    console.log("clicked ", itemId, e, time);

    for (let i = 0; i < items.length; i++) {
      if (items[i].id === itemId) {
        console.log("Name = ", items[i].title);
        console.log(
          "Start time = ",
          moment(items[i].start_time).toLocaleString()
        );
        console.log(
          "Finish time = ",
          moment(items[i].end_time).toLocaleString()
        );

        const duration = items[i].end_time - items[i].start_time;

        console.log("staff id = ", items[i].staffId);
        console.log("staff = ", staff);
        console.log("duration = ", duration / 60 / 1000 / 60);
        let filteredStaff = staff.filter((member) => {
          if (member.staff_role_id === items[i].group) {
            return member;
          }
        });
        console.log("filtered staff", filteredStaff);
        setShiftDetails({
          startTime: items[i].start_time,
          endTime: items[i].end_time,
          name: items[i].title,
          event: e,
          filteredStaff: filteredStaff,
          id: items[i].id,
          shiftId: items[i].shift_id,
        });
        return;
      }
    }
  };
  const handleSubmit = async (e) => {
    // debugger;
    e.preventDefault();
    if (create) {
      try {
        const response = await axios.post("/roster", {
          shifts: items,
          weekNumber,
          title,
          startDate,
          endDate,
        });
        if (response.status === 200) {
          console.log(response.statusText);
          history.replace("/admin");
        }
      } catch (error) {
        alert(
          `${error.response.statusText} \n${error}\n${error.response.data}`
        );
      }
    } else {
      try {
        const response = await axios.put("/roster", {
          shifts: items,
          weekNumber,
        });
        if (response.status === 200) {
          console.log(response.statusText);
          history.replace("/admin");
        }
      } catch (error) {
        alert(
          `${error.response.statusText} \n${error}\n${error.response.data}`
        );
      }
    }
  };

  return (
    <div>
      <div>
        <h1>Week Number: {rosterWeekNumber}</h1>
        <h2>Start Date: {startTime.toLocaleDateString()}</h2>
        <h2>End Date: {new Date(endDate).toLocaleDateString()}</h2>
      </div>
      <div className="button-panel">
        <Button
          className="btn btn-green my-3 btn-block mr-2"
          onClick={handleSubmit}
        >
          {create ? "Save Roster" : "Update Roster"}
        </Button>
        <Button
          className="btn btn-primary my-3 btn-block mr-2"
          onClick={handleAddShift}
        >
          Add Shift
        </Button>
        <Button href="/admin" className="btn btn-primary my-3 btn-block mr-2">
          close
        </Button>
      </div>
      <Timeline
        className="timeline"
        onItemContextMenu={(id, e, time) => console.log("context", id, e)}
        groups={roles}
        items={items}
        onItemResize={(itemId, time, edge) =>
          handleItemResize(itemId, time, edge)
        }
        defaultTimeStart={startTime}
        defaultTimeEnd={endTime}
        lineHeight={100}
        onItemMove={(itemId, time) => handleItemMove(itemId, time)}
        onItemClick={(itemId, e, time) => handleItemClick(itemId, e, time)}
        itemRenderer={({
          item,
          timelineContext,
          itemContext,
          getItemProps,
          getResizeProps,
        }) => {
          const {
            left: leftResizeProps,
            right: rightResizeProps,
          } = getResizeProps();
          const backgroundColor = itemContext.selected
            ? itemContext.dragging
              ? "red"
              : "beige"
            : itemContext.title.toLowerCase() === "unallocated"
            ? "red"
            : "green";
          const borderColor = itemContext.resizing ? "red" : item.color;
          return (
            <div
              {...getItemProps({
                style: {
                  backgroundColor,
                  color: item.color,
                  // borderColor,
                  // borderStyle: "solid",
                  // borderWidth: 1,
                  borderRadius: 4,
                  borderLeftWidth: itemContext.selected ? 3 : 1,
                  borderRightWidth: itemContext.selected ? 3 : 1,
                },
              })}
            >
              {itemContext.useResizeHandle ? (
                <div {...leftResizeProps} />
              ) : null}

              <div
                style={{
                  height: "100%",
                  display: "flex",
                  flexDirection: "column",
                  overflow: "hidden",
                }}
              >
                <div
                  style={{
                    height: "100%",
                    lineHeight: "initial",
                    textAlign: "left",
                  }}
                >
                  Start:
                  {moment(item.start_time).format("h:mm a")}
                </div>
                <div
                  style={{
                    height: "100%",
                    lineHeight: "initial",
                  }}
                >
                  {itemContext.title}
                </div>
                <div
                  style={{
                    height: "100%",
                    textAlign: "left",
                    lineHeight: "initial",
                  }}
                >
                  End: {moment(item.end_time).format("h:mm a")}
                </div>
              </div>
              {/* <div
                style={{
                  height: itemContext.dimensions.height,
                  overflow: "hidden",
                  paddingLeft: 3,
                  textOverflow: "ellipsis",
                  whiteSpace: "nowrap",
                }}
              >
                {itemContext.title}
              </div> */}

              {itemContext.useResizeHandle ? (
                <div {...rightResizeProps} />
              ) : null}
            </div>
          );
        }}
        timeSteps={{
          minute: 30,
          hour: 1,
          day: 1,
          month: 1,
          year: 1,
        }}
      />
      {shiftDetails && (
        <ShiftDetail
          staff={shiftDetails.filteredStaff}
          startTime={shiftDetails.startTime}
          endTime={shiftDetails.endTime}
          handleAllocate={handleAllocation}
          name={shiftDetails.name}
          handleDeallocate={handleDeallocate}
          handleRemoveShift={handleRemoveShift}
          handleClose={() => {
            setShiftDetails(null);
          }}
          event={shiftDetails.event}
          id={shiftDetails.id}
          shiftId={shiftDetails.shiftId}
        />
      )}
      {addShift && (
        <AddShift
          groups={roles}
          handleClose={() => {
            setAddShift(null);
          }}
          handleAddItem={setItems}
          items={items}
          handleSetAddShift={setAddShift}
          weekNumber={weekNumber}
          startDate={startTime}
        />
      )}
    </div>
  );
}

export default Roster;
