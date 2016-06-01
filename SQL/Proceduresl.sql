---------------------as a Member user------------------
----1---
--takes email password genre type and allows a new user to sign up by inserting records into table Members
create proc sp_sign_up
@email varchar(150),
@password varchar(50),
@genre varchar(50),
@type varchar(50)
as
begin
insert into Members values(@email,@password,@genre,@type);

end
select * from members
execute sp_sign_up 'Kamo@gmail.com','heree1','Action','Normal User'


------------------------------------
-----2------
--Takes input name and select games with the entered name
create proc sp_search_by_name_for_games 
@name varchar(50)
as 
begin
select * from Games where name=@name;
end 

execute sp_search_by_name_for_games 'Blackops1' 

---takes input name and search by it for Conferences
create proc sp_search_by_name_for_Conferences 
@name varchar(50)
as 
begin
select * from Conferences where name=@name;
end


execute sp_search_by_name_for_Conferences 'Markaz el shabashy'


Create proc sp_search_by_name_for_Communities 
@theme varchar(50)
as 
begin
select * from Communities where theme=@theme;
end


execute sp_search_by_name_for_Communities 'To Talk About RPGS'


create proc sp_search_by_name_for_Verified_Reviewers 
@first_name varchar(150),
@last_name varchar(150)
as 
begin
select * from Verified_Reviewers where first_name=@first_name and last_name=@last_name;
end 


execute sp_search_by_name_for_Verified_Reviewers 'Hesham','Salah'

create proc sp_search_by_name_for_Development_Teams 
@name varchar(50)
as 
begin
select * from Development_Teams where team_name=@name;
end 

execute sp_search_by_name_for_Development_Teams 'TeamO'
-----------------------------------------------------------------
--------3--------
 

  Create proc sp_view_game 
    @name varchar(50)
  as
  begin

   declare @game_id int 
  select @game_id = game_id from Games where name=@name

  Declare @type varchar(50) =null, @realtime int = null , @sub_genre varchar(250) =null, @storyline varchar(max) =null , @pvp bit = null

  select @type = [type] from Sports where game_id=@game_id
  select @realtime = realtime from  Strategies where game_id=@game_id
   select @sub_genre = sub_genre  from Actions where game_id=@game_id
   select @storyline = storyline  from Rpgs where game=@game_id 
    select @pvp = pvp  from Rpgs where game=@game_id 

  select distinct g.name,release_date,age_limit,development_team_email,video_data,v.date as video_Date,screenshot_data,s.date as screenshot_date,game_review_id,content,@type as type,@realtime as realtime ,@sub_genre as sub_genre ,@storyline as storyline ,@pvp as pvp
  from  Games g,videos  v,ScreenShots  s  ,Game_reviews gr
  where g.name=@name
  end

  execute sp_view_game 'Pro Evolution Soccer'


  ----------------------------------------------------------------
  ------4---------
  CREATE PROC Rate_Games 
( @game_id int ,
 @graphics int ,
 @interactivity int,
 @uniqueness int,
 @level_design int,
 @email varchar(150)
 )
 AS
 INSERT INTO Rates(game_id,graphics,interactivity,uniqueness,level_design,member_email)
 VALUES(@game_id,@graphics,@interactivity,@uniqueness, @level_design,@email)
 

 execute Rate_Games 10,1,2,3,4,'hatem@gmail'

------------------------------------------------------------------------------- 
--------5----------
create proc sp_get_average_rate_of_A_game 
@name varchar(50),
 @average int out
as
begin
declare @game_id int 
select @game_id =  game_id from Games where name=@name;

-- bageb elaverage of column average elana 3mlto fe table elbyrg3 averge beta3 el 4 columns 
select  @average = AVG(average) from
(select game_id, (graphics+level_design+interactivity+uniqueness)/4 as average  from Rates where game_id=@game_id) as target;

end



declare @average int
execute sp_get_average_rate_of_A_game 'Street Fighter', @average output
select @average

-------------------------------------------------------------------------------------
--------6-------
--takes the email 
Create proc sp_view_reviews_of_game_I_rated  
@email varchar(150)
as
begin

select game_review_id,content 
from Game_Reviews gr inner join  (select game_id 
                                  from rates 
						  where member_email= @email) as tmp
on gr.game_id = tmp.game_id
inner join Verified_Reviewers vr
on vr.email=gr.verified_reviewer_emial
order by vr.years_of_experience desc
end

execute sp_view_reviews_of_game_I_rated 'nazih@gmail'

------------------------------------------------------------------------------------------
----------------7-------------------------
 -


  create proc sp_View_Conference --no insertions table matched it was too loady, so please insert new record and test them. Sorry for that
   
  @name varchar(50)
  as
  begin
  declare @id int
  select @id= conference_id from Conferences where name=@name
  

select tmp2.Conference_name,tmp2.start_date,tmp2.venue ,tmp.games_released_in_conference,tmp.development_team_email,tmp3.Development_teams_games
from
(select c.name as Conference_name,c.start_date,c.venue from Conferences c where c.conference_id=@id)as tmp2,
(select g4.name as games_released_in_conference , g2.development_team_email 
from Games_Created_by_Development_Teams_Presented_in_Conferences g2 inner join Games g4 on g2.game_id=g4.game_id where g2.conference_ID=@id) as tmp
,(select g1.name as Development_teams_games from Games g1 inner join Games_Created_by_Development_Teams_Presented_in_Conferences g3 on g1.development_team_email=g3.development_team_email) as tmp3



  end
  
  execute sp_View_Conference 'GUC'
 



 ---------------------------------------------------------------------------------------
 -------------------8-------------------------------
 create proc Add_Conferenceby_Members 
	 @email varchar(150),
	  @conference_id int 
	  as
	 insert into Confernces_attended_Member(email,conference_id)
	 values (@email,@conference_id)
 -----------------------------------------------------------------------------------

 --------------9---------------------
 
create   proc sp_add_conference_review_to_confernece_I_attended ------lesa makhsltsh
@email varchar(150),
@conference_name varchar(50),
@review  varchar(max)
as
begin


declare @ID int
select @ID=conference_id from Conferences where name=@conference_name;
if (exists (
Select member_email
from Conference_Reviews
where @email = member_email and @ID = conference_id))
insert into Conference_Reviews values (@review,GETDATE(),@ID,@email);
else 
select -1
end



 ----------------------------------------------------------------------------------------
 -----------10------------------
 create proc sp_delete_conference_review_I_wrote 
@email varchar(150)
as
begin
delete from Conference_Reviews where member_email=@email;
end
----------------------------------------------------------
---------------11---------------------------

create proc sp_Join_community
  
  @name varchar(150),
   @email varchar(150)
  as


  
declare @theme varchar(300)
 select @theme = theme
 from Communities
 where @name=name

 Insert into Communities_joined_Members values (@theme,@email)

 

 ---------------------------------------------------------
 --------------------------12-----------------
 create proc View_Community
	@theme varchar(150)
	as

	select  C.name,C.description ,tmp.member_email as members,tmp2.title,tmp2.description
	from Communities C, (select member_email 
	                     from Communities_joined_Members  
						  where theme=@theme ) as tmp , (select title,description 
						                                                from Topics 
																		where theme=@theme) as tmp2


 ------------------------------------------------------
 ---------------------13---------------------------
 create proc sp_post_topic_on_community
@email varchar(50),
@community_theme varchar(50),
@title varchar(150),
@description varchar(300)
as
begin
insert into Topics values(@community_theme,@title,@description,@email);
end

 --------------------------------------------------------
 -------------------------------14---------------------

 create proc sp_delete_topic_I_posted 
@email varchar(150)
as
begin
delete from Topics where member_email=@email;
end
------------------------------------------------------------------
------------------15--------------------------
  
  create proc sp_Comment_On_ConferenceReview
  @comment varchar(Max),
  @email varchar(150),
 @conferencereviewid int
 

  AS
 
 declare @conferenceid int
 select @conferenceid = conference_id
 from Conference_Reviews
 where @conferencereviewid=conference_review_id


 
  insert  Conference_Review_Comments(conference_review_id,conference_id,[content],email)  values (@conferencereviewid, @conferenceid, @comment,@email) 
  

  ------------------------------------------------------------------------------------------

   create proc sp_Comment_On_GameReview
  @comment varchar(Max),
  @email varchar(150),
   @gamereviewid int

  
  AS
  
 declare  @gameid int
 select @gameid=game_id
 from Game_Reviews
 where @gamereviewid=game_review_id
  insert  Game_Review_Comments(game_review_id,game_id,member_email,comment)  values (@gamereviewid, @gameid,@email,@comment)
  

  -----------------------------------------------------------------------------------------------------------------

  create proc sp_Topic_Comment
  @comment varchar(Max),
  @email varchar(150),
  @theme int
  
  AS 
  declare @date datetime , @Topic_ID int 
  select @Topic_ID = topic_id from Topics where theme=@theme
  set @date = CURRENT_TIMESTAMP
 insert Topic_Comments_by_members(topic_id,comment_text,comment_date,member_email)values(@Topic_ID,@comment,@date,@email)

 -----------------------------------------------------------------
 ---------------------------------16-------------------------
 create proc View_Comments_Conference_Review
	
	@conference_review_id  int 
	as
     select * 
	 from Conference_Review_Comments
	 where conference_review_id=@conference_review_id
 
 
 
 create proc View_Comments_Game_Review
	@game_review_id  int 
	as 
	   select * 
	  from Game_Reviews_Comments
	  where game_review_id=@game_review_id


create proc View_Topics_Community
	@email varchar(150),
	@theme varchar(150)
	as
	  select * 
	 from Topics
	 where theme=@theme and @email=member_email

 -------------------------------------------------
 ----------------17----------------------

 CREATE proc sp_delete_comment_on_conference_review
@ID int ,
@mail varchar(150)
as
DELETE from Conference_Review_Comments where @ID=conference_id AND @mail=email

create proc sp_delete_comment_on_game_review
@ID int ,
@mail varchar(150)
as
DELETE from Game_Review_Comments where @ID=comment_id  AND @mail=member_email



create proc  sp_delete_comment_on_topic
@Theme varchar(300),
@mail varchar(150)
as
Declare @ID int 
SELECT @ID=topic_id From Topics where theme=@theme
DELETE  From Topic_Comments_by_members   where @ID=topic_id

---------------------------------------------------------------------------------------------
 -------------------------------18--------------------------
 create proc sp_show_top5_members_attended_conferences_as_me  
@email varchar(150)
as
begin
declare @target_count int
select @target_count = count(*) 
                       from Confrences_attended_Member 
					   where member_email=@email 
					 

select email 
from Members
where email in
(select top(5) member_email as target_emails
from Confrences_attended_Member
group by member_email
having count(member_email)<=@target_count);
end

---------------------------------------------------------------------------------------------
-------------------------------------19---------------------------

drop proc View_Top_Recommended 
	@email varchar(150)
	as 
    select	top (10) count(*)
	from Normal_Users_Recommended_Normal_Users N ,Rates R
	where normal_user_2 = @email and normal_user_2 <>@email and N.game_id=R.game_id and R.member_email <>N.normal_user_2
	group by game_id
	order by count(*)


	alter proc View_Top_Recommended 
	@email varchar(150)
	as 
	begin
	
	select top(10) n.game_id,name
	from Normal_Users_Recommended_Games_to_Normal_Users n inner join Games g
	on n.game_id=g.game_id
	where n.receiver_email=@email
	group by name ,n.game_id
	
	except 
	
	select r.game_id,name from rates r full outer join games g on r.game_id=g.game_id where r.member_email=@email
	 group by name ,r.game_id
	

	except
	(select n.game_id,name  from Normal_Users_Recommended_Games_to_Normal_Users n inner join Games g
	                      on n.game_id=g.game_id
	                      where n.sender_email=@email)

						 

	end

	
	
	execute View_Top_Recommended 'tatawy@gmail'
-----------------------------------------------------------------------------------------
------------------------AS A NORMAL USER I CAN----------------------------------
------------------1--------------------------
create proc Update_Normal_User 
  
   @email varchar(150),
   @first_name varchar(50),
   @last_name varchar(50),
   @birthdate date
    as
	Update Normal_Users 
    set first_name = @first_name ,last_name=@last_name,date_of_birth=@birthdate 
	where normal_user_email=@email
---------------------------------------------------------------------------------------
------------------------------2------------------------------
create proc sp_send_friendship_to_members
@Sender_email varchar(150),
@Receiver_email varchar(150)
as
begin
insert into Normal_Users_add_friend_Normal_Users values (@Sender_email,@Receiver_email,null)
end

------------------------------------------------------------------
----------------------------3-----------------------------
create  proc sp_Normal_Users_search_for_friends 
@first_name nvarchar(50) = null ,
@last_name nvarchar(50) = null
as
begin
select *
from Normal_Users 
where ( (first_name like @first_name + '%') OR (@first_name is null )
      AND (last_name like @last_name + '%') OR (@last_name is null )
	  )
end

execute sp_Normal_Users_search_for_friends 'd','Tag'
------------------------------------------------------------------
---------------------------4---------------------------
 create proc sp_View_Pending_Friend_Request
 
  @email varchar (150)

  as
 select * from Games_Created_by_Development_Teams_Presented_in_Conferences
 select Requesting_email
 from Normal_Users_add_friend_Normal_Users 
 where Receiving_email= @email and accept = Null

 -----------------------------------------------------------------------
 ----------------------5-----------------------------------------------
 create proc Accept_Community 
@theme varchar(150)
as
update Communities_created_by_Normal_Users 
set accept= 1

  
  create proc Reject_Community 
@theme varchar(150)
as
update Communities_created_by_Normal_Users 
set accept= 0
-----------------------------------------------------------------
 -------------------------------7---------------------------------------
 create proc  sp_view_friend_profile  -- suppose that he is a friend of me and a norml uer at the same time

@email varchar(150)
as
begin

select Nu.first_name,NU.last_name,NU.age,tmp.name,tmp.start_date,tmp.end_date,tmp.duration_days,tmp.venue ,tmp2.name,tmp2.graphics,tmp2.level_design,tmp2.interactivity,tmp2.uniqueness 
from Normal_Users NU , (select c.name,c.start_date,c.end_date,c.duration_days,c.venue 
                        from Conferences c inner join Confrences_attended_Member cm
						on c.conference_id=cm.conference_id
						where cm.member_email=@email ) as tmp , (select g.name,r.graphics,r.level_design,r.interactivity,r.uniqueness 
						                                         from Games g inner join Rates r
																 on g.game_id=r.game_id
																 where r.member_email=@email ) as tmp2

end
 ----------------------------------------------------------------------
 ---------------------------8-----------------------

 create proc sp_Send_Message
 
 @message varchar(max),
 @recieveremail varchar(150),
 @Senderemail varchar(150)

 as
  declare @date datetime
 set @date = CURRENT_TIMESTAMP
 insert Messages (sender_email,reciever_mail,message_text,message_date) values(@Senderemail,@recieveremail, @Message, @date) 
 -------------------------------------------------------------------------------------
 -------------------------9-----------------------------------------

 create proc Normal_user_messages
	 @receiving_email varchar(150)
	 as 
	 select message_text
	 from Messages
	 where reciever_mail=@receiving_email

 --------------------------------------------------------------------------------------
 -------------------------------10--------------------------------
create proc sp_recommend_game
@game_name varchar(50),
@sender_mail varchar (150),
@reciever_mail varchar (150)
as
Declare @ID int 
select @ID= game_ID from Games WHERE name=@game_name
insert into Normal_Users_Recommended_Games_to_Normal_Users values(@sender_mail,@reciever_mail,@ID)

 
 ----------------------------------------------------------------------------------
 --------------------------11----------------------------------
create proc sp_view_My_Games_recommendations 
@email varchar(150)
as
begin
select G.name,N.first_name,N.last_name
from Normal_Users_Recommended_Games_to_Normal_Users R inner join Games G
on R.game_ID=G.game_id
inner join Normal_Users N
on R.sender_email=N.normal_user_email
where R.receiver_email=@email;

end
 ------------------------------------------------------------------------------------
 ----------------12---------------------------------------
  create proc sp_Request_Creating_Community --here where the request only is sent to the table Communities_created_by_Membwers then in other procedure it is entered in the community

@name varchar(150),
@description varchar(300),
@theme  varchar(150),
@email varchar(150)

as

declare @accept bit = null


insert into Communities_created_by_Normal_Users values(@theme,@email,@accept)
insert into Communities values(@theme, @name,@description)
 -----------------------------------------------------------------------------------
 --------------------AS A VERIFIED REVIEWER--------------------------------
 ------------------------------1-------------------------------------
 create proc Update_Verified_reviewer
    @email varchar(150),
	@first_name varchar(50),
	@last_name varchar(50)
		as 
	update Verified_Reviewers 
	set first_name=@first_name ,last_name=@last_name
	where email=@email
 -------------------------------------------------------------------------------------
 ---------------------------------2------------------------------------------
create proc sp_add_game_review -- T 
 @email varchar(150),
 @name varchar(50),
 @content varchar(max)
 as
 declare @date datetime
 set @date = CURRENT_TIMESTAMP
 declare @gameid int 
 Select @gameid =game_id
 from Games 
 where @name=name
 insert Game_Reviews (verified_reviewer_emial,game_id,date,content)values(@email,@gameid,@date,@content)

 
 ------------------------------------------------------------------------------------
 -------------------------------3------------------------------------
 create proc sp_delete_Game_Review_I_wrote 
@email varchar(150)
as
begin 
delete from Game_Reviews
 where verified_reviewer_emial=@email;
end

 --------------------------------------------------------------------------------
 ----------------------------4------------------------------------
 create proc sp_view_top10_game_reviewers_based_on_comments_number
as
begin
select top(10) * from
(select  gr.game_review_id,count(comment_id) as comments_number
from Game_Reviews gr inner join Game_Review_Comments grc
ON gr.game_review_id=grc.game_review_id  and gr.game_id=grc.game_id
group by gr.game_review_id ) as tmp inner join Game_Reviews g
on tmp.game_review_id = g.game_review_id
order by comments_number desc

end
 ----------------------------------------------------------------------------------
 ------------------------------AS A DEVELOPMENT TEAM--------------------------------
 -----------------------1------------------------
 create proc Update_developement_team 
	 @email varchar(150),
	 @team_name varchar(50),
	 @company varchar(50),
	 @formation_date date 
	 as
	Update Development_Teams 
    set team_name = @team_name ,company=@company,formation_date=@formation_date 
	where email=@email

 ----------------------------------------------------------------------------------
 ----------------2-------------------------
  create proc Add_Game_to_list--error needs to be handled
 @name  varchar(50),
 @release_date datetime , 
 @rating int ,
 @age_limit int ,
 @development_team_email varchar(150),
 @release_conference_id int 
 as 
   declare @id int 
 insert into Games(name,release_date,rating,age_limit,development_team_email,release_conference_id)
   values(@name,@release_date,@rating,@age_limit,@development_team_email,@release_conference_id)

  ( select @id= game_id 
    from Games
   where @name = name )

insert into Games_Created_by_Development_Teams_Presented_in_Conferences(conference_ID,game_ID,development_team_email)
values (@release_conference_id,@id,@development_team_email)
 -----------------------------3-----------------------------
 Create proc sp_add_Screenshots_to_game 

@screenshot varbinary(max) ,
@game_name varchar(50)
as
begin
 declare @game_id int
select @game_id = game_id from Games where name=@game_name

  insert into Screenshots values(@game_id,@screenshot,GETDATE())
  


end

Create proc sp_add_videos_to_game
@video varbinary(max),
@game_name varchar(50)
as
begin
declare @game_id int
select @game_id = game_id  from Games where name=@game_name
insert into Videos values(@game_id,@video,GETDATE())
end

 -----------------------------------------------------------------------------------

 ------------------4-----------------------
 create proc sp_DevelopmentTeam_Add_Attended_Conference_and_Games
 @conferencename varchar(50),
 @name varchar(50),
 @email varchar (150),
 @releasedate datetime, 
 @rating int ,
 @agelimit int
  
 as
 declare @conferenceid int
 select @conferenceid=conference_id
 from Conferences
 where name = @conferencename

 insert Confrences_attended_Member (conference_id,member_email) values (@conferenceid,@email)

 
 declare @gameid int
 Select @gameid = game_id
 from Games
 where name = @name
 
 insert into Games_Created_by_Development_Teams_Presented_in_Conferences values (@conferenceid,@gameid,@email)

 ----------------------------------------------------------------------------------
 ----------------------AS AN ADMIN---------------------------------
 ---------------------1----------------------
 create proc View_Community_requests
	as
	 select theme,normal_user_id
	 from Communities_created_Normal_Users
	 where accept=null

 --------------------------------------------------------------------------------------
 -----------------2--------------------------------
 create proc Accept_Community 
@theme varchar(150)
as
update Communities_created_by_Normal_Users 
set accept= 1

 
 create proc Reject_Community 
@theme varchar(150)
as
update Communities_created_by_Normal_Users
set accept=0
delete from  Communities
where theme=@theme
-------------------------------------------------------------------------------------------
------------------------3-----------------------------------
Create proc sp_verify_members   -- returns 1 if member is a Verified_Reviewer and 2 if member is a Development_Team
@email varchar(150),
@returnCount int out
as
begin
declare @Count1 int ,@Count2 int

select @Count1 = count(*) 
from Verified_Reviewers
where email=@email ;

select @Count2 = count(*) 
from Development_Teams
where email = @email;

if (@Count1>0)
begin
set @returnCount = 1;
end
else
if(@Count2>0)
begin
set @returnCount = 2;
end
end

------------------------------------------------------
----------------4-----------------------
 create proc sp_create_conference
 @name varchar(50),
 @startdate datetime,
 @enddate datetime,
 @venue varchar(50)
 as 
 insert Conferences (name,start_date,end_date,venue) values(@name,@startdate,@enddate,@venue)

---------------------------------------------------------------------------
--------5-------------------------
create proc Create_game
@name varchar(50),
 @release_date date ,
 @age_limit int ,
 @rating int 
 as
 insert into Games(name,release_date,rating,age_limit)
 values (@name,@release_date,0,@age_limit)
 ---------------------------------------------------------------------------
 -----------------------6--------------------------
 
 
 create proc sp_delete_community
@theme varchar(50)

 as 

 delete from Communities  
 where theme=@theme
 ------------------------------
 create proc sp_delete_conference
 @id int

 as

 delete from Conferences
 where conference_id=@id

---------------------------------

create proc sp_delete_game
@id int 

as

 delete from Games 
 where game_id=@id

 -------------------8-------------------------------
 --t
 create proc Add_Conferenceby_Members 
	 @email varchar(150),
	  @conference_id int 
	  as
	 insert into Confrences_attended_Member(member_email,conference_id)
	 values (@email,@conference_id)
	 exec Add_Conferenceby_Members 'tag@gmail' , 2

 -----------------------------------------------------------------------------------

 --------------9---------------------
 --takes email, conference_name, review and add is into table conference reviews
create   proc sp_add_conference_review_to_confernece_I_attended 
@email varchar(150),
@conference_name varchar(50),
@review  varchar(max)
as
begin


declare @ID int
select @ID=conference_id from Conferences where name=@conference_name;
if (exists (
Select member_email
from Conference_Reviews
where @email = member_email and @ID = conference_id))
insert into Conference_Reviews values (@review,GETDATE(),@ID,@email);
else 
select -1
end;

exec sp_add_conference_review_to_confernece_I_attended 'tag@gmail','TedXGUC','adasd'


 ----------------------------------------------------------------------------------------
 -----------10------------------
 --takes email of the verified reviewer and delete conference review written by this specific member
 create proc sp_delete_conference_review_I_wrote 
@email varchar(150),
@id int 
as
begin
delete from Conference_Reviews where member_email=@email and  conference_review_id = @id
end;
exec sp_delete_conference_review_I_wrote 'nazih@gmail' , '2'
----------------------------------------------------------
---------------11---------------------------
--takes input name of the community and email and add it into tables CCommunities_joined_Members 
create proc sp_Join_community
  
  @name varchar(150),
   @email varchar(150)
  as
declare @theme varchar(300)
 select @theme = theme
 from Communities
 where @name=name

 Insert into Communities_joined_Members values (@theme,@email)

 exec sp_Join_community 'TedxGUC','tag@gmail'
 
 ---------------------------------------------------------
 --------------------------12-----------------
 --takes input theme and displays title,description, emails
 create proc View_Community
	@theme varchar(150)
	as

	select  C.name,C.description ,tmp.member_email as members,tmp2.title,tmp2.description
	from Communities C, (select member_email 
	                     from Communities_joined_Members  
						  where theme=@theme ) as tmp , (select title,description 
						                                                from Topics 
																	where theme=@theme) as tmp2

exec View_Community 'To Talk About RPGs'
 ------------------------------------------------------
 ---------------------13---------------------------
 --takes input email communioty theme, title , description and add it into the table
 create proc sp_post_topic_on_community
@email varchar(150),
@community_theme varchar(50),
@title varchar(150),
@description varchar(300)
as
begin
insert into Topics values(@community_theme,@title,@description,@email);
end;
exec sp_post_topic_on_community 'tag@gmail','ghhh','FFGA','to talk about fff'


 --------------------------------------------------------
 -------------------------------14---------------------
 --takes input email and deletes the corresponding topic i posted 
 create proc sp_delete_topic_I_posted 
@email varchar(150),
@id int 
as
begin
delete  from Topics where member_email=@email and topic_id = @id
end;
exec sp_delete_topic_I_posted 'tag@gmail' ,1
------------------------------------------------------------------
------------------15--------------------------
   --take a comment, email and conference_review_id and add it into the table Conference_Review_Comments
  create proc sp_Comment_On_ConferenceReview
  @comment varchar(Max),
  @email varchar(150),
 @conferencereviewid int
 

  AS
 
 declare @conferenceid int
 select @conferenceid = conference_id
 from Conference_Reviews
 where @conferencereviewid=conference_review_id
  insert  Conference_Review_Comments(conference_review_id,conference_id,[content],email)  values (@conferencereviewid, @conferenceid, @comment,@email) 
  
  exec sp_Comment_On_ConferenceReview 'HHH','tag@gmail',2

  ------------------------------------------------------------------------------------------
  --take a comment, email and game_review_id and add it into the table Game_Review_Comments
   create proc sp_Comment_On_GameReview
  @comment varchar(Max),
  @email varchar(150),
   @gamereviewid int

  
  AS
  
 declare  @gameid int
 select @gameid=game_id
  from Game_Reviews
 where @gamereviewid=game_review_id
  insert  Game_Review_Comments(game_review_id,game_id,member_email,comment)  values (@gamereviewid, @gameid,@email,@comment)
  
  exec sp_Comment_On_GameReview 'HOPA','nazih@gmail',3
  -----------------------------------------------------------------------------------------------------------------
  --take a comment, email and theme and add it into the table Topic_Comments
  create proc sp_Topic_Comment
  @comment varchar(Max),
  @email varchar(150),
  @id int
  
  AS 
  declare @date datetime
  set @date = CURRENT_TIMESTAMP
 insert Topic_Comments_by_members(topic_id,comment_text,member_email,comment_date)values(@id,@comment,@email,@date)

 exec sp_Topic_Comment 'nice' , 'tag@gmail' , 1 
 -----------------------------------------------------------------
 ---------------------------------16-------------------------
 --takes input conference_review_id and select the comments on it by which member
 create proc View_Comments_Conference_Review
	
	@conference_review_id  int 
	as
     select * 
	 from Conference_Review_Comments
	 where conference_review_id=@conference_review_id
	 exec View_Comments_Conference_Review '1'

-----takes inoput game_review_id and outputs all the comments on it
create proc View_Comments_Game_Review
	@game_review_id  int 
	as 
	   select * 
	  from Game_Review_Comments
	  where game_review_id=@game_review_id
	exec View_Comments_Game_Review '3'

---takes input email and theme and outputs the topics posted on the community
create proc View_Topics_Community
	@email varchar(150),
	@theme varchar(150)
	as
	  select * 
	 from Topics
	 where theme=@theme and @email=member_email
	 exec View_Topics_Community 'tag@gmail','To Talk About RPGs'

 -------------------------------------------------
 ----------------17----------------------
 --takes the conference_review_comment_id and the email of the member and delete the record corresponiding to the entry
 create proc sp_delete_comment_on_conference_review
@ID int ,
@mail varchar(150)
as
DELETE  from Conference_Review_Comments where @ID=conference_review_comment_id AND @mail=email
exec sp_delete_comment_on_conference_review '1','tag@gmail'

--takes the comment_id and the email of the member and delete the record corresponiding to the entry
create proc sp_delete_comment_on_game_review
@ID int ,
@mail varchar(150)
as
DELETE  from Game_Review_Comments where @ID=comment_id  AND @mail=member_email

exec sp_delete_comment_on_game_review '1' , 'tag@gmail'

--takes the theme and the email of the member and delete the record corresponiding to the entry
create proc  sp_delete_comment_on_topic
@id int,
@mail varchar(150)
as
DELETE From Topic_Comments_by_members where @ID=comment_id

exec sp_delete_comment_on_topic '1','tag@gmail'
---------------------------------------------------------------------------------------------
 -------------------------------18--------------------------
 --takes input email and  return the top 5 members that attended the conferences as me 
  create proc sp_show_top5_members_attended_conferences_as_me  
@email varchar(150)
as
begin
declare @target_count int
select @target_count = count(*) 
                       from Confrences_attended_Member 
					   where member_email=@email 
					 

select email 
from Members
where email in
(select top(5) member_email as target_emails
from Confrences_attended_Member
group by member_email
having count(member_email)<=@target_count);
end;
exec sp_show_top5_members_attended_conferences_as_me 'abbas@gmail'

---------------------------------------------------------------------------------------------
-------------------------------------19---------------------------

create proc sp_View_Top_Recommended 
	@email varchar(150)
	as 
    select	top (10) count(*)
	from Normal_Users_Recommended_Games_to_Normal_Users N ,Rates R
	where receiver_email = @email and receiver_email <>@email and N.game_id=R.game_id and R.member_email <>N.receiver_email
	group by game_ID
	order by count(*)
	exec sp_View_Top_Recommended 'tag@gmail'
-----------------------------------------------------------------------------------------
------------------------AS A NORMAL USER I CAN----------------------------------
------------------1--------------------------
--takes input email of the normal user and inputs of: firstname, lastname, birthdate and change the corresponding row of that email in table Normal_Users
create proc sp_Update_Normal_User 
  
   @email varchar(150),
   @first_name varchar(50),
   @last_name varchar(50),
   @birthdate date
    as
	Update Normal_Users 
    set first_name = @first_name ,last_name=@last_name,date_of_birth=@birthdate 
	where normal_user_email=@email
	exec sp_Update_Normal_User '3adela@gmail', 'Kiwi','Adela' , '2001/2/22'
---------------------------------------------------------------------------------------
------------------------------2------------------------------
--takes sender and reciever emails and insert the request in table Normal_Users_add_friend_Normal_Users with accept bit null
create proc sp_send_friendship_to_members 
@Sender_email varchar(150),
@Receiver_email varchar(150)
as
begin
insert into Normal_Users_add_friend_Normal_Users values (@Sender_email,@Receiver_email,null)
end;

exec sp_send_friendship_to_members '3adela@gmail','tag@gmail'

------------------------------------------------------------------
----------------------------3-----------------------------
---takes input a letter and search with it and returns all the values that has this letter
create proc sp_Normal_Users_search_for_friends 
@first_name varchar(50) = null ,
@last_name varchar(50) = null
as
begin
select *
from Normal_Users 
where ( (first_name=@first_name + '%') OR (@first_name is null )
      AND (last_name=@last_name + '%') OR (@last_name is null )
	  );
end;

exec sp_Normal_Users_search_for_friends 'Omar' ,'T'

------------------------------------------------------------------
---------------------------4---------------------------
--takes input input email and retrieve all the requesting emails of friendship to this email
 create proc sp_View_Pending_Friend_Request 
  @email varchar (150)

  as
 select * from Games_Created_by_Development_Teams_Presented_in_Conferences
 select Requesting_email
 from Normal_Users_add_friend_Normal_Users 
 where Receiving_email= @email and accept = Null

 exec sp_View_Pending_Friend_Request 'tag@gmail'

 -----------------------------------------------------------------------
 ----------------------5-----------------------------------------------
 create proc sp_Accept_Reject_friend -----takes requesting and revieving email and an accept bit and update Normal_Users_add_friend_Normal_Users with the inputs
   @requesting_email varchar(150),
   @accept Bit,
   @receiving_email varchar(150)
   as
     update Normal_Users_add_friend_Normal_Users
      set accept = @accept
	 where  (requesting_email=@requesting_email and receiving_email=@receiving_email)
	 exec sp_Accept_Reject_friend '3adela@gmail', 1,'abbas@gmail'  
---------------------------------------------------------------------------------
------------------------------6-------------------------------------
--takes input email and checks the name if there is an entry in the table Normal_Users_add_friend_Normal_Users it returns the relations where the email had recieved or request a friend
create proc view_my_friend_list 
@name varchar(150)
as
select Requesting_email , Receiving_email
from Normal_Users_add_friend_Normal_Users
where accept=1 AND (Requesting_email=@name OR Receiving_email=@name)

exec view_my_friend_list '3adela@gmail'
-----------------------------------------------------------------
 -------------------------------7---------------------------------------
 create proc  sp_view_friend_profile  -- suppose that he is a friend of me and a normal user at the same time

@email varchar(150)
as
begin

select Nu.first_name,NU.last_name,NU.age,tmp.name,tmp.start_date,tmp.end_date,tmp.duration_days,tmp.venue ,tmp2.name,tmp2.graphics,tmp2.level_design,tmp2.interactivity,tmp2.uniqueness 
from Normal_Users NU , (select c.name,c.start_date,c.end_date,c.duration_days,c.venue 
                        from Conferences c inner join Confrences_attended_Member cm
						on c.conference_id=cm.conference_id
						where cm.member_email=@email ) as tmp , (select g.name,r.graphics,r.level_design,r.interactivity,r.uniqueness 
						                                         from Games g inner join Rates r
																 on g.game_id=r.game_id
																 where r.member_email=@email ) as tmp2

end

 ----------------------------------------------------------------------
 ---------------------------8-----------------------

 create proc sp_Send_Message
 
 @message varchar(max),
 @recieveremail varchar(150),
 @Senderemail varchar(150)

 as
  declare @date datetime
 set @date = CURRENT_TIMESTAMP
 insert Messages (sender_email,reciever_mail,message_text,message_date) values(@Senderemail,@recieveremail, @Message, @date) 
 
 exec sp_Send_Message 'Yala Bena' , 'tag@gmail', 'abbas@gmail'
 -------------------------------------------------------------------------------------
 -------------------------9-----------------------------------------

 create proc sp_Normal_user_messages
	 @receiving_email varchar(150)
	 as 
	 select message_text
	 from Messages
	 where reciever_mail=@receiving_email
	 
	exec sp_Normal_user_messages 'tag@gmail'

 --------------------------------------------------------------------------------------
 -------------------------------10--------------------------------
create proc sp_recommend_game
@game_name varchar(50),
@sender_mail varchar (150),
@reciever_mail varchar (150)
as
Declare @ID int 
select @ID= game_ID from Games WHERE name=@game_name
insert into Normal_Users_Recommended_Games_to_Normal_Users values(@sender_mail,@reciever_mail,@ID)

 exec sp_recommend_game 'Blackops1' , 'tag@gmail', 'abbas@gmail'
 ----------------------------------------------------------------------------------
 --------------------------11----------------------------------
create proc sp_view_My_Games_recommendations 
@email varchar(150)
as
begin
select G.name,N.first_name,N.last_name
from Normal_Users_Recommended_Games_to_Normal_Users R inner join Games G
on R.game_ID=G.game_id
inner join Normal_Users N
on R.sender_email=N.normal_user_email
where R.receiver_email=@email;
end;
exec sp_view_My_Games_recommendations 'abbas@gmail'
 ------------------------------------------------------------------------------------
 ----------------12---------------------------------------
 create proc sp_Request_Creating_Community --here where the request only is sent to the table Communities_created_by_Membwers then in other procedure it is entered in the community

@name varchar(150),
@description varchar(300),
@theme  varchar(150),
@email varchar(150)

as

declare @accept bit = null

insert into Communities values(@theme, @name,@description)
insert into Communities_created_by_Normal_Users values(@theme,@email,@accept)



exec sp_Request_Creating_Community 'Databases', 'Databases Course' , 'Kualalamboor' , 'tag@gmail'

 -----------------------------------------------------------------------------------
 --------------------AS A VERIFIED REVIEWER--------------------------------
 ------------------------------1-------------------------------------
 create proc sp_Update_Verified_reviewer
    @email varchar(150),
	@first_name varchar(50),
	@last_name varchar(50)
		as 
	update Verified_Reviewers 
	set first_name=@first_name ,last_name=@last_name
	where email=@email

	exec sp_Update_Verified_reviewer 'salah@gmail','Ahmed','Ali'
	
 -------------------------------------------------------------------------------------
 ---------------------------------2------------------------------------------
create proc sp_add_game_review 
 @email varchar(150),
 @name varchar(50),
 @content varchar(max)
 as
 declare @date datetime
 set @date = CURRENT_TIMESTAMP
 declare @gameid int 
 Select @gameid =game_id
 from Games 
 where @name=name
 insert Game_Reviews (verified_reviewer_emial,game_id,date,content)values(@email,@gameid,@date,@content)

 exec sp_add_game_review 'salah@gmail','Blackops1','Nice'
 ------------------------------------------------------------------------------------
 -------------------------------3------------------------------------
 create proc sp_delete_Game_Review_I_wrote 
@email varchar(150),
@gamereviewid int
as
begin 
delete from Game_Reviews
 where verified_reviewer_emial=@email and game_review_id = @gamereviewid
end;

exec sp_delete_Game_Review_I_wrote 'nazih@gmail', 3



 --------------------------------------------------------------------------------
 ----------------------------4------------------------------------
 create proc sp_view_top10_game_reviewers_based_on_comments_number
as
begin
select top(10) * from
(select  gr.game_review_id,count(comment_id) as comments_number
from Game_Reviews gr inner join Game_Review_Comments grc
ON gr.game_review_id=grc.game_review_id  and gr.game_id=grc.game_id
group by gr.game_review_id ) as tmp inner join Game_Reviews g
on tmp.game_review_id = g.game_review_id
order by comments_number desc

end

exec sp_view_top10_game_reviewers_based_on_comments_number 
 ----------------------------------------------------------------------------------
 ------------------------------AS A DEVELOPMENT TEAM--------------------------------
 -----------------------1------------------------
 create proc sp_update_developement_team 
	 @email varchar(150),
	 @team_name varchar(50),
	 @company varchar(50),
	 @formation_date date 
	 as
	Update Development_Teams 
    set team_name = @team_name ,company=@company,formation_date=@formation_date 
	where email=@email

	exec sp_update_developement_team 'hatem@gmail', 'TeamJO' , 'Hatem CO' , '2015/2/2'  
 ----------------------------------------------------------------------------------
 ----------------2-------------------------
  create proc Add_Game_to_list
 @name  varchar(50),
 @release_date datetime , 
 @rating int ,
 @age_limit int ,
 @development_team_email varchar(150),
 @release_conference_id int 
 as 
   declare @id int 
 insert into Games(name,release_date,rating,age_limit,development_team_email) values(@name,@release_date,@rating,@age_limit,@development_team_email)

  ( select @id= game_id 
    from Games
   where @name = name )

insert into Games_Created_by_Development_Teams_Presented_in_Conferences(conference_ID,game_ID,development_team_email)
values (@release_conference_id,@id,@development_team_email)

exec Add_Game_to_list 'Koro','2015/3/4',9,12,'hatem@gmail',2
 -----------------------------3-----------------------------
 Create proc sp_add_Screenshots_to_game 

@screenshot varbinary(max) ,
@game_name varchar(50)
as
begin
 declare @game_id int
select @game_id = game_id from Games where name=@game_name

insert into Screenshots values(@game_id,@screenshot,GETDATE())
 
end;
exec sp_add_Screenshots_to_game 01010101,'Blur'

Create proc sp_add_videos_to_game
@video varbinary(max),
@game_name varchar(50)
as
begin
declare @game_id int
select @game_id = game_id  from Games where name=@game_name
insert into Videos values(@game_id,@video,GETDATE())
end

exec sp_add_videos_to_game 01010101,'Blur'
 -----------------------------------------------------------------------------------

 ------------------4-----------------------
 create proc sp_DevelopmentTeam_Add_Attended_Conference_and_Games
 @conferencename varchar(50),
 @name varchar(50),
 @email varchar (150),
 @releasedate datetime, 
 @rating int ,
 @agelimit int
  
 as
 declare @conferenceid int
 select @conferenceid=conference_id
 from Conferences
 where name = @conferencename

 insert Confrences_attended_Member (conference_id,member_email) values (@conferenceid,@email)

 
 declare @gameid int
 Select @gameid = game_id
 from Games
 where name = @name
 
 insert into Games_Created_by_Development_Teams_Presented_in_Conferences values (@conferenceid,@gameid,@email)
 
 exec sp_DevelopmentTeam_Add_Attended_Conference_and_Games 'Yasta' , 'Blackops1' , 'loay@gmail' , '2015/5/6' , 4,12
 
 ----------------------------------------------------------------------------------
 ----------------------AS AN ADMIN---------------------------------
 ---------------------1----------------------
 create proc sp_View_Community_requests
	as
	 select theme,normal_user_email
	 from Communities_created_by_Normal_Users
	 where accept is NULL
	 
	 exec sp_View_Community_requests
	 
 --------------------------------------------------------------------------------------
 -----------------2--------------------------------
 create proc sp_Accept_Community 
@theme varchar(150)
as
update Communities_created_by_Normal_Users 
set accept= 1
where  theme =@theme; 

exec sp_Accept_Community '12345'

 create proc Reject_Community 
@theme varchar(150)
as
update Communities_created_by_Normal_Users
set accept=0
where theme=@theme;

delete from  Communities
where theme=@theme
exec Reject_Community '101112'


-------------------------------------------------------------------------------------------
------------------------3-----------------------------------
Create proc sp_verify_members   -- returns 1 if member is a Verified_Reviewer and 2 if member is a Development_Team
@email varchar(150),
@returnCount int out
as
begin
declare @Count1 int ,@Count2 int

select @Count1 = count(*) 
from Verified_Reviewers
where email=@email ;

select @Count2 = count(*) 
from Development_Teams
where email = @email;

if (@Count1>0)
begin
set @returnCount = 1;
end
else
if(@Count2>0)
begin
set @returnCount = 2;
end
end;

declare @count int
exec sp_verify_members 'hatem@gmail', @count output
print @count


------------------------------------------------------
----------------4-----------------------
 create proc sp_create_conference
 @name varchar(50),
 @startdate datetime,
 @enddate datetime,
 @venue varchar(50)
 as 
 insert Conferences (name,start_date,end_date,venue) values(@name,@startdate,@enddate,@venue)

 exec sp_create_conference 'Loay','2015/2/5','2015/2/9','AUC'

---------------------------------------------------------------------------
--------5-------------------------
create proc sp_Create_game
@name varchar(50),
 @release_date date ,
 @age_limit int ,
 @rating int 
 as
 insert into Games(name,release_date,rating,age_limit)
 values (@name,@release_date,0,@age_limit)
 exec  sp_Create_game 'Halo4' , '2015/6/7',12,0

 ---------------------------------------------------------------------------
 -----------------------6--------------------------
 
 
 create proc sp_delete_community
@theme varchar(50)

 as 

 delete from Communities  
 where theme=@theme
 exec sp_delete_community '123'
 ------------------------------
 create proc sp_delete_conference
 @id int

 as

 delete from Conferences
 where conference_id=@id
 exec sp_delete_conference 2
---------------------------------

create proc sp_delete_game
@id int 

as

 delete from Games 
 where game_id=@id

 exec sp_delete_game 9
 
 















 





 











	





  

 

  




	





