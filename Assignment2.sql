DROP table if exists videostable;
DROP table if exists reviewerstable;

CREATE TABLE videostable
( 
	vidID varchar(10) not null,
    vidtitle varchar(30) not null,
    vidlength int primary key,
    vidurl varchar(50) not null
);

CREATE TABLE reviewerstable
( 
	vidid varchar(10) not null,
	revname varchar(30),
    revrating float,
    revtext varchar(60)
);

INSERT INTO videostable ( vidID, vidtitle, vidlength, vidurl ) VALUES (1, 'CrashCourse Telescopes', 12, 'https://www.youtube.com/watch?v=mYhy7eaazIk');
INSERT INTO videostable ( vidID, vidtitle, vidlength, vidurl ) VALUES (2, 'CrashCourse Gravity', 10, 'https://www.youtube.com/watch?v=TRAbZxQHlVw');
INSERT INTO videostable ( vidID, vidtitle, vidlength, vidurl ) VALUES (3, 'CrashCourse Venus', 11, 'https://www.youtube.com/watch?v=ZFUgy3crCYY');

INSERT INTO reviewerstable ( vidid, revname, revrating, revtext ) VALUES (1, 'John', 5, 'Excellent video');
INSERT INTO reviewerstable ( vidid, revname, revrating, revtext ) VALUES (1, 'Hank', 4, 'Pretty good explanation of telescopes');
INSERT INTO reviewerstable ( vidid, revname, revrating, revtext ) VALUES (2, 'John', 4.5, 'Gravity is amazing!');
INSERT INTO reviewerstable ( vidid, revname, revrating, revtext ) VALUES (2, 'Hank', 3, 'Decent enough. It should have covered quantum gravity');
INSERT INTO reviewerstable ( vidid, revname, revrating, revtext ) VALUES (3, 'John', 4.5, 'The other planets in our solar system are so cool!');
INSERT INTO reviewerstable ( vidid, revname, revrating, revtext ) VALUES (3, 'Hank', 5, 'Excellent! A++');

SELECT videostable.vidID, vidtitle, vidlength, vidurl, reviewerstable.revname, reviewerstable.revrating, reviewerstable.revtext FROM videostable
JOIN reviewerstable ON videostable.vidID = reviewerstable.vidid
#WHERE revname='John' ORDER BY vidID
#WHERE revname='Hank' ORDER BY vidID
