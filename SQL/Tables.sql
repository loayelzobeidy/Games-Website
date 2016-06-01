--Create Database Social_website ;

Create table Members
(
email varchar(150) Primary Key,

password varchar(50),
preferred_game_genre varchar(50),
type varchar(50)
);

create table Normal_Users
(
normal_user_email varchar(150) primary key,
first_name nvarchar(50),
last_name nvarchar(50),
date_of_birth datetime,
age as dbo.function_getAge(date_of_birth),

constraint fk_Normal_user_Members FOREIGN KEY (normal_user_email) REFERENCES Members(email) ON Delete CASCADE on update no action
);

create table Normal_Users_add_friend_Normal_Users(
Requesting_email varchar(150),
Receiving_email varchar(150),
accept bit ,
constraint pk_Normal_users_add_friend_Normal_users primary key (Requesting_email,Receiving_email),
constraint  fk_Normal_Users_add_friend_Normal_Users_Normal_Users foreign key(Requesting_email) references Normal_Users (normal_user_email) on delete cascade on update no action,
constraint  fk_Normal_Users_add_friend_Normal_Users_Normal_Users2 foreign key(Receiving_email) references Normal_Users (normal_user_email) 

);

Create table Messages
(
message_id int identity,
sender_email varchar(150),
reciever_mail varchar(150),
message_date datetime,
message_text varchar(max),
constraint pk_Messages primary key (message_id), -- because the same user can message the same user more than one ti
constraint  fk_Messages_Normal_Users foreign key(sender_email) references Normal_Users (normal_user_email) on delete cascade on update no action,
constraint  fk_Messages_Normal_Users2 foreign key(reciever_mail) references Normal_Users (normal_user_email) 
);

create table Development_Teams(
email varchar(150) ,
team_name varchar(50),
company varchar(50),
formation_date datetime ,
constraint pk_Development_Teams primary key (email),
constraint  fk_Development_Teams_Members foreign key(email) references Members (email) on delete cascade on update no action,

);

create table Verified_Reviewers -- years_of_experience derived attribute
(
email varchar(150),
first_name varchar(50),
last_name varchar(50),
Working_Since_year datetime,
years_of_experience as year(getdate())-year(Working_Since_year),

constraint pk_Verified_Reviewer primary key (email),
constraint  fk_Verified_Reviewer_Members foreign key(email) references Members (email) on delete cascade on update no action,
);


create table Communities(
theme varchar(50) Primary key,
name varchar (50),
description varchar(max)
);


create table Communities_created_by_Normal_Users
(
theme varchar(50),
normal_user_email varchar(150),
accept bit,
constraint pk_Normal_Users_create_Communities primary key (theme),
constraint  fk_Normal_Users_create_Communities_Normal_Users foreign key(normal_user_email) references Normal_Users (normal_user_email) on delete cascade on update no action,
constraint  fk_Normal_Users_create_Communities_Communities foreign key(theme) references Communities(theme) on delete cascade on update no action
);

create table Communities_joined_Members
(
theme varchar(50),
member_email varchar(150),
constraint pk_Communities_joined_Members primary key (theme,member_email),
constraint  fk_Communities_joined_Members foreign key(member_email) references Members (email) on delete cascade on update no action,
constraint  fk_Communities_joined_Members1 foreign key(theme) references Communities (theme) on delete cascade on update no action,

);

create table Topics  -- topic_id howa bas el primary key
(
topic_id int identity,
theme varchar(50),
title varchar(150),
description varchar(300),
member_email varchar(150),
constraint pk_Topics primary key (topic_id),
constraint  fk_Topics foreign key(member_email) references Members (email) on delete cascade on update no action,
constraint  fk_Topics1 foreign key(theme) references Communities (theme) on delete cascade on update no action,
);

create table Topic_Comments_by_members
(
comment_id int identity,
topic_id int,
comment_text varchar(max),
comment_date datetime ,
member_email varchar(150),
constraint pk_Topic_Comments primary key (comment_id,topic_id),
constraint  fk_Topic_Comments foreign key(member_email) references Members (email) on delete cascade on update no action ,
constraint  fk_Topic_Comments2 foreign key(topic_id) references Topics (topic_id) --hena keda lazm neshel rows el related le ay topic etshal manually
);

 

--Conference
create table Conferences(  -- duration derived attribute 
conference_id int identity , 
name varchar(50),
  start_date datetime ,
  end_date datetime, 
   duration_days as DATEDIFF(DAY,start_date,end_date),
  venue varchar(50),
  constraint pk_Conferences primary key (conference_id) 
);

create table Confrences_attended_Member
(
conference_id int ,
member_email varchar(150),
constraint pk_Confrences_attended_Member primary key (member_email,conference_id),
constraint  fk_Confrences_attended_Member foreign key(member_email) references Members (email) on delete cascade on update no action,
constraint  fk_Confrences_attended_Member2 foreign key(conference_id) references Conferences (conference_id) on delete cascade on update no action,
);
create table Conference_Reviews(
conference_review_id int identity , 
content varchar(Max),
Creation_date datetime,
conference_id int,
member_email varchar(150),
constraint pk_Confrence_Reviews primary key (conference_review_id,conference_id),
constraint  fk_Confrence_Reviews foreign key(member_email) references Members (email) on delete cascade on update no action,
constraint  fk_Confrence_Reviews1 foreign key(conference_id) references Conferences (conference_id) on delete cascade on update no action,
);

create table Conference_Review_Comments( -- msh lazm ,conference_review_id,conference_id yb2o primary keys kefaya conference_review_comment_id how unique lwa7do
conference_review_comment_id int identity ,
conference_review_id int ,
conference_id int ,
content varchar(max),
email varchar(150),
constraint pk_Conference_Review_Comments primary key (conference_review_comment_id) ,
constraint  fk_Conference_Review_Comments foreign key(email) references Members (email) on delete cascade on update no action,
constraint  fk_Confrence_Review_Comments2 foreign key(conference_review_id,conference_id) references Conference_Reviews (conference_review_id,conference_id)
);

create table  Games(
game_id int identity ,
name varchar(50),
release_date datetime, 
rating int ,
age_limit int , 
development_team_email varchar(150), 

constraint pk_Games primary key (game_id) ,
constraint  fk_Games foreign key( development_team_email) references Development_Teams(email) on delete cascade on update no action
   );


  create table Screenshots
  (
  screen_shot_id int identity, 
  game_id int, 
  screenshot_data varbinary(max), 
   date datetime,
   constraint pk_Screenshots primary key (screen_shot_id,game_id),
   constraint  fk_Screenshots foreign key(game_id) references Games(game_id) on delete cascade on update no action,
   );
   create table Videos  
   (
   video_id int identity , 
   game_id int , 
   video_data varbinary(max),
   date datetime ,
   constraint pk_Videos primary key (video_id,game_id),
   constraint fk_Videos foreign key(game_id) references Games(game_id) on delete cascade on update no action,
   );

   create table Sports(
   
   game_ID int ,
    type varchar(50),
   constraint pk_Sports primary key (game_ID),
   constraint fk_Sports foreign key(game_ID) references Games(game_id) on delete cascade on update no action,
   );

  create table Strategies(
  game_ID int ,
  realtime bit,
  
   constraint pk_Strategies primary key (game_ID),
   constraint fk_Strategies foreign key(game_ID) references Games(game_id) on delete cascade on update no action,
  );
  create table Actions(
  game_ID int,
  sub_genre varchar(250),
   constraint pk_Actions primary key (game_ID),
   constraint fk_Actions foreign key(game_ID) references Games(game_id) on delete cascade on update no action,
  );
  create table Rpgs(
  game int ,
  storyline varchar(max),
  pvp bit ,
  constraint pk_Rpgs primary key (game),
  constraint fk_Rpgs foreign key(game) references Games(game_id) on delete cascade on update no action,

  ) ;
 create table Rates(  -- mafesh level lwa7dha deh
  rate_id int identity,
  game_id int,
  
  graphics int ,

   level_design int ,
   interactivity int ,
   uniqueness int,
    member_email varchar(150),
   constraint pk_Rates primary key (game_id,rate_id),
  constraint fk_Rates foreign key(game_id) references Games(game_id) on delete cascade on update no action, 
  constraint  fk_rates2 foreign key(member_email) references Members (email) 
  ) ;
  create table Game_Reviews 
  (
  game_review_id int identity ,
  game_id int ,
  verified_reviewer_emial varchar(150),
  date datetime ,
  content varchar(max),
  constraint pk_Game_Reviews primary key (game_review_id,game_id) ,
  constraint fk_Game_Reviews foreign key(game_id) references Games(game_id) on delete cascade on update no action,
  constraint fk_Game_Reviews2 foreign key(verified_reviewer_emial) references  Verified_Reviewers(email)  

  )


  create table Game_Review_Comments(
  comment_id int identity,
  game_review_id int ,
  game_id int,
  member_email varchar(150),
  comment varchar(max)
  constraint pk_Game_Review_Comments primary key (comment_id,game_review_id,game_id),
   constraint  fk_Game_Review_Comments foreign key(game_review_id,game_id) references Game_Reviews(game_review_id,game_id) on delete cascade,
  constraint  fk_Game_Review_Comments2 foreign key(member_email) references Members (email)
  );

  create table Games_Created_by_Development_Teams_Presented_in_Conferences(
  conference_ID int,
  game_ID int,
  development_team_email varchar(150),
  constraint pk_Games_Created_by_Development_Teams_Presented_in_Conferences primary key (conference_ID,game_ID,development_team_email),
  constraint fk_Games_Created_by_Development_Teams_Presented_in_Conferences_Conference foreign key (conference_ID) references Conferences(conference_id) on delete cascade on update no action,
 constraint fk_Games_Created_by_Development_Teams_Presented_in_Conferences_games foreign key (game_ID) references Games(game_ID) ,
 constraint fk_Games_Created_by_Development_Teams_Presented_in_Conferences_development_teams foreign key (development_team_email) references Development_Teams(email) on delete cascade on update no action,
 
  );

  create table Normal_Users_Recommended_Games_to_Normal_Users (
  sender_email varchar(150),
  receiver_email varchar(150),
  game_ID int
  constraint pk_Normal_Users_Recommended_Games_to_Normal_Users primary key(sender_email,receiver_email,game_ID),
  constraint fk_Normal_Users_Recommended_Games_to_Normal_Users_Normal_Users1 foreign key(sender_email) references Normal_Users(normal_user_email) ,
   constraint fk_Normal_Users_Recommended_Games_to_Normal_Users_Normal_Users2 foreign key(receiver_email) references Normal_Users(normal_user_email) ,
    constraint fk_Normal_Users_Recommended_Games_to_Normal_Users_Games foreign key(game_ID) references Games(game_ID)  on delete cascade on update no action
  );