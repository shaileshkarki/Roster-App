import React from "react";
import Timeline from "react-calendar-timeline";
// make sure you include the timeline stylesheet or the timeline will not be styled
import "react-calendar-timeline/lib/Timeline.css";
import moment from "moment";

const groups = [
  { id: 1, title: "Developers", stackItems: true },
  { id: 2, title: "Managers", stackItems: true },
];

const createNext15MinuteTime = () => {
  let minutes15 = moment();
  minutes15 = Math.round(minutes15.minutes() / 15) * 15;
  let newStartTime = moment().minutes(minutes15);

  console.log(newStartTime.toLocaleString());
  return newStartTime;
};

const itemStyles = {
  background: "dodgerblue",
  borderRadius: "5px",
  color: "yellow",
};

const defaultItems = [
  {
    id: 1,
    group: 1,
    title: "Unallocated 1",
    start_time: createNext15MinuteTime(),
    end_time: createNext15MinuteTime().add(4.5, "hour"),
    itemProps: {
      style: itemStyles,
    },
  },
  {
    id: 2,
    group: 2,
    title: "Unallocated 2",
    start_time: createNext15MinuteTime(),
    end_time: createNext15MinuteTime().add(3.25, "hour"),
    itemProps: {
      style: itemStyles,
    },
  },
  {
    id: 3,
    group: 1,
    title: "Unallocated 3",
    start_time: createNext15MinuteTime(),
    end_time: createNext15MinuteTime().add(6, "hour"),
    itemProps: {
      style: itemStyles,
    },
  },
  {
    id: 4,
    group: 1,
    title: "Unallocated 4",
    start_time: createNext15MinuteTime(),
    end_time: createNext15MinuteTime().add(5.5, "hour"),
    canMove: true,
    canResize: true,
    itemProps: {
      style: itemStyles,
    },
  },
  {
    id: 5,
    group: 2,
    title: "Unallocated 5",
    start_time: createNext15MinuteTime(),
    end_time: createNext15MinuteTime().add(3, "hour"),
    itemProps: {
      style: itemStyles,
    },
  },
  {
    id: 6,
    group: 1,
    title: "Unallocated 6",
    start_time: createNext15MinuteTime(),
    end_time: createNext15MinuteTime().add(4, "hour"),
    itemProps: {
      style: itemStyles,
    },
  },
  {
    id: 7,
    group: 1,
    title: "Unallocated 7",
    start_time: createNext15MinuteTime(),
    end_time: createNext15MinuteTime().add(5.25, "hour"),
    canMove: true,
    canResize: true,
    itemProps: {
      style: itemStyles,
    },
  },
  {
    id: 8,
    group: 2,
    title: "Unallocated 8",
    start_time: createNext15MinuteTime(),
    end_time: createNext15MinuteTime().add(3.25, "hour"),
    itemProps: {
      style: itemStyles,
    },
  },
  {
    id: 9,
    group: 1,
    title: "Unallocated 9",
    start_time: createNext15MinuteTime(),
    end_time: createNext15MinuteTime().add(3, "hour"),
    itemProps: {
      style: itemStyles,
    },
  },
  {
    id: 10,
    group: 1,
    title: "Unallocated 10",
    start_time: createNext15MinuteTime().add(4, "hour"),
    end_time: createNext15MinuteTime().add(7, "hour"),
    itemProps: {
      style: itemStyles,
    },
  },
];
function Roster(props) {
  return (
    <Timeline
      defaultTimeStart={moment().add(-6, "hour")}
      defaultTimeEnd={moment().add(6, "hour")}
      groups={groups}
      items={defaultItems}
    />
  );
}

export default Roster;
