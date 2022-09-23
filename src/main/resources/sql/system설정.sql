-- Petmily 스키마
create user petmily identified by KHproject123;
grant connect, resource to petmily;

-- user 생성
CREATE USER jjb1 IDENTIFIED BY Petmilymember1;
CREATE USER psh2 IDENTIFIED BY Petmilymember2;
CREATE USER kcm3 IDENTIFIED BY Petmilymember3;
CREATE USER ysk4 IDENTIFIED BY Petmilymember4;
CREATE USER kej5 IDENTIFIED BY Petmilymember5;
CREATE USER syh6 IDENTIFIED BY Petmilymember6;
CREATE USER jsj7 IDENTIFIED BY Petmilymember7;

-- system 권한 부여
grant create session to jjb1;
grant select any table to jjb1;
grant insert any table to jjb1;
grant update any table to jjb1;
grant delete any table to jjb1;



-- ddl 작성 후
-- (public) synonym 생성
CREATE OR REPLACE public synonym member FOR petmily.member;
CREATE OR REPLACE public synonym board FOR petmily.board;
CREATE OR REPLACE public synonym ABANDONEDANIMAL FOR petmily.ABANDONEDANIMAL;
CREATE OR REPLACE public synonym ADMINREPLY FOR petmily.ADMINREPLY;
CREATE OR REPLACE public synonym ADOPT FOR petmily.ADOPT;
CREATE OR REPLACE public synonym BOARDREPLY FOR petmily.BOARDREPLY;
CREATE OR REPLACE public synonym DONATION FOR petmily.DONATION;
CREATE OR REPLACE public synonym FINDANIMALBOARD FOR petmily.FINDANIMALBOARD;
CREATE OR REPLACE public synonym LOOKANIMALBOARD FOR petmily.LOOKANIMALBOARD;
CREATE OR REPLACE public synonym PET FOR petmily.PET;
CREATE OR REPLACE public synonym SHELTER FOR petmily.SHELTER;
CREATE OR REPLACE public synonym TEMPPET FOR petmily.TEMPPET;
CREATE OR REPLACE public synonym VOLUNTEERAPPLY FOR petmily.VOLUNTEERAPPLY;