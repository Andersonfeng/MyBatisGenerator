/*==============================================================*/
/* Database name:  db-air                                       */
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2017/10/25 ������ 15:35:33                      */
/*==============================================================*/


drop database if exists "db-air";

/*==============================================================*/
/* Database: "db-air"                                           */
/*==============================================================*/
create database "db-air";

use "db-air";

/*==============================================================*/
/* Table: t_air_apply                                           */
/*==============================================================*/
create table t_air_apply
(
   id                   int not null auto_increment,
   user_id              varchar(64) not null comment '����id����ҵid',
   user_name            varchar(50) not null comment '������������ҵ��',
   user_type            tinyint(4) not null default 1 comment '�û����ͣ�1���ˣ�2��ҵ',
   number               varchar(11) not null comment '˵�����ñ����ϵͳ�Զ����ɣ���2017��6��12�յݽ��Ŀ���ʹ��������ΪKY170612001,��KY��ʾ�������룬170612��ʾ���ڣ�001��ʾ������ı��',
   task_type            varchar(255) comment '��������',
   plan_begin_time      datetime default NULL comment '�ƻ���ʼʱ��',
   plan_end_time        datetime default NULL comment '�ƻ�����ʱ��',
   weather_condition    varchar(255) comment '��������',
   flight_rule          varchar(10) default NULL comment '���й���',
   plan_type            varchar(10) not null default '0' comment '�ƻ����ͣ�0������1������ѵ��2��Ʒ�Է�',
   contact_info         varchar(255) default NULL comment '��ϵ����Ϣ',
   emergency_contact_info varchar(255) comment '������ϵ����Ϣ',
   create_time          datetime default NULL comment '����ʱ��',
   status               tinyint(4) default 0 comment '״̬��0����У�1���ͨ����2δͨ�����,3��������,4�ݸ�',
   audit_time           datetime default NULL comment '���ʱ��',
   reason               varchar(255) default NULL comment '���ʧ��ԭ��',
   remark               varchar(255) default NULL comment '��ע',
   auditor              varchar(50) comment '�����',
   primary key (id),
   unique key tb_airspace_apply_PK (number)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='����������Ϣ��';

alter table t_air_apply comment '����������Ϣ��';

/*==============================================================*/
/* Table: t_air_plan                                            */
/*==============================================================*/
create table t_air_plan
(
   id                   int not null auto_increment,
   number               varchar(20) not null comment '��ţ��ñ����ϵͳ�Զ����ɣ���2017��6��12�չ��ݴ�ѧ��һ�౨�����ļƻ����Ϊ170612gzA01001,��170612��ʾ���ڣ�GZ��������A����һ�౨�����01��ʾһ�౨������ţ�001��ʾ�ƻ����',
   apply_user           varchar(50) not null comment '��������',
   user_id              varchar(64) not null comment '����id����ҵid',
   user_type            tinyint(2) not null default 1 comment '�û����ͣ�1���ˣ�2��ҵ',
   type                 tinyint(2) not null default 0 comment '���мƻ��������ͣ�0Ϊ���Ʒ��мƻ���1Ϊһ����мƻ���2Ϊ������мƻ�',
   plan_type            varchar(10) not null default '0' comment '�ƻ����ͣ�0������1������ѵ��2��Ʒ�Է�',
   plan_begin_time      datetime not null default '0000-00-00 00:00:00' comment '�ƻ���ʼʱ��',
   plan_end_time        datetime not null default '0000-00-00 00:00:00' comment '�ƻ�����ʱ��',
   actual_begin_time    datetime default NULL comment 'ʵ�ʿ�ʼʱ��',
   actual_end_time      datetime default NULL comment 'ʵ�ʽ���ʱ��',
   contact_info         varchar(255) default NULL comment '��ϵ����Ϣ',
   emergency_contact_info varchar(255) comment '������ϵ����Ϣ',
   weather_condition    varchar(255) default NULL comment '��������',
   flight_rule          varchar(255) comment '���й���',
   create_time          datetime default NULL comment '����ʱ��',
   audit_time           datetime default NULL comment '����ʱ��',
   status               tinyint(2) not null default 0 comment '���״̬��0����У�1ͨ����ˣ�2δͨ����ˣ�3ִ���У�4����ɣ�5�ƻ���ʱ��6��������',
   remark               varchar(255) default NULL comment '��ע',
   reason               varchar(255) default NULL comment '���ʧ��ԭ��',
   task_type            varchar(255) comment '��������',
   auditor              varchar(50) comment '�����',
   primary key (id),
   unique key tb_air_plan_PK (number)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='���мƻ���';

alter table t_air_plan comment '���мƻ������';

/*==============================================================*/
/* Table: t_airspace                                            */
/*==============================================================*/
create table t_airspace
(
   id                   int not null auto_increment,
   type                 tinyint(4) default NULL comment '0-���� 1-һ�� 2����',
   name                 varchar(50) default NULL comment '��������',
   sketch_map           varchar(255) default NULL comment 'ʾ��ͼ·��',
   scope_type           tinyint(4) default 0 comment '����Χ����,1Բ�Σ�2�����',
   scope_info           varchar(2000) default NULL comment '����Χ��Ϣ',
   height               varchar(20) default '0' comment '��ߣ���λΪ��',
   capacity             int comment '��������',
   location             varchar(255) comment 'λ��',
   location_desc        varchar(255) default NULL comment 'λ������',
   effective_time       datetime default NULL comment '��Чʱ��',
   expire_date          datetime default NULL comment 'ʧЧʱ��',
   apply_official_no    varchar(255) not null comment '�������ı��',
   creator_id           varchar(64) not null comment '������ID',
   create_time          datetime comment '����ʱ��',
   status               varchar(10) comment '����״̬��start��ʼ stopֹͣ pause��ͣ',
   creator_type         char(2) comment '����������',
   primary key (id),
   unique key tb_airspace_info_PK (id)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='������Ϣ��';

alter table t_airspace comment '������Ϣ��';

/*==============================================================*/
/* Table: t_airspace_air_apply_landing_ref                      */
/*==============================================================*/
create table t_airspace_air_apply_landing_ref
(
   id                   int not null auto_increment,
   airspace_id          int comment '������ϢID',
   air_apply_id         int default NULL comment '����������',
   landing_id           int default NULL comment '�𽵳�id',
   primary key (id),
   unique key tb_plan_landing_ref_PK (id)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�����������𽵳���ϵ��';

alter table t_airspace_air_apply_landing_ref comment '����������������𽵳���ϵ��';

/*==============================================================*/
/* Table: t_airspace_jurisdiction_ref                           */
/*==============================================================*/
create table t_airspace_jurisdiction_ref
(
   id                   int not null auto_increment comment 'rowid',
   jurisdiction_id      int comment '��Ͻ��ID',
   airspace_id          int comment '����ID',
   primary key (id)
);

alter table t_airspace_jurisdiction_ref comment '�������Ͻ����ϵ��';

/*==============================================================*/
/* Table: t_apply_official_no                                   */
/*==============================================================*/
create table t_apply_official_no
(
   id                   int not null auto_increment comment 'rowid',
   apply_unit           varchar(255) comment '������λ',
   apply_name           varchar(255) comment '�ֺ�',
   apply_no             varchar(255) comment '���',
   actual_begin_time    datetime default NULL comment 'ʵ�ʿ�ʼʱ��',
   actual_end_time      datetime default NULL comment 'ʵ�ʽ���ʱ��',
   weather_condition    varchar(255) default NULL comment '��������',
   planes               varchar(255) not null comment 'ʹ�û�����Ϣ����json�洢����ʽΪ{"name":"ֱ����","number":3}',
   flight_rule          varchar(255) comment '���й���',
   height               varchar(20) default '0' comment '��ߣ���λΪ��',
   apply_official_no    varchar(255) not null comment '�������ı��',
   task_type            varchar(255) comment '��������',
   primary key (id)
);

alter table t_apply_official_no comment '������Ϣ��';

/*==============================================================*/
/* Table: t_apply_official_no_landing_ref                       */
/*==============================================================*/
create table t_apply_official_no_landing_ref
(
   id                   int not null auto_increment comment 'rowid',
   landing_id           int comment '�𽵳�ID',
   apply_official_no_id int comment '�������ı��ID',
   primary key (id)
);

alter table t_apply_official_no_landing_ref comment '�������𽵳���ϵ��';

/*==============================================================*/
/* Table: t_dictionary                                          */
/*==============================================================*/
create table t_dictionary
(
   id                   int(11) not null auto_increment,
   name                 varchar(64) default NULL comment '�ֵ�����',
   code                 varchar(64) default NULL comment '�ֵ�ID',
   parent_code          varchar(64) default NULL comment '�ϼ�ID',
   is_parent            bit(1) default NULL comment '�Ƿ����¼�(0Ϊû�У�1Ϊ��)',
   remark               varchar(64) default NULL comment '��ע',
   primary key (id)
)
ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='�����ֵ��';

alter table t_dictionary comment '�����ֵ��';

/*==============================================================*/
/* Table: t_jurisdiction                                        */
/*==============================================================*/
create table t_jurisdiction
(
   id                   int not null auto_increment comment 'ROWID',
   jurisdiction_level   char(1) comment '��Ͻ������
            1��һ����������ʡ�������� 
            2���������������ؼ�������
            3���������������ؼ�������
            4���ļ����������缶������
            5���弶���������弶������
            6���������������鼶������
            ----------------------------------------------
            1 ս����	
            2 ������	
            3 ��վ��
            
            ',
   jurisdiction_id      varchar(255) comment '����ID',
   parent_jurisdiction_id varchar(255) comment '�ϼ�ID',
   dministrative_area_name varchar(10) comment '��������
            xxʡ
            xx��
            xx��
            xx��
            xx��
            xx��
            
            ս����
            xx���ƴ�
            xx���Ʒ���
            xx����ֱϽ����/xx����������
            ',
   jurisdiction_type    varchar(20) comment '��Ͻ����:administrative������ Theaterս��',
   primary key (id)
);

alter table t_jurisdiction comment '��Ͻ����';

/*==============================================================*/
/* Table: t_landing                                             */
/*==============================================================*/
create table t_landing
(
   id                   int not null auto_increment,
   name                 varchar(50) not null comment '�𽵳�����',
   lng                  varchar(12) not null comment '����',
   lat                  varchar(12) not null comment 'γ��',
   location             varchar(255) not null comment 'λ������',
   langding_sources     char(1) comment '�𽵳���Ϣ��Դ��0������Ϣ���룬1ϵͳ���룬2�û�����',
   creator_id           varchar(64) not null comment '������ID',
   create_time          datetime comment '����ʱ��',
   primary key (id),
   unique key tb_landing_PK (id)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�𽵳���Ϣ��';

alter table t_landing comment '�𽵳���Ϣ��';

/*==============================================================*/
/* Table: t_location                                            */
/*==============================================================*/
create table t_location
(
   location_type        int comment '���򼶱�0ֱϽ�У�1ʡ��2�У�3��......',
   location_id          int not null auto_increment comment '����ID',
   location_name        varchar(20) comment '�������ƣ��㶫ʡ�������У�Խ����',
   primary key (location_id)
);

alter table t_location comment '����λ��';

/*==============================================================*/
/* Table: t_operation_log                                       */
/*==============================================================*/
create table t_operation_log
(
   id                   int not null auto_increment comment 'rowid',
   operation_id         int comment '���������ݵ�rowid',
   modify_user          varchar(50) comment '������',
   modify_time          datetime comment '����ʱ��',
   pre_status           tinyint comment '����ǰ״̬��0����У�1���ͨ����2δͨ�����,3��������''',
   post_status          tinyint comment '������״̬��0����У�1���ͨ����2δͨ�����,3��������''',
   ip_address           varchar(20) comment 'IP��ַ:127.0.0.1',
   operation_type       char(1) comment '�������ͣ�C:����, R:��ѯ,U:�޸�,D:ɾ��',
   operation_result     char(1) comment '���������F��ʧ�ܣ�S���ɹ�',
   operation_obj        varchar(100) comment '����ʵ����air_plan���мƻ���air_apply��������',
   primary key (id)
);

alter table t_operation_log comment '������־��';

/*==============================================================*/
/* Table: t_plan_airspace_ref                                   */
/*==============================================================*/
create table t_plan_airspace_ref
(
   id                   int not null auto_increment comment 'rowid',
   airspace_id          int not null comment '������Ϣ��id',
   plan_id              int not null comment '���мƻ����',
   primary key (id),
   unique key tb_plan_airspace_ref_PK (id)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�ƻ�������ϵ��';

alter table t_plan_airspace_ref comment '�ƻ�������ϵ��';

/*==============================================================*/
/* Table: t_serial_number                                       */
/*==============================================================*/
create table t_serial_number
(
   id                   int not null auto_increment comment 'rowid',
   max_serial_number    int comment 'max_serial_number',
   name                 varchar(255) comment '����',
   type                 char(1) comment '���ͣ�0ÿ�첻������ 1 ÿ����Ҫ����',
   primary key (id)
);

alter table t_serial_number comment '��ˮ�Ŵ洢��';

/*==============================================================*/
/* Table: t_uav                                                 */
/*==============================================================*/
create table t_uav
(
   id                   int not null auto_increment,
   user_id              varchar(64) not null,
   uav_model_id         int(11) not null,
   sn                   varbinary(255),
   registration_number  varbinary(255),
   remark               varbinary(255),
   primary key (id)
);

alter table t_uav comment '���˻���';

/*==============================================================*/
/* Table: t_uav_air_apply_ref                                   */
/*==============================================================*/
create table t_uav_air_apply_ref
(
   id                   int not null auto_increment comment 'rowid',
   uav_id               int comment '���˻�ID',
   air_apply_id         int comment '���������ID',
   primary key (id)
);

alter table t_uav_air_apply_ref comment '���˻������������Ϣ��ϵ��';

/*==============================================================*/
/* Table: t_uav_air_plan_ref                                    */
/*==============================================================*/
create table t_uav_air_plan_ref
(
   id                   int not null auto_increment,
   uav_id               int not null,
   air_plan_id          int(11) not null,
   primary key (id)
);

/*==============================================================*/
/* Table: t_uav_manufacturer                                    */
/*==============================================================*/
create table t_uav_manufacturer
(
   id                   int not null auto_increment,
   name                 varchar(64) not null,
   description          varchar(255),
   contact_name         varchar(30),
   contact_phone        varchar(30),
   create_time          datetime,
   primary key (id)
);

alter table t_uav_manufacturer comment '���˻����̱�';

/*==============================================================*/
/* Table: t_uav_model                                           */
/*==============================================================*/
create table t_uav_model
(
   id                   int not null auto_increment,
   uav_manufacturer_id  int(11) not null,
   type                 tinyint(4),
   model                tinyint(4),
   img_url              varchar(255),
   description          varchar(255),
   primary key (id)
);

alter table t_airspace_air_apply_landing_ref add constraint FK_Reference_3 foreign key (air_apply_id)
      references t_air_apply (id) on delete restrict on update restrict;

alter table t_airspace_air_apply_landing_ref add constraint FK_Reference_4 foreign key (landing_id)
      references t_landing (id) on delete restrict on update restrict;

alter table t_airspace_air_apply_landing_ref add constraint FK_Reference_6 foreign key (airspace_id)
      references t_airspace (id) on delete restrict on update restrict;

alter table t_airspace_jurisdiction_ref add constraint FK_Reference_8 foreign key (jurisdiction_id)
      references t_jurisdiction (id) on delete restrict on update restrict;

alter table t_airspace_jurisdiction_ref add constraint FK_Reference_9 foreign key (airspace_id)
      references t_airspace (id) on delete restrict on update restrict;

alter table t_apply_official_no_landing_ref add constraint FK_Reference_12 foreign key (apply_official_no_id)
      references t_apply_official_no (id) on delete restrict on update restrict;

alter table t_apply_official_no_landing_ref add constraint FK_Reference_13 foreign key (landing_id)
      references t_landing (id) on delete restrict on update restrict;

alter table t_plan_airspace_ref add constraint FK_Reference_1 foreign key (plan_id)
      references t_air_plan (id) on delete restrict on update restrict;

alter table t_plan_airspace_ref add constraint FK_Reference_2 foreign key (airspace_id)
      references t_airspace (id) on delete restrict on update restrict;

alter table t_uav add constraint FK_Reference_7 foreign key (uav_model_id)
      references t_uav_model (id) on delete restrict on update restrict;

alter table t_uav_air_apply_ref add constraint FK_Reference_14 foreign key (uav_id)
      references t_uav (id) on delete restrict on update restrict;

alter table t_uav_air_apply_ref add constraint FK_Reference_15 foreign key (air_apply_id)
      references t_air_apply (id) on delete restrict on update restrict;

alter table t_uav_air_plan_ref add constraint FK_Reference_10 foreign key (uav_id)
      references t_uav (id) on delete restrict on update restrict;

alter table t_uav_air_plan_ref add constraint FK_Reference_11 foreign key (air_plan_id)
      references t_air_plan (id) on delete restrict on update restrict;

alter table t_uav_model add constraint FK_Reference_5 foreign key (uav_manufacturer_id)
      references t_uav_manufacturer (id) on delete restrict on update restrict;

