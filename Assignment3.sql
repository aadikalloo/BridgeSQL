/* Each user belongs to only one group => One-to-many   */
/* Each group can access multiple rooms and each room can be accessed by multiple groups => many to many */

drop table if exists userinfo, groupinfo, roominfo, usergrouproom;

create table userinfo
(	userID int,
    username varchar(30)
);

create table groupinfo
(	groupID int,
    groupname varchar(30)
);

create table roominfo
(	roomID int,
    roomname varchar(30)
);

/* create linking table of three columns*/
create table usergrouproom
(	userID int,
    groupID int,
    roomID int
);

INSERT INTO userinfo (userID, username) VALUES (1, 'Modesto');
INSERT INTO userinfo (userID, username) VALUES (2, 'Ayine');
INSERT INTO userinfo (userID, username) VALUES (3, 'Christopher');
INSERT INTO userinfo (userID, username) VALUES (4, 'Cheong woo');
INSERT INTO userinfo (userID, username) VALUES (5, 'Saulat');
INSERT INTO userinfo (userID, username) VALUES (6, 'Heidy');

INSERT INTO groupinfo (groupID, groupname) VALUES (1, 'IT');
INSERT INTO groupinfo (groupID, groupname) VALUES (2, 'SALES');
INSERT INTO groupinfo (groupID, groupname) VALUES (3, 'ADMIN');
INSERT INTO groupinfo (groupID, groupname) VALUES (4, 'OPERATIONS');

INSERT INTO roominfo (roomID, roomname) VALUES (1, 'Room 101');
INSERT INTO roominfo (roomID, roomname) VALUES (2, 'Room 102');
INSERT INTO roominfo (roomID, roomname) VALUES (3, 'Auditorium A');
INSERT INTO roominfo (roomID, roomname) VALUES (4, 'Auditorium B');

INSERT INTO usergrouproom VALUES (1,1,1);
INSERT INTO usergrouproom VALUES (1,1,2);
INSERT INTO usergrouproom VALUES (2,1,1);
INSERT INTO usergrouproom VALUES (2,1,2);
INSERT INTO usergrouproom VALUES (3,2,2);
INSERT INTO usergrouproom VALUES (3,2,3);
INSERT INTO usergrouproom VALUES (4,2,2);
INSERT INTO usergrouproom VALUES (4,2,3);
INSERT INTO usergrouproom VALUES (5,3,NULL);
INSERT INTO usergrouproom VALUES (6,NULL,NULL);

#Question 1
SELECT DISTINCT  userinfo.username AS 'Employee', groupinfo.groupname as 'Group'
	from usergrouproom
	LEFT JOIN userinfo ON usergrouproom.userID=userinfo.userid
	LEFT JOIN groupinfo ON usergrouproom.groupID=groupinfo.groupid;

#Question 2
SELECT DISTINCT roominfo.roomname as 'Room', groupinfo.groupname AS 'Group'
	from usergrouproom
	RIGHT JOIN groupinfo ON usergrouproom.groupID=groupinfo.groupID
    RIGHT JOIN roominfo ON usergrouproom.roomID=roominfo.roomID;
    
#Question 3
SELECT DISTINCT userinfo.username as 'User', groupinfo.groupname as 'Group', roominfo.roomname as 'Room'
	FROM usergrouproom
    LEFT JOIN userinfo ON usergrouproom.userID=userinfo.userid
    LEFT JOIN groupinfo ON usergrouproom.groupID=groupinfo.groupID
    LEFT JOIN roominfo ON usergrouproom.roomID=roominfo.roomID
    ORDER BY userinfo.username, groupinfo.groupname, roominfo.roomname;
