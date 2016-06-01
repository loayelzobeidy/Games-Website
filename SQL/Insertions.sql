insert into Members values ('tag@gmail', 'tag' , 'Action','Normal User');
insert into Members values ('omar@gmail', 'omar' , 'Action','Normal User');
insert into Members values ('abbas@gmail', 'abbas' , 'Action','Normal User');
insert into Members values ('daw@gmail', 'daw' , 'Sport','Normal User');
insert into Members values ('ahmed@gmail', 'ahmed' , 'Sport','Normal User');
insert into Members values ('men3em@gmail', 'men3em' , 'Sport','Normal User');
insert into Members values ('sroor@gmail', 'sroor' , 'Strategy','Normal User');
insert into Members values ('haitham@gmail', 'haitham' , 'Strategy','Normal User');
insert into Members values ('slim@gmail', 'slim' , 'Strategy','Development Team');
insert into Members values ('abbas@gmail', 'abbas' , 'Action','Development Team');
insert into Members values ('loay@gmail', 'loay' , 'Action', 'Development Team');
insert into Members values ('hatem@gmail', 'hatem' , 'Action', 'Development Team');
insert into Members values ('atef@gmail', 'slim' , 'Strategy','Development Team');
insert into Members values ('jiji@gmail', 'jiji' , 'Action','Development Team');
insert into Members values ('krombo@gmail', 'krombo' , 'Action', 'Development Team');
insert into Members values ('krombo@gmail', 'krombo' , 'Action', 'Development Team');
insert into Members values ('3adela@gmail', '3adela' , 'RPG','Normal User');
insert into Members values ('tatawy@gmail', 'tatawy' , 'RPG', 'Normal User');
insert into Members values ('salah@gmail', 'salah' , 'RPG', 'Verified User ');
insert into Members values ('sayed@gmail', 'sayed' , 'RPG', 'Verified User ');
insert into Members values ('fatkat@gmail', 'fatakat' , 'Action','Verified User ');
insert into Members values ('nazih@gmail', 'nazih' , 'Strategy','Verified User ');
insert into Members values ('seleman@gmail', 'seleman' , 'Strategy','Verified User ');
insert into Members values ('yomna@gmail', 'yomna' , 'Action', 'Verified User ');
insert into Members values ('seleman@gmail', 'seleman' , 'Strategy','Verified User ');

insert into Verified_Reviewers values ('salah@gmail','Hesham','Salah','2003')
insert into Verified_Reviewers values ('sayed@gmail','Sayed','Morgan','2006')
insert into Verified_Reviewers values ('fatkat@gmail','Fatkat','Salah','2003')
insert into Verified_Reviewers values ('nazih@gmail','Ahmed','Nazih','2010')
insert into Verified_Reviewers values ('yomna@gmail','Yomna','Hesham','2003')
insert into Verified_Reviewers values ('seleman@gmail','Hesham','Seleman','2009')


insert into Normal_Users values('omar@gmail', 'Omar','Hesham','1995/2/2');
insert into Normal_Users values('daw@gmail', 'daw','Tag','1995/2/5');
insert into Normal_Users values('abbas@gmail', 'Abbas','Meselhy','1995/2/3');
insert into Normal_Users values('mn3em@gmail', 'Mn3em','Meselhy','1995/2/8');
insert into Normal_Users values('sroor@gmail', 'Omar','Sorour','1995/2/3');
insert into Normal_Users values('haitham@gmail', 'Haitham','Meselhy','1995/2/3');
insert into Normal_Users values('abbas@gmail', 'Abbas','Meselhy','1995/2/3');
insert into Normal_Users values('ahmed@gmail', 'Ahmed','Abbas','1995/2/3');
insert into Normal_Users values('men3em@gmail', 'Mn3em','Abbas','1992/2/3');
insert into Normal_Users values('3adela@gmail', '3adela','Abbas','1999/2/3');
insert into Normal_Users values('tatawy@gmail', 'Ahmed','Tatawy','1995/2/3');




insert into Development_Teams values ('loay@gmail','TeamX','3am sa3d','2010/2/2')
insert into Development_Teams values ('abbas@gmail','TeamY','Pronto','2010/6/2')
insert into Development_Teams values ('krombo@gmail','TeamZ','Jelly','2010/6/2')
insert into Development_Teams values ('slim@gmail','TeamW','Jellygish','2010/6/2')
insert into Development_Teams values ('hatem@gmail','TeamO','Fakes','2010/6/2')
insert into Development_Teams values ('jiji@gmail','TeamE','Fakes','2010/6/2')

select * from Conferences

insert into Conferences (name,start_date,end_date,venue) values('GUC','2015/11/11','2015/11/15','GUC')
insert into Conferences (name,start_date,end_date,venue) values('Yasta','2015/11/11','2015/11/15','GUC')
insert into Conferences (name,start_date,end_date,venue) values('Markaz el shabashy','2015/11/18','2015/11/24','AUC')


select * from Games

insert into Games (name,age_limit,development_team_email,release_date) values ('Blackops1',15,'loay@gmail', '2015/2/2')
insert into Games (name,age_limit,development_team_email,release_date) values ('Super Mario',3,'hatem@gmail', '2015/2/4')
insert into Games (name,age_limit,development_team_email,release_date) values ('Blur',16,'hatem@gmail', '2015/2/4')
insert into Games (name,age_limit,development_team_email,release_date) values ('Battle Field',18,'loay@gmail','2015/2/4')
insert into Games (name,age_limit,development_team_email,release_date) values ('God OF War',18,'slim@gmail', '2015/2/4')
insert into Games (name,age_limit,development_team_email,release_date) values ('In Famous',18,'krombo@gmail', 2, '2015/2/4')
insert into Games (name,age_limit,development_team_email,release_date) values ('Mortal Combat',18,'abbas@gmail', 3, '2015/2/4')
insert into Games (name,age_limit,development_team_email,release_date) values ('Protype',15,'loay@gmail', 2, '2015/2/4')
insert into Games (name,age_limit,development_team_email,release_date) values ('Metal Gear',15,'abbas@gmail', 1, '2015/2/4')
insert into Games (name,age_limit,development_team_email,release_date) values ('Street Fighter',15,'slim@gmail', 3, '2015/2/4')
insert into Games (name,age_limit,development_team_email,release_date) values ('Injustice',15,'krombo@gmail', 2, '2015/2/4')
insert into Games (name,age_limit,development_team_email,release_date) values ('Fifa16',12,'hatem@gmail', 1, '2015/2/4')
insert into Games (name,age_limit,development_team_email,release_date) values ('Pro Evolution Soccer',12,'loay@gmail', 3, '2015/2/4')


insert into Strategies values (5,'1');
insert into Strategies values (10,'0');
insert into Strategies values (6,'0');
insert into Strategies values (11,'0');


insert into Rpgs values(7,'AY kalam Kda','0')
insert into Rpgs values(9,'AY kalam Kda rakam 9 ','1')
insert into Rpgs values(4,'AY kalam Kda rakam 9 ','1')

insert into Actions values(9,'Fight')

insert into Sports values(6,'Sports')
insert into Sports values(15,'Football')
insert into Sports values(16,'Football')


insert into Rates values (5,2,4,5,7,'tag@gmail')
insert into Rates values (7,7,8,9,10,'loay@gmail')
insert into Rates values (9,8,4,5,9,'hatem@gmail')
insert into Rates values (12,10,4,5,5,'hatem@gmail')
insert into Rates values (10,1,4,5,9,'tag@gmail')
insert into Rates values (7,6,4,5,2,'nazih@gmail')
insert into Rates values (8,8,4,5,5,'tag@gmail')
insert into Rates values (4,2,4,5,6,'loay@gmail')
insert into Rates values (14,6,4,5,2,'nazih@gmail')
insert into Rates values (13,8,4,5,5,'tag@gmail')
insert into Rates values (10,8,9,7,6,'loay@gmail')


insert Game_Reviews(game_id,verified_reviewer_emial,content) values (5,'salah@gmail','nice')
insert Game_Reviews(game_id,verified_reviewer_emial,content) values (7,'salah@gmail','good')
insert Game_Reviews(game_id,verified_reviewer_emial,content) values (9,'nazih@gmail','bad')
insert Game_Reviews(game_id,verified_reviewer_emial,content) values (10,'salah@gmail','nice')
insert Game_Reviews(game_id,verified_reviewer_emial,content) values (8,'fatkat@gmail','good')
insert Game_Reviews(game_id,verified_reviewer_emial,content) values (9,'nazih@gmail','bad')
insert Game_Reviews(game_id,verified_reviewer_emial,content) values (11,'salah@gmail','medium')
insert Game_Reviews(game_id,verified_reviewer_emial,content) values (12,'fatkat@gmail','wow')

insert Game_Review_Comments values(3,5,'tag@gmail','asdasdasdasd')
insert Game_Review_Comments values(5,5,'tag@gmail','asdasdasdasd')
insert Game_Review_Comments values(3,5,'tag@gmail','asdasdasdasd')
insert Game_Review_Comments values(4,5,'tag@gmail','asdasdasdasd')
insert Game_Review_Comments values(4,5,'tag@gmail','asdasdasdasd')
insert Game_Review_Comments values(5,5,'3adela@gmail','asdasdasdasd')
insert Game_Review_Comments values(3,5,'tag@gmail','asdasdasdasd')
insert Game_Review_Comments values(3,5,'tag@gmail','asdasdasdasd')
insert Game_Review_Comments values(3,5,'abbas@gmail','asdasdasdasd')
insert Game_Review_Comments values(3,9,'nazih@gmail','asdasdasdasd')
insert Game_Review_Comments values(4,9,'tag@gmail','asdasdasdasd')
insert Game_Review_Comments values(6,5,'tag@gmail','asdasdasdasd')
insert Game_Review_Comments values(7,5,'3adela@gmail','asdasdasdasd')
insert Game_Review_Comments values(8,5,'tag@gmail','asdasdasdasd')
insert Game_Review_Comments values(4,5,'tag@gmail','asdasdasdasd')
insert Game_Review_Comments values(3,5,'abbas@gmail','asdasdasdasd')
insert Game_Review_Comments values(3,9,'nazih@gmail','asdasdasdasd')
insert Game_Review_Comments values(3,9,'tag@gmail','asdasdasdasd')
insert Game_Review_Comments values(4,5,'tag@gmail','asdasdasdasd')
insert Game_Review_Comments values(5,5,'3adela@gmail','asdasdasdasd')
insert Game_Review_Comments values(6,5,'tag@gmail','asdasdasdasd')
insert Game_Review_Comments values(3,5,'tag@gmail','asdasdasdasd')
insert Game_Review_Comments values(7,5,'abbas@gmail','asdasdasdasd')
insert Game_Review_Comments values(8,9,'nazih@gmail','asdasdasdasd')
insert Game_Review_Comments values(9,9,'tag@gmail','asdasdasdasd')



insert into Confrences_attended_Member values (1,'tag@gmail')
insert into Confrences_attended_Member values (3,'tag@gmail')
insert into Confrences_attended_Member values (3,'loay@gmail')
insert into Confrences_attended_Member values (2,'nazih@gmail')
insert into Confrences_attended_Member values (2,'hatem@gmail')
insert into Confrences_attended_Member values (3,'hatem@gmail')

insert into Normal_Users_Recommended_Games_to_Normal_Users values ('3adela@gmail','abbas@gmail',4)
insert into Normal_Users_Recommended_Games_to_Normal_Users values ('3adela@gmail','tatawy@gmail',5)
insert into Normal_Users_Recommended_Games_to_Normal_Users values ('3adela@gmail','daw@gmail',7)
insert into Normal_Users_Recommended_Games_to_Normal_Users values ('haitham@gmail','tatawy@gmail',7)
insert into Normal_Users_Recommended_Games_to_Normal_Users values ('3adela@gmail','tatawy@gmail',7)
insert into Normal_Users_Recommended_Games_to_Normal_Users values ('3adela@gmail','daw@gmail',9)
insert into Normal_Users_Recommended_Games_to_Normal_Users values ('sroor@gmail','tatawy@gmail',4)
insert into Normal_Users_Recommended_Games_to_Normal_Users values ('3adela@gmail','tatawy@gmail',4)
insert into Normal_Users_Recommended_Games_to_Normal_Users values ('tag@gmail','daw@gmail',4)
insert into Normal_Users_Recommended_Games_to_Normal_Users values ('haitham@gmail','tatawy@gmail',3)
insert into Normal_Users_Recommended_Games_to_Normal_Users values ('3adela@gmail','tatawy@gmail',3)
insert into Normal_Users_Recommended_Games_to_Normal_Users values ('daw@gmail','tatawy@gmail',10)
insert into Normal_Users_Recommended_Games_to_Normal_Users values ('men3em@gmail','tatawy@gmail',10)
insert into Normal_Users_Recommended_Games_to_Normal_Users values ('ahmed@gmail','tatawy@gmail',4)
insert into Normal_Users_Recommended_Games_to_Normal_Users values ('3adela@gmail','tatawy@gmail',4)

select * from Normal_Users

insert into Normal_Users_add_friend_Normal_Users values ('3adela@gmail','abbas@gmail',null)
insert into Normal_Users_add_friend_Normal_Users values ('abbas@gmail','ahmed@gmail',1)
insert into Normal_Users_add_friend_Normal_Users values ('daw@gmail','haitham@gmail',0)
insert into Normal_Users_add_friend_Normal_Users values ('men3em@gmail','sroor@gmail',1)
insert into Normal_Users_add_friend_Normal_Users values ('sroor@gmail','abbas@gmail',null)

insert into Topics values('To Talk About RPGs','hhhhh','hhhhh','tag@gmail')
insert into Topics values('To Talk About RPGS','nmnh','hhhhh','abbas@gmail')
insert into Topics values('123','hhhhh','hhhhh','loay@gmail')
insert into Topics values('oiu','hhhhh','hhhhh','hatem@gmail')
insert into Topics values('Back and Forth','hhhhh','hhhhh','nazih@gmail')
insert into Topics values('Model of United Nations','hhhhh','hhhhh','tag@gmail')
insert into Topics values('oiu','hhhhh','hhhhh','hatem@gmail')
insert into Topics values('Back and Forth','hhhhh','hhhhh','nazih@gmail')
insert into Topics values('Model of United Nations','hhhhh','hhhhh','tag@gmail')

insert into Topic_Comments_by_members values (1,'Ay kalam',CURRENT_TIMESTAMP,'tag@gmail') 
insert into Topic_Comments_by_members values (2,'Ay kalam',CURRENT_TIMESTAMP,'tag@gmail') 
insert into Topic_Comments_by_members values (4,'Ay kalam',CURRENT_TIMESTAMP,'tag@gmail') 
insert into Topic_Comments_by_members values (3,'Ay kalam',CURRENT_TIMESTAMP,'tag@gmail') 
insert into Topic_Comments_by_members values (5,'Ay kalam',CURRENT_TIMESTAMP,'tag@gmail') 
insert into Topic_Comments_by_members values (6,'Ay kalam',CURRENT_TIMESTAMP,'tag@gmail') 
   
insert into Games_Created_by_Development_Teams_Presented_in_Conferences values(2,6,'hatem@gmail')
insert into Games_Created_by_Development_Teams_Presented_in_Conferences values(1,6,'loay@gmail')
insert into Games_Created_by_Development_Teams_Presented_in_Conferences values(1,6,'hatem@gmail')
insert into Games_Created_by_Development_Teams_Presented_in_Conferences values(1,6,'loay@gmail')
insert into Games_Created_by_Development_Teams_Presented_in_Conferences values(3,6,'hatem@gmail')
insert into Games_Created_by_Development_Teams_Presented_in_Conferences values(2,6,'loay@gmail')


insert into Messages values('3adela@gmail','abbas@gmail',CURRENT_TIMESTAMP,'jnnnn')
insert into Messages values('daw@gmail','abbas@gmail',CURRENT_TIMESTAMP,'jnnnn')
insert into Messages values('sroor@gmail','abbas@gmail',CURRENT_TIMESTAMP,'jnnnn')
insert into Messages values('3adela@gmail','mn3em@gmail',CURRENT_TIMESTAMP,'jnnnn')
insert into Messages values('daw@gmail','abbas@gmail',CURRENT_TIMESTAMP,'jnnnn')
insert into Messages values('tatawy@gmail','abbas@gmail',CURRENT_TIMESTAMP,'jnnnn')
insert into Messages values('ahmed@gmail','tag@gmail',CURRENT_TIMESTAMP,'jnnnn')

insert into Communities values('Model of United Nations','MUNGUC','blablablabla')
insert into Communities values('To Talk About RPGS','RPGs','blablablabla')
insert into Communities values('Back and Forth','TedxGUC','blablablabla')
insert into Communities values ('123','TedxGUC','blablablabla')
insert into Communities values('67890','TedxGUC','blablablabla')
insert into Communities values('oiu','TedxGUC','blablablabla')
insert into Communities values('12345','TedxGUC','blablablabla')
insert into Communities values('9876','TedxGUC','blablablabla')
insert into Communities values('101112','TedxGUC','blablablabla')


insert into Communities_created_by_Normal_Users values ('Back and Forth','haitham@gmail',1)
insert into Communities_created_by_Normal_Users values ('123','men3em@gmail',null)
insert into Communities_created_by_Normal_Users values ('YouthtoBusiness','omar@gmail',0)
insert into Communities_created_by_Normal_Users values ('12345','men3em@gmail',null)
insert into Communities_created_by_Normal_Users values ('9876','men3em@gmail',null)
insert into Communities_created_by_Normal_Users values ('101112','tag@gmail',null)

insert into Communities_joined_Members values('Back and Forth','slim@gmail')
insert into Communities_joined_Members values('Back and Forth','haitham@gmail')
insert into Communities_joined_Members values('YouthtoBusiness','haitham@gmail')

insert into Conference_Reviews values ('Nice',CURRENT_TIMESTAMP,1,'tag@gmail')
insert into Conference_Reviews values ('Not Bad',CURRENT_TIMESTAMP,2,'nazih@gmail')
insert into Conference_Reviews values ('Good',CURRENT_TIMESTAMP,3,'hatem@gmail')
insert into Conference_Reviews values ('Bad',CURRENT_TIMESTAMP,1,'loay@gmail')

insert into Conference_Review_Comments values (1,1,'Comment','tag@gmail')
insert into Conference_Review_Comments values (2,2,'Commented Here','abbas@gmail')
insert into Conference_Review_Comments values (3,3,'Comment','hatem@gmail')
insert into Conference_Review_Comments values (1,1,'Comment','men3em@gmail')
insert into Conference_Review_Comments values (4,1,'7elwa gedan','slim@gmail')

insert into Screenshots values(3,0101010,CURRENT_TIMESTAMP)
insert into Screenshots values(7,0101010,CURRENT_TIMESTAMP)
insert into Screenshots values(8,0101010,CURRENT_TIMESTAMP)
insert into Screenshots values(4,01010000110,CURRENT_TIMESTAMP)
insert into Screenshots values(5,010101010110,CURRENT_TIMESTAMP)
insert into Screenshots values(12,01011101010,CURRENT_TIMESTAMP)
insert into Screenshots values(10,0101010,CURRENT_TIMESTAMP)
insert into Screenshots values(9,0101010,CURRENT_TIMESTAMP)
insert into Screenshots values(7,0101010,CURRENT_TIMESTAMP)
insert into Screenshots values(11,0101010,CURRENT_TIMESTAMP)
insert into Screenshots values(13,0101010,CURRENT_TIMESTAMP)

insert into Videos values(7,0101010,CURRENT_TIMESTAMP)
insert into Videos values(14,0101010,CURRENT_TIMESTAMP)
insert into Videos values(4,01010000110,CURRENT_TIMESTAMP)
insert into Videos values(5,010101010110,CURRENT_TIMESTAMP)
insert into Videos values(12,01011101010,CURRENT_TIMESTAMP)
insert into Videos values(10,0101010,CURRENT_TIMESTAMP)
insert into Videos values(9,0101010,CURRENT_TIMESTAMP)
insert into Videos values(7,0101010,CURRENT_TIMESTAMP)
insert into Videos values(11,0101010,CURRENT_TIMESTAMP)
insert into Videos values(13,0101010,CURRENT_TIMESTAMP)

