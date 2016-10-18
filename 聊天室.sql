/*
Navicat MySQL Data Transfer

Source Server         : www.csjcxs.com
Source Server Version : 50625
Source Host           : www.csjcxs.com:3306
Source Database       : jiaoyou

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2016-04-20 12:43:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin_user
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(16) DEFAULT NULL COMMENT '用户名',
  `password` varchar(32) DEFAULT NULL COMMENT '密码',
  `logintime` int(10) DEFAULT '0' COMMENT '上次登陆时间',
  `rank` int(1) DEFAULT '2' COMMENT '权限 1为超级管理员2普通管理员 ',
  `addtime` int(10) DEFAULT '0' COMMENT '添加时间',
  `quanx` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_user
-- ----------------------------
INSERT INTO `admin_user` VALUES ('16', 'xiaozhikai', 'e10adc3949ba59abbe56e057f20f883e', '1457342394', '2', '1456888763', 'love');
INSERT INTO `admin_user` VALUES ('1', 'admin', '21232f297a57a5a743894a0e4a801fc3', '1461119260', '1', '0', 'message,love,shenhe_images,on,on');
INSERT INTO `admin_user` VALUES ('26', '哈哈', 'e10adc3949ba59abbe56e057f20f883e', '1458120474', '2', '1458117880', 'shenhe_images');
INSERT INTO `admin_user` VALUES ('31', 'huangxiao', 'f6f74a3bebce2102877aa55db19cf637', '1461073599', '2', '1459324450', 'base_index,set_pay');
INSERT INTO `admin_user` VALUES ('30', '001', 'e10adc3949ba59abbe56e057f20f883e', '1460347610', '2', '1458525906', 'shenhe_images,message,love,index_user_add,index_user,yulantu');
INSERT INTO `admin_user` VALUES ('34', '17751556218', '405175655dfcf02daf34b883f8e83e3f', '1460166088', '2', '1460166071', 'userList,chongzhi,xiaofei');
INSERT INTO `admin_user` VALUES ('35', '8325904@qq.com', '21232f297a57a5a743894a0e4a801fc3', '1460165445', '2', '1460163269', 'addHelp,index_user_add,index_user');
INSERT INTO `admin_user` VALUES ('36', 'clclcl', '405175655dfcf02daf34b883f8e83e3f', '1460178294', '2', '1460168019', 'addHelp,index_user_add,index_user,yulantu');

-- ----------------------------
-- Table structure for channel
-- ----------------------------
DROP TABLE IF EXISTS `channel`;
CREATE TABLE `channel` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '频道ID',
  `user_id` int(10) NOT NULL COMMENT '管理员ID',
  `title` varchar(120) NOT NULL COMMENT '频道名称',
  `url` varchar(300) DEFAULT NULL COMMENT '聊天室服务器地址',
  `image` varchar(300) NOT NULL COMMENT '图片地址',
  `open` tinyint(1) NOT NULL DEFAULT '0' COMMENT '频道是否开放围观,0不开放(默认) ,1开放',
  `state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '频道状态, 0禁用，1启用(默认)',
  `max_num` int(10) DEFAULT NULL COMMENT '允许进入的最大人数',
  `score` int(4) DEFAULT NULL COMMENT '进入频道所需积分',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='频道表';

-- ----------------------------
-- Records of channel
-- ----------------------------
INSERT INTO `channel` VALUES ('1', '47', '幸福在线一台', 'http://120.25.223.158:800/red5s/void158.jsp', '/klzx/Public/Uploads/channel/2016-04-19/5715bf53e60b9.jpg', '1', '1', '100', '0', '123456789');
INSERT INTO `channel` VALUES ('2', '17', '撒旦撒旦撒旦', '58.221.62.54', '/klzx/Public/Uploads/channel/2016-04-09/57084c57d508c.jpg', '1', '1', null, null, '1460161623');
INSERT INTO `channel` VALUES ('3', '43', '测试', 'http://120.25.223.158:800/red5s/void158.jsp', '/klzx/Public/Uploads/channel/2016-04-09/57084d7ed41e8.jpg', '1', '0', null, null, '1460161918');
INSERT INTO `channel` VALUES ('4', '17', '撒旦撒旦撒', '58.221.62.54', '/klzx/Public/Uploads/channel/2016-04-09/57085e05c2a36.jpg', '1', '1', null, null, '1460161935');
INSERT INTO `channel` VALUES ('5', '87', '幸福在线5室', '58.221.62.54', '/klzx/Public/Uploads/channel/2016-04-09/57086f38b8a45.jpg', '1', '1', null, null, '1460170552');
INSERT INTO `channel` VALUES ('6', '17', '幸福在线五台', '58.221.62.54', '/klzx/Public/Uploads/channel/2016-04-11/570b1e1e469d3.jpg', '1', '1', null, null, '1460346398');
INSERT INTO `channel` VALUES ('7', '47', '第七个聊天室', '58.221.62.54', '/klzx/Public/Uploads/channel/2016-04-19/5715d4143b005.jpg', '1', '1', null, null, '1461048340');
INSERT INTO `channel` VALUES ('8', '47', '第八个', '58.221.62.54', '/klzx/Public/Uploads/channel/2016-04-19/5715d44bd17af.jpg', '1', '1', null, null, '1461048395');
INSERT INTO `channel` VALUES ('9', '43', '测试添加聊天室功能', null, '/klzx/Public/Uploads/channel/2016-04-19/5715faf83a4d2.jpg', '1', '1', null, null, '1461058296');
INSERT INTO `channel` VALUES ('10', '43', '聊天室', null, '/klzx/Public/Uploads/channel/2016-04-19/5715fc0e7e108.jpg', '1', '1', null, null, '1461058574');
INSERT INTO `channel` VALUES ('11', '43', '添加聊天室功能测试', null, '/klzx/Public/Uploads/channel/2016-04-19/5715fcf37b6be.jpg', '1', '1', null, null, '1461058803');
INSERT INTO `channel` VALUES ('12', '43', '添加聊天室', null, '/klzx/Public/Uploads/channel/2016-04-19/5715fd5f59e18.jpg', '1', '1', null, null, '1461058911');
INSERT INTO `channel` VALUES ('13', '43', '添加聊天测试', null, '/klzx/Public/Uploads/channel/2016-04-19/5715fd85df0cd.jpg', '1', '1', null, null, '1461058949');
INSERT INTO `channel` VALUES ('14', '43', '添加测试', null, '/klzx/Public/Uploads/channel/2016-04-19/5715fdc07476e.jpg', '1', '1', null, null, '1461059008');

-- ----------------------------
-- Table structure for channel_queue
-- ----------------------------
DROP TABLE IF EXISTS `channel_queue`;
CREATE TABLE `channel_queue` (
  `channel_id` int(10) NOT NULL COMMENT '频道ID',
  `user_id` int(10) NOT NULL COMMENT '用户ID',
  `time` int(11) NOT NULL COMMENT '进入队列时间',
  `online_time` int(11) NOT NULL COMMENT '在线时间',
  `video_on` tinyint(1) NOT NULL COMMENT '是否开启了视频聊天：0否(默认), 1已开启，2围观者',
  `position` tinyint(2) NOT NULL COMMENT '视频显示位置',
  `sex` tinyint(1) NOT NULL COMMENT '性别 1男 2女'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='频道进入等待队列表';

-- ----------------------------
-- Records of channel_queue
-- ----------------------------

-- ----------------------------
-- Table structure for channel_record
-- ----------------------------
DROP TABLE IF EXISTS `channel_record`;
CREATE TABLE `channel_record` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `user_id` int(10) NOT NULL,
  `channel_id` int(10) NOT NULL COMMENT '频道ID',
  `time` int(11) NOT NULL COMMENT '记录时间',
  `create_date` int(11) DEFAULT NULL COMMENT '记录日期',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=114 DEFAULT CHARSET=utf8 COMMENT='聊天室记录表';

-- ----------------------------
-- Records of channel_record
-- ----------------------------
INSERT INTO `channel_record` VALUES ('1', '27', '1', '1459923445', '1459872000');
INSERT INTO `channel_record` VALUES ('2', '37', '1', '1459923445', '1459872000');
INSERT INTO `channel_record` VALUES ('3', '21', '1', '1459923445', '1459872000');
INSERT INTO `channel_record` VALUES ('4', '41', '1', '1459923445', '1459872000');
INSERT INTO `channel_record` VALUES ('5', '46', '1', '1459923445', '1459872000');
INSERT INTO `channel_record` VALUES ('6', '56', '1', '1459923445', '1459872000');
INSERT INTO `channel_record` VALUES ('7', '47', '1', '1460013538', '1459958400');
INSERT INTO `channel_record` VALUES ('8', '44', '1', '1460084067', '1460044800');
INSERT INTO `channel_record` VALUES ('9', '38', '1', '1460084103', '1460044800');
INSERT INTO `channel_record` VALUES ('10', '37', '1', '1460084285', '1460044800');
INSERT INTO `channel_record` VALUES ('11', '39', '1', '1460095438', '1460044800');
INSERT INTO `channel_record` VALUES ('12', '40', '1', '1460095706', '1460044800');
INSERT INTO `channel_record` VALUES ('13', '75', '1', '1460096096', '1460044800');
INSERT INTO `channel_record` VALUES ('14', '41', '1', '1460097268', '1460044800');
INSERT INTO `channel_record` VALUES ('15', '71', '1', '1460098355', '1460044800');
INSERT INTO `channel_record` VALUES ('16', '17', '1', '1460099817', '1460044800');
INSERT INTO `channel_record` VALUES ('17', '21', '1', '1460100322', '1460044800');
INSERT INTO `channel_record` VALUES ('18', '43', '1', '1460113220', '1460044800');
INSERT INTO `channel_record` VALUES ('19', '43', '1', '1460154039', '1460131200');
INSERT INTO `channel_record` VALUES ('20', '46', '1', '1460170100', '1460131200');
INSERT INTO `channel_record` VALUES ('21', '37', '1', '1460186125', '1460131200');
INSERT INTO `channel_record` VALUES ('22', '44', '1', '1460189220', '1460131200');
INSERT INTO `channel_record` VALUES ('23', '38', '1', '1460190319', '1460131200');
INSERT INTO `channel_record` VALUES ('24', '54', '1', '1460204234', '1460131200');
INSERT INTO `channel_record` VALUES ('25', '40', '1', '1460204270', '1460131200');
INSERT INTO `channel_record` VALUES ('26', '39', '1', '1460208821', '1460131200');
INSERT INTO `channel_record` VALUES ('27', '41', '1', '1460209752', '1460131200');
INSERT INTO `channel_record` VALUES ('28', '71', '1', '1460209851', '1460131200');
INSERT INTO `channel_record` VALUES ('29', '43', '1', '1460268317', '1460217600');
INSERT INTO `channel_record` VALUES ('30', '38', '1', '1460338246', '1460304000');
INSERT INTO `channel_record` VALUES ('31', '37', '1', '1460341521', '1460304000');
INSERT INTO `channel_record` VALUES ('32', '75', '1', '1460345591', '1460304000');
INSERT INTO `channel_record` VALUES ('33', '47', '1', '1460355885', '1460304000');
INSERT INTO `channel_record` VALUES ('34', '44', '1', '1460361358', '1460304000');
INSERT INTO `channel_record` VALUES ('35', '54', '1', '1460362103', '1460304000');
INSERT INTO `channel_record` VALUES ('36', '21', '1', '1460362196', '1460304000');
INSERT INTO `channel_record` VALUES ('37', '39', '1', '1460366828', '1460304000');
INSERT INTO `channel_record` VALUES ('38', '37', '1', '1460425503', '1460390400');
INSERT INTO `channel_record` VALUES ('39', '44', '1', '1460425715', '1460390400');
INSERT INTO `channel_record` VALUES ('40', '75', '1', '1460425961', '1460390400');
INSERT INTO `channel_record` VALUES ('41', '39', '1', '1460442123', '1460390400');
INSERT INTO `channel_record` VALUES ('42', '40', '1', '1460442202', '1460390400');
INSERT INTO `channel_record` VALUES ('43', '38', '1', '1460442268', '1460390400');
INSERT INTO `channel_record` VALUES ('44', '80', '1', '1460442842', '1460390400');
INSERT INTO `channel_record` VALUES ('45', '33', '1', '1460446869', '1460390400');
INSERT INTO `channel_record` VALUES ('46', '46', '1', '1460465353', '1460390400');
INSERT INTO `channel_record` VALUES ('47', '38', '1', '1460516925', '1460476800');
INSERT INTO `channel_record` VALUES ('48', '75', '1', '1460517144', '1460476800');
INSERT INTO `channel_record` VALUES ('49', '47', '1', '1460771336', '1460736000');
INSERT INTO `channel_record` VALUES ('50', '47', '3', '1460771427', '1460736000');
INSERT INTO `channel_record` VALUES ('51', '102', '1', '1460778061', '1460736000');
INSERT INTO `channel_record` VALUES ('52', '91', '1', '1460796908', '1460736000');
INSERT INTO `channel_record` VALUES ('53', '100', '1', '1460860571', '1460822400');
INSERT INTO `channel_record` VALUES ('54', '99', '1', '1460861260', '1460822400');
INSERT INTO `channel_record` VALUES ('55', '101', '1', '1460862793', '1460822400');
INSERT INTO `channel_record` VALUES ('56', '46', '1', '1460902335', '1460822400');
INSERT INTO `channel_record` VALUES ('57', '101', '1', '1460939932', '1460908800');
INSERT INTO `channel_record` VALUES ('58', '38', '1', '1460940123', '1460908800');
INSERT INTO `channel_record` VALUES ('59', '40', '1', '1460940428', '1460908800');
INSERT INTO `channel_record` VALUES ('60', '89', '1', '1460940755', '1460908800');
INSERT INTO `channel_record` VALUES ('61', '102', '1', '1460940958', '1460908800');
INSERT INTO `channel_record` VALUES ('62', '104', '1', '1460942767', '1460908800');
INSERT INTO `channel_record` VALUES ('63', '99', '1', '1460948674', '1460908800');
INSERT INTO `channel_record` VALUES ('64', '100', '1', '1460953525', '1460908800');
INSERT INTO `channel_record` VALUES ('65', '47', '1', '1460958709', '1460908800');
INSERT INTO `channel_record` VALUES ('66', '44', '1', '1460964487', '1460908800');
INSERT INTO `channel_record` VALUES ('67', '75', '1', '1460964539', '1460908800');
INSERT INTO `channel_record` VALUES ('68', '105', '1', '1460964673', '1460908800');
INSERT INTO `channel_record` VALUES ('69', '106', '1', '1460965452', '1460908800');
INSERT INTO `channel_record` VALUES ('70', '43', '1', '1460966357', '1460908800');
INSERT INTO `channel_record` VALUES ('71', '46', '1', '1460967408', '1460908800');
INSERT INTO `channel_record` VALUES ('72', '91', '1', '1460970967', '1460908800');
INSERT INTO `channel_record` VALUES ('73', '101', '1', '1461027463', '1460995200');
INSERT INTO `channel_record` VALUES ('74', '47', '1', '1461028107', '1460995200');
INSERT INTO `channel_record` VALUES ('75', '99', '1', '1461028296', '1460995200');
INSERT INTO `channel_record` VALUES ('76', '75', '1', '1461028570', '1460995200');
INSERT INTO `channel_record` VALUES ('77', '38', '1', '1461028614', '1460995200');
INSERT INTO `channel_record` VALUES ('78', '39', '1', '1461028656', '1460995200');
INSERT INTO `channel_record` VALUES ('79', '40', '1', '1461028726', '1460995200');
INSERT INTO `channel_record` VALUES ('80', '41', '1', '1461028796', '1460995200');
INSERT INTO `channel_record` VALUES ('81', '44', '1', '1461029694', '1460995200');
INSERT INTO `channel_record` VALUES ('82', '43', '1', '1461029928', '1460995200');
INSERT INTO `channel_record` VALUES ('83', '107', '1', '1461031720', '1460995200');
INSERT INTO `channel_record` VALUES ('84', '105', '1', '1461035318', '1460995200');
INSERT INTO `channel_record` VALUES ('85', '104', '1', '1461037144', '1460995200');
INSERT INTO `channel_record` VALUES ('86', '81', '3', '1461043173', '1460995200');
INSERT INTO `channel_record` VALUES ('87', '89', '3', '1461043566', '1460995200');
INSERT INTO `channel_record` VALUES ('88', '102', '3', '1461043637', '1460995200');
INSERT INTO `channel_record` VALUES ('89', '104', '3', '1461043735', '1460995200');
INSERT INTO `channel_record` VALUES ('90', '105', '3', '1461043823', '1460995200');
INSERT INTO `channel_record` VALUES ('91', '89', '1', '1461044454', '1460995200');
INSERT INTO `channel_record` VALUES ('92', '102', '1', '1461045079', '1460995200');
INSERT INTO `channel_record` VALUES ('93', '81', '1', '1461045090', '1460995200');
INSERT INTO `channel_record` VALUES ('94', '106', '1', '1461048013', '1460995200');
INSERT INTO `channel_record` VALUES ('95', '100', '1', '1461047977', '1460995200');
INSERT INTO `channel_record` VALUES ('96', '91', '1', '1461049177', '1460995200');
INSERT INTO `channel_record` VALUES ('97', '46', '1', '1461049546', '1460995200');
INSERT INTO `channel_record` VALUES ('98', '17', '1', '1461051062', '1460995200');
INSERT INTO `channel_record` VALUES ('99', '21', '1', '1461052263', '1460995200');
INSERT INTO `channel_record` VALUES ('100', '82', '1', '1461060732', '1460995200');
INSERT INTO `channel_record` VALUES ('101', '108', '1', '1461064113', '1460995200');
INSERT INTO `channel_record` VALUES ('102', '109', '1', '1461066670', '1460995200');
INSERT INTO `channel_record` VALUES ('103', '43', '1', '1461105995', '1461081600');
INSERT INTO `channel_record` VALUES ('104', '105', '1', '1461107630', '1461081600');
INSERT INTO `channel_record` VALUES ('105', '104', '1', '1461107981', '1461081600');
INSERT INTO `channel_record` VALUES ('106', '107', '1', '1461108113', '1461081600');
INSERT INTO `channel_record` VALUES ('107', '106', '1', '1461108204', '1461081600');
INSERT INTO `channel_record` VALUES ('108', '82', '1', '1461108302', '1461081600');
INSERT INTO `channel_record` VALUES ('109', '81', '1', '1461108943', '1461081600');
INSERT INTO `channel_record` VALUES ('110', '46', '1', '1461108998', '1461081600');
INSERT INTO `channel_record` VALUES ('111', '109', '1', '1461109056', '1461081600');
INSERT INTO `channel_record` VALUES ('112', '108', '1', '1461109730', '1461081600');
INSERT INTO `channel_record` VALUES ('113', '91', '1', '1461116754', '1461081600');

-- ----------------------------
-- Table structure for chongzhi_info
-- ----------------------------
DROP TABLE IF EXISTS `chongzhi_info`;
CREATE TABLE `chongzhi_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned DEFAULT NULL COMMENT '会员id',
  `chongzhi_money` float(10,2) unsigned DEFAULT NULL COMMENT '充值金额',
  `chongzhi_time` varchar(50) DEFAULT '' COMMENT '充值时间',
  `daoqi_time` varchar(50) DEFAULT NULL COMMENT '会员到期时间',
  `name` varchar(60) DEFAULT NULL COMMENT '充值项',
  `chongzhi_phone` varchar(11) DEFAULT '' COMMENT '手机号码',
  `order_id` int(11) DEFAULT NULL COMMENT '对应的支付订单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of chongzhi_info
-- ----------------------------
INSERT INTO `chongzhi_info` VALUES ('5', '37', '0.01', '1460536452', null, 'VIP会员1个月', '', '22');
INSERT INTO `chongzhi_info` VALUES ('6', '37', '0.01', '1460536914', null, '充值50金币', '', '23');
INSERT INTO `chongzhi_info` VALUES ('7', '37', '0.01', '1460537225', null, '充值150金币', '', '24');
INSERT INTO `chongzhi_info` VALUES ('8', '21', '0.01', '1460546160', null, 'VIP会员1个月', '', '40');
INSERT INTO `chongzhi_info` VALUES ('9', '88', '0.01', '1460555919', null, 'VIP会员1年', '', '41');
INSERT INTO `chongzhi_info` VALUES ('10', '21', '0.01', '1460557508', null, 'VIP会员1个月', '', '42');
INSERT INTO `chongzhi_info` VALUES ('11', '21', '0.01', '1460558346', null, '充值50金币', '', '43');
INSERT INTO `chongzhi_info` VALUES ('12', '21', '0.01', '1460558425', null, '充值400金币', '', '44');
INSERT INTO `chongzhi_info` VALUES ('13', '95', '0.01', '1460597716', null, '充值400金币', '', '46');
INSERT INTO `chongzhi_info` VALUES ('14', '95', '0.01', '1460598268', null, 'VIP会员1年', '', '47');
INSERT INTO `chongzhi_info` VALUES ('15', '96', '0.01', '1460599414', null, '充值150金币', '', '48');
INSERT INTO `chongzhi_info` VALUES ('16', '96', '0.01', '1460601291', null, 'VIP会员半年', '', '50');
INSERT INTO `chongzhi_info` VALUES ('17', '21', '0.01', '1460602745', null, 'VIP会员1个月', '', '51');
INSERT INTO `chongzhi_info` VALUES ('18', '98', '0.01', '1460606299', null, '充值50金币', '', '53');
INSERT INTO `chongzhi_info` VALUES ('19', '98', '0.01', '1460614126', null, 'VIP会员1个月', '', '55');
INSERT INTO `chongzhi_info` VALUES ('20', '21', '0.01', '1460616141', null, '充值400金币', '', '56');
INSERT INTO `chongzhi_info` VALUES ('21', '21', '0.01', '1460616223', null, 'VIP会员1个月', '', '57');
INSERT INTO `chongzhi_info` VALUES ('22', '21', '0.01', '1460637356', null, 'VIP会员半年', '', '64');
INSERT INTO `chongzhi_info` VALUES ('23', '88', '0.01', '1460686705', null, '充值400金币', '', '102');
INSERT INTO `chongzhi_info` VALUES ('24', '88', '0.01', '1460686823', null, 'VIP会员1年', '', '103');
INSERT INTO `chongzhi_info` VALUES ('25', '21', '0.01', '1460692125', null, 'VIP会员半年', '', '104');
INSERT INTO `chongzhi_info` VALUES ('26', '98', '0.01', '1460692223', null, 'VIP会员1个月', '', '105');
INSERT INTO `chongzhi_info` VALUES ('27', '98', '0.01', '1460692385', null, '充值400金币', '', '106');
INSERT INTO `chongzhi_info` VALUES ('28', '21', '0.01', '1460696649', null, 'VIP会员半年', '', '113');
INSERT INTO `chongzhi_info` VALUES ('29', '21', '0.01', '1460696970', null, 'VIP会员半年', '', '114');
INSERT INTO `chongzhi_info` VALUES ('30', '21', '0.01', '1460697125', null, '充值150金币', '', '115');
INSERT INTO `chongzhi_info` VALUES ('31', '88', '0.01', '1460697973', null, '充值150金币', '', '116');
INSERT INTO `chongzhi_info` VALUES ('32', '21', '0.01', '1460698672', null, 'VIP会员半年', '', '117');
INSERT INTO `chongzhi_info` VALUES ('33', '21', '0.01', '1460698734', null, '充值150金币', '', '118');
INSERT INTO `chongzhi_info` VALUES ('34', '88', '0.01', '1460701784', null, 'VIP会员半年', '', '137');
INSERT INTO `chongzhi_info` VALUES ('35', '88', '0.01', '1460702671', null, 'VIP会员半年', '', '152');
INSERT INTO `chongzhi_info` VALUES ('36', '88', '0.01', '1460702776', null, 'VIP会员1年', '', '155');
INSERT INTO `chongzhi_info` VALUES ('37', '88', '0.01', '1460702858', null, '充值400金币', '', '156');
INSERT INTO `chongzhi_info` VALUES ('38', '98', '0.01', '1460704248', null, 'VIP会员半年', '', '157');
INSERT INTO `chongzhi_info` VALUES ('39', '38', '0.01', '1460705896', null, 'VIP会员半年', '', '163');
INSERT INTO `chongzhi_info` VALUES ('40', '97', '0.01', '1460707830', null, 'VIP会员1年', '', '169');
INSERT INTO `chongzhi_info` VALUES ('41', '97', '0.01', '1460707962', null, '充值50金币', '', '170');
INSERT INTO `chongzhi_info` VALUES ('42', '93', '0.01', '1460708439', null, 'VIP会员半年', '', '171');
INSERT INTO `chongzhi_info` VALUES ('43', '17', '0.01', '1460708643', null, 'VIP会员1个月', '', '172');
INSERT INTO `chongzhi_info` VALUES ('44', '99', '0.01', '1460710218', null, '充值50金币', '', '173');
INSERT INTO `chongzhi_info` VALUES ('45', '99', '0.01', '1460710376', null, '充值400金币', '', '174');
INSERT INTO `chongzhi_info` VALUES ('46', '99', '0.01', '1460710767', null, '充值150金币', '', '175');
INSERT INTO `chongzhi_info` VALUES ('47', '99', '0.01', '1460710938', null, 'VIP会员1年', '', '176');
INSERT INTO `chongzhi_info` VALUES ('48', '100', '0.01', '1460711770', null, '充值150金币', '', '177');
INSERT INTO `chongzhi_info` VALUES ('49', '100', '0.01', '1460711856', null, '充值50金币', '', '178');
INSERT INTO `chongzhi_info` VALUES ('50', '100', '0.01', '1460712479', null, 'VIP会员1个月', '', '179');
INSERT INTO `chongzhi_info` VALUES ('51', '101', '0.01', '1460712917', null, '充值400金币', '', '180');
INSERT INTO `chongzhi_info` VALUES ('52', '101', '0.01', '1460713096', null, 'VIP会员半年', '', '181');
INSERT INTO `chongzhi_info` VALUES ('53', '93', '0.01', '1460727743', null, 'VIP会员半年', '', '184');
INSERT INTO `chongzhi_info` VALUES ('54', '93', '0.01', '1460729425', null, 'VIP会员1个月', '', '188');
INSERT INTO `chongzhi_info` VALUES ('55', '102', '0.01', '1460775914', null, 'VIP会员1个月', '', '195');
INSERT INTO `chongzhi_info` VALUES ('56', '102', '0.01', '1460776052', null, '充值50金币', '', '196');
INSERT INTO `chongzhi_info` VALUES ('57', '93', '0.01', '1460774799', null, '充值400金币', '', '194');
INSERT INTO `chongzhi_info` VALUES ('58', '105', '0.01', '1460776631', null, 'VIP会员1个月', '', '199');
INSERT INTO `chongzhi_info` VALUES ('59', '106', '0.01', '1460776797', null, 'VIP会员1个月', '', '201');
INSERT INTO `chongzhi_info` VALUES ('60', '107', '0.01', '1460776910', null, 'VIP会员1个月', '', '202');
INSERT INTO `chongzhi_info` VALUES ('61', '91', '0.01', '1460796673', null, 'VIP会员1年', '', '235');
INSERT INTO `chongzhi_info` VALUES ('62', '21', '0.01', '1460804070', null, 'VIP会员半年', '', '267');
INSERT INTO `chongzhi_info` VALUES ('63', '21', '0.01', '1460805723', null, 'VIP会员半年', '', '271');
INSERT INTO `chongzhi_info` VALUES ('64', '21', '0.01', '1460805852', null, 'VIP会员半年', '', '272');
INSERT INTO `chongzhi_info` VALUES ('65', '21', '0.01', '1460884968', null, 'VIP会员半年', '', '278');
INSERT INTO `chongzhi_info` VALUES ('66', '21', '0.01', '1460885446', null, 'VIP会员1个月', '', '281');
INSERT INTO `chongzhi_info` VALUES ('67', '21', '0.01', '1460885259', null, 'VIP会员半年', '', '279');
INSERT INTO `chongzhi_info` VALUES ('68', '21', '0.01', '1460885911', null, 'VIP会员半年', '', '282');
INSERT INTO `chongzhi_info` VALUES ('69', '21', '0.01', '1460889079', null, 'VIP会员半年', '', '298');
INSERT INTO `chongzhi_info` VALUES ('70', '21', '0.01', '1460889706', null, 'VIP会员半年', '', '300');
INSERT INTO `chongzhi_info` VALUES ('71', '21', '0.01', '1460890010', null, 'VIP会员1个月', '', '301');
INSERT INTO `chongzhi_info` VALUES ('72', '75', '0.01', '1460964256', null, 'VIP会员半年', '', '303');
INSERT INTO `chongzhi_info` VALUES ('73', '44', '0.01', '1460964430', null, 'VIP会员1年', '', '304');
INSERT INTO `chongzhi_info` VALUES ('74', '21', '0.01', '1461072507', null, '充值150金币', '', '308');

-- ----------------------------
-- Table structure for follow_info
-- ----------------------------
DROP TABLE IF EXISTS `follow_info`;
CREATE TABLE `follow_info` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '关注id',
  `bfollow_id` int(10) DEFAULT NULL COMMENT '被关注id',
  `follow_id` int(10) DEFAULT NULL COMMENT '关注人id',
  `status` tinyint(4) DEFAULT '0' COMMENT '是否被关注',
  PRIMARY KEY (`id`),
  KEY `follow` (`bfollow_id`,`follow_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of follow_info
-- ----------------------------
INSERT INTO `follow_info` VALUES ('13', '17', '21', '1');
INSERT INTO `follow_info` VALUES ('14', '22', '21', '0');
INSERT INTO `follow_info` VALUES ('15', '21', '22', '1');
INSERT INTO `follow_info` VALUES ('16', '21', '17', '0');
INSERT INTO `follow_info` VALUES ('17', '18', '21', '0');
INSERT INTO `follow_info` VALUES ('18', '24', '17', '1');
INSERT INTO `follow_info` VALUES ('19', '23', null, '1');
INSERT INTO `follow_info` VALUES ('20', '23', null, '1');
INSERT INTO `follow_info` VALUES ('21', '23', null, '1');
INSERT INTO `follow_info` VALUES ('22', '23', null, '1');
INSERT INTO `follow_info` VALUES ('23', '23', null, '1');
INSERT INTO `follow_info` VALUES ('24', '23', null, '1');
INSERT INTO `follow_info` VALUES ('25', '23', null, '1');
INSERT INTO `follow_info` VALUES ('26', '23', null, '1');
INSERT INTO `follow_info` VALUES ('27', '23', null, '1');
INSERT INTO `follow_info` VALUES ('28', '23', null, '1');
INSERT INTO `follow_info` VALUES ('29', '23', null, '1');
INSERT INTO `follow_info` VALUES ('30', '28', '31', '1');
INSERT INTO `follow_info` VALUES ('31', '17', '31', '0');
INSERT INTO `follow_info` VALUES ('32', '31', '32', '0');
INSERT INTO `follow_info` VALUES ('33', '31', '17', '1');
INSERT INTO `follow_info` VALUES ('34', '31', '28', '1');
INSERT INTO `follow_info` VALUES ('35', '44', '38', '1');
INSERT INTO `follow_info` VALUES ('36', '43', '17', '1');
INSERT INTO `follow_info` VALUES ('37', '45', '37', '0');
INSERT INTO `follow_info` VALUES ('38', '38', '37', '1');
INSERT INTO `follow_info` VALUES ('39', '37', '44', '1');
INSERT INTO `follow_info` VALUES ('40', '37', '54', '1');
INSERT INTO `follow_info` VALUES ('41', '37', '43', '1');
INSERT INTO `follow_info` VALUES ('42', '33', '55', '1');
INSERT INTO `follow_info` VALUES ('43', '37', '21', '0');
INSERT INTO `follow_info` VALUES ('44', '44', '37', '1');
INSERT INTO `follow_info` VALUES ('45', '17', '37', '1');
INSERT INTO `follow_info` VALUES ('46', '22', '46', '1');
INSERT INTO `follow_info` VALUES ('47', '47', '79', '0');
INSERT INTO `follow_info` VALUES ('48', '54', '43', '0');
INSERT INTO `follow_info` VALUES ('49', '27', '82', '1');
INSERT INTO `follow_info` VALUES ('50', '46', '43', '1');
INSERT INTO `follow_info` VALUES ('51', '43', '46', '1');
INSERT INTO `follow_info` VALUES ('52', '17', '46', '0');
INSERT INTO `follow_info` VALUES ('53', '37', '17', '1');
INSERT INTO `follow_info` VALUES ('54', '89', '88', '1');
INSERT INTO `follow_info` VALUES ('55', '54', '40', '1');
INSERT INTO `follow_info` VALUES ('56', '40', '54', '0');
INSERT INTO `follow_info` VALUES ('57', '37', '38', '1');
INSERT INTO `follow_info` VALUES ('58', '37', '80', '1');
INSERT INTO `follow_info` VALUES ('59', '75', '38', '1');
INSERT INTO `follow_info` VALUES ('60', '38', '75', '1');
INSERT INTO `follow_info` VALUES ('61', '33', '38', '1');
INSERT INTO `follow_info` VALUES ('62', '46', '38', '1');
INSERT INTO `follow_info` VALUES ('63', '93', '97', '1');
INSERT INTO `follow_info` VALUES ('64', '61', '98', '1');

-- ----------------------------
-- Table structure for guanggao
-- ----------------------------
DROP TABLE IF EXISTS `guanggao`;
CREATE TABLE `guanggao` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(30) DEFAULT '' COMMENT '广告名称',
  `url` varchar(100) DEFAULT NULL,
  `img_url` varchar(100) DEFAULT '' COMMENT '图片路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of guanggao
-- ----------------------------
INSERT INTO `guanggao` VALUES ('16', '首页轮播图', '', '');
INSERT INTO `guanggao` VALUES ('19', '幸福在线', '', '');
INSERT INTO `guanggao` VALUES ('21', '注册图片', '', '');
INSERT INTO `guanggao` VALUES ('22', '成功故事', '', '');
INSERT INTO `guanggao` VALUES ('23', '登录页面', '', '');
INSERT INTO `guanggao` VALUES ('24', '我的空间', '', '');

-- ----------------------------
-- Table structure for haoyou_info
-- ----------------------------
DROP TABLE IF EXISTS `haoyou_info`;
CREATE TABLE `haoyou_info` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `my_id` int(10) DEFAULT NULL,
  `friend_id` int(10) DEFAULT NULL,
  `lahei` tinyint(3) DEFAULT '0' COMMENT '是否拉黑 0不拉黑 1拉黑',
  PRIMARY KEY (`id`),
  KEY `my_index` (`my_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of haoyou_info
-- ----------------------------

-- ----------------------------
-- Table structure for help_info
-- ----------------------------
DROP TABLE IF EXISTS `help_info`;
CREATE TABLE `help_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT '' COMMENT '帮助标题',
  `content` text COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of help_info
-- ----------------------------
INSERT INTO `help_info` VALUES ('17', '关于我们', '&lt;h6 style=&quot;text-indent: 2em;&quot;&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: 宋体; font-size: 12px; line-height: 24px; background-color: rgb(255, 255, 255);&quot;&gt;幸福在线网是中国大众婚恋交友平台的领导者，倡导向大众单身群体提供易用性更强、性价比更高、选择面更宽的互联网婚恋交友服务，来满足单身人士轻松、大众化的找对象需求。目前已经有一亿九千三佰四十六万单身男女在有缘网上找对象。找对象，就上有缘网！有缘欢迎来电咨询相关合作事宜，大客户、KA、中小渠道等广告合作。&lt;/span&gt;&lt;br style=&quot;margin: 0px; padding: 0px; font-size: 12px; font-family: 宋体; color: rgb(102, 102, 102); list-style: none; outline: none; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;br style=&quot;margin: 0px; padding: 0px; font-size: 12px; font-family: 宋体; color: rgb(102, 102, 102); list-style: none; outline: none; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: 宋体; font-size: 12px; line-height: 24px; background-color: rgb(255, 255, 255);&quot;&gt;7*12小时网络客户反馈&lt;/span&gt;&lt;br style=&quot;margin: 0px; padding: 0px; font-size: 12px; font-family: 宋体; color: rgb(102, 102, 102); list-style: none; outline: none; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: 宋体; font-size: 12px; line-height: 24px; background-color: rgb(255, 255, 255);&quot;&gt;7*12小时一对一的热线电话客户服务&lt;/span&gt;&lt;br style=&quot;margin: 0px; padding: 0px; font-size: 12px; font-family: 宋体; color: rgb(102, 102, 102); list-style: none; outline: none; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: 宋体; font-size: 12px; line-height: 24px; background-color: rgb(255, 255, 255);&quot;&gt;您可以通过以下渠道与我们取得联系&lt;/span&gt;&lt;br style=&quot;margin: 0px; padding: 0px; font-size: 12px; font-family: 宋体; color: rgb(102, 102, 102); list-style: none; outline: none; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: 宋体; font-size: 12px; line-height: 24px; background-color: rgb(255, 255, 255);&quot;&gt;客户热线：010-58103520 (周一至周五：9：00--21：00）用户咨询用&lt;/span&gt;&lt;br style=&quot;margin: 0px; padding: 0px; font-size: 12px; font-family: 宋体; color: rgb(102, 102, 102); list-style: none; outline: none; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;br style=&quot;margin: 0px; padding: 0px; font-size: 12px; font-family: 宋体; color: rgb(102, 102, 102); list-style: none; outline: none; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; font-size: 12px; font-family: 宋体; color: rgb(102, 102, 102); list-style: none; outline: none; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;大客户（安卓客户端、IOS客户端、WAP页面、HTML5页面、WEB页面等）商务合作：&lt;/strong&gt;&lt;br style=&quot;margin: 0px; padding: 0px; font-size: 12px; font-family: 宋体; color: rgb(102, 102, 102); list-style: none; outline: none; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: 宋体; font-size: 12px; line-height: 24px; background-color: rgb(255, 255, 255);&quot;&gt;联系人：韩女士&lt;/span&gt;&lt;br style=&quot;margin: 0px; padding: 0px; font-size: 12px; font-family: 宋体; color: rgb(102, 102, 102); list-style: none; outline: none; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: 宋体; font-size: 12px; line-height: 24px; background-color: rgb(255, 255, 255);&quot;&gt;联系方式：hanb@youyuan.com&amp;nbsp;&lt;/span&gt;&lt;br style=&quot;margin: 0px; padding: 0px; font-size: 12px; font-family: 宋体; color: rgb(102, 102, 102); list-style: none; outline: none; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;br style=&quot;margin: 0px; padding: 0px; font-size: 12px; font-family: 宋体; color: rgb(102, 102, 102); list-style: none; outline: none; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; font-size: 12px; font-family: 宋体; color: rgb(102, 102, 102); list-style: none; outline: none; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;KA\\中小渠道（安卓客户端）商务合作：&lt;/strong&gt;&lt;br style=&quot;margin: 0px; padding: 0px; font-size: 12px; font-family: 宋体; color: rgb(102, 102, 102); list-style: none; outline: none; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: 宋体; font-size: 12px; line-height: 24px; background-color: rgb(255, 255, 255);&quot;&gt;联系人：杜女士&lt;/span&gt;&lt;br style=&quot;margin: 0px; padding: 0px; font-size: 12px; font-family: 宋体; color: rgb(102, 102, 102); list-style: none; outline: none; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: 宋体; font-size: 12px; line-height: 24px; background-color: rgb(255, 255, 255);&quot;&gt;联系方式：010-57643006-8521 duxy@youyuan.com&lt;/span&gt;&lt;br style=&quot;margin: 0px; padding: 0px; font-size: 12px; font-family: 宋体; color: rgb(102, 102, 102); list-style: none; outline: none; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;br style=&quot;margin: 0px; padding: 0px; font-size: 12px; font-family: 宋体; color: rgb(102, 102, 102); list-style: none; outline: none; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; font-size: 12px; font-family: 宋体; color: rgb(102, 102, 102); list-style: none; outline: none; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;KA\\中小渠道（WAP页面、HTML5页面）商务合作：&lt;/strong&gt;&lt;br style=&quot;margin: 0px; padding: 0px; font-size: 12px; font-family: 宋体; color: rgb(102, 102, 102); list-style: none; outline: none; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: 宋体; font-size: 12px; line-height: 24px; background-color: rgb(255, 255, 255);&quot;&gt;联系人：程先生&lt;/span&gt;&lt;br style=&quot;margin: 0px; padding: 0px; font-size: 12px; font-family: 宋体; color: rgb(102, 102, 102); list-style: none; outline: none; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: 宋体; font-size: 12px; line-height: 24px; background-color: rgb(255, 255, 255);&quot;&gt;联系方式：010-57643006-8517 chengy@youyuan.com&lt;/span&gt;&lt;br style=&quot;margin: 0px; padding: 0px; font-size: 12px; font-family: 宋体; color: rgb(102, 102, 102); list-style: none; outline: none; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;br style=&quot;margin: 0px; padding: 0px; font-size: 12px; font-family: 宋体; color: rgb(102, 102, 102); list-style: none; outline: none; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: 宋体; font-size: 12px; line-height: 24px; background-color: rgb(255, 255, 255);&quot;&gt;合作服务问题投诉邮箱：bdept@youyuan.com&lt;/span&gt;&lt;br style=&quot;margin: 0px; padding: 0px; font-size: 12px; font-family: 宋体; color: rgb(102, 102, 102); list-style: none; outline: none; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;br style=&quot;margin: 0px; padding: 0px; font-size: 12px; font-family: 宋体; color: rgb(102, 102, 102); list-style: none; outline: none; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; font-size: 12px; font-family: 宋体; color: rgb(102, 102, 102); list-style: none; outline: none; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;品牌合作：&lt;/strong&gt;&lt;br style=&quot;margin: 0px; padding: 0px; font-size: 12px; font-family: 宋体; color: rgb(102, 102, 102); list-style: none; outline: none; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: 宋体; font-size: 12px; line-height: 24px; background-color: rgb(255, 255, 255);&quot;&gt;联系人：强女士&lt;/span&gt;&lt;br style=&quot;margin: 0px; padding: 0px; font-size: 12px; font-family: 宋体; color: rgb(102, 102, 102); list-style: none; outline: none; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: 宋体; font-size: 12px; line-height: 24px; background-color: rgb(255, 255, 255);&quot;&gt;联系方式：010-57643006-7087 qiangw@youyuan.com&lt;/span&gt;&lt;br style=&quot;margin: 0px; padding: 0px; font-size: 12px; font-family: 宋体; color: rgb(102, 102, 102); list-style: none; outline: none; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;br style=&quot;margin: 0px; padding: 0px; font-size: 12px; font-family: 宋体; color: rgb(102, 102, 102); list-style: none; outline: none; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; font-size: 12px; font-family: 宋体; color: rgb(102, 102, 102); list-style: none; outline: none; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;媒介购买：&lt;/strong&gt;&lt;br style=&quot;margin: 0px; padding: 0px; font-size: 12px; font-family: 宋体; color: rgb(102, 102, 102); list-style: none; outline: none; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: 宋体; font-size: 12px; line-height: 24px; background-color: rgb(255, 255, 255);&quot;&gt;联系人：鲁先生&lt;/span&gt;&lt;br style=&quot;margin: 0px; padding: 0px; font-size: 12px; font-family: 宋体; color: rgb(102, 102, 102); list-style: none; outline: none; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: 宋体; font-size: 12px; line-height: 24px; background-color: rgb(255, 255, 255);&quot;&gt;联系方式：010-57643006-8522 luhc@youyuan.com&lt;/span&gt;&lt;br style=&quot;margin: 0px; padding: 0px; font-size: 12px; font-family: 宋体; color: rgb(102, 102, 102); list-style: none; outline: none; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;br style=&quot;margin: 0px; padding: 0px; font-size: 12px; font-family: 宋体; color: rgb(102, 102, 102); list-style: none; outline: none; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; font-size: 12px; font-family: 宋体; color: rgb(102, 102, 102); list-style: none; outline: none; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;媒体采访：&lt;/strong&gt;&lt;br style=&quot;margin: 0px; padding: 0px; font-size: 12px; font-family: 宋体; color: rgb(102, 102, 102); list-style: none; outline: none; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: 宋体; font-size: 12px; line-height: 24px; background-color: rgb(255, 255, 255);&quot;&gt;联系人：郭先生&lt;/span&gt;&lt;br style=&quot;margin: 0px; padding: 0px; font-size: 12px; font-family: 宋体; color: rgb(102, 102, 102); list-style: none; outline: none; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: 宋体; font-size: 12px; line-height: 24px; background-color: rgb(255, 255, 255);&quot;&gt;联系方式：010-57643116 guol@youyuan.com&lt;/span&gt;&lt;br style=&quot;margin: 0px; padding: 0px; font-size: 12px; font-family: 宋体; color: rgb(102, 102, 102); list-style: none; outline: none; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;br style=&quot;margin: 0px; padding: 0px; font-size: 12px; font-family: 宋体; color: rgb(102, 102, 102); list-style: none; outline: none; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: 宋体; font-size: 12px; line-height: 24px; background-color: rgb(255, 255, 255);&quot;&gt;地址：北京市朝阳区北苑路乙108号北美国际商务中心K2座&lt;/span&gt;&lt;br style=&quot;margin: 0px; padding: 0px; font-size: 12px; font-family: 宋体; color: rgb(102, 102, 102); list-style: none; outline: none; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: 宋体; font-size: 12px; line-height: 24px; background-color: rgb(255, 255, 255);&quot;&gt;邮编：100012&lt;/span&gt;&lt;/h6&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;');
INSERT INTO `help_info` VALUES ('18', '这里添加帮助', '&lt;p&gt;滴答滴答滴答滴答滴答滴答滴答滴答&lt;/p&gt;');
INSERT INTO `help_info` VALUES ('19', '注册协议多大', '&lt;p style=&quot;text-align: center;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;h4 style=&quot;margin: 0px 0px 5px; padding: 0px; font-size: 15px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(51, 51, 51); list-style: none; outline: none; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;1、注册条款的接受ddddddd&lt;/h4&gt;&lt;p style=&quot;margin: 0px auto 10px; padding: 0px; font-size: 14px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(102, 102, 102); list-style: none; outline: none; width: auto; height: auto; text-indent: 2em; line-height: 22.4px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;一旦会员注册即表示会员已经阅读并且同意与有缘婚恋达成协议，并接受所有的注册条款。&lt;/p&gt;&lt;h4 style=&quot;margin: 0px 0px 5px; padding: 0px; font-size: 15px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(51, 51, 51); list-style: none; outline: none; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;2、会员注册条件&lt;/h4&gt;&lt;p style=&quot;margin: 0px auto 10px; padding: 0px; font-size: 14px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(102, 102, 102); list-style: none; outline: none; width: auto; height: auto; text-indent: 2em; line-height: 22.4px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;1) 申请注册成为有缘网的会员应同时满足下列全部条件：在注册之日以及此后用有缘网交友服务期间必须以恋爱或者婚姻为目的；在注册之日以及此后使用有缘网交友服务期间必须是单身状态，包括未婚、离异或是丧偶；在注册之日必须年满18周岁以上。&lt;/p&gt;&lt;p style=&quot;margin: 0px auto 10px; padding: 0px; font-size: 14px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(102, 102, 102); list-style: none; outline: none; width: auto; height: auto; text-indent: 2em; line-height: 22.4px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;2) 为更好的享有有缘网提供的服务，会员应：向有缘网提供本人真实、正确、最新及完整的资料； 随时更新登记资料，保持其真实性及有效性； 提供真实有效的联系人手机号码； 征友过程中，务必保持征友帐号的唯一性。&lt;/p&gt;&lt;p style=&quot;margin: 0px auto 10px; padding: 0px; font-size: 14px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(102, 102, 102); list-style: none; outline: none; width: auto; height: auto; text-indent: 2em; line-height: 22.4px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;3) 若会员提供任何错误、不实或不完整的资料，或有缘网有理由怀疑资料为错误、不实或不完整及违反会员注册条款的，或有缘网有理由怀疑其会员资料、言行等有悖于“严肃纯净的婚恋交友”主题的，有缘网有权修改会员的注册昵称、独白等，或暂停或终止该会员的帐号，或暂停或终止提供有缘网提供的全部或部分服务。&lt;/p&gt;&lt;h4 style=&quot;margin: 0px 0px 5px; padding: 0px; font-size: 15px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(51, 51, 51); list-style: none; outline: none; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;3、会员账号名称安全&lt;/h4&gt;&lt;p style=&quot;margin: 0px auto 10px; padding: 0px; font-size: 14px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(102, 102, 102); list-style: none; outline: none; width: auto; height: auto; text-indent: 2em; line-height: 22.4px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;任何注册和使用的有缘网账号名称，不得有下列情形：&lt;/p&gt;&lt;p style=&quot;margin: 0px auto 10px; padding: 0px; font-size: 14px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(102, 102, 102); list-style: none; outline: none; width: auto; height: auto; text-indent: 2em; line-height: 22.4px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;（一）违反宪法或法律法规规定的；&lt;/p&gt;&lt;p style=&quot;margin: 0px auto 10px; padding: 0px; font-size: 14px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(102, 102, 102); list-style: none; outline: none; width: auto; height: auto; text-indent: 2em; line-height: 22.4px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;（二）危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的；&lt;/p&gt;&lt;p style=&quot;margin: 0px auto 10px; padding: 0px; font-size: 14px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(102, 102, 102); list-style: none; outline: none; width: auto; height: auto; text-indent: 2em; line-height: 22.4px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;（三）损害国家荣誉和利益的，损害公共利益的；&lt;/p&gt;&lt;p style=&quot;margin: 0px auto 10px; padding: 0px; font-size: 14px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(102, 102, 102); list-style: none; outline: none; width: auto; height: auto; text-indent: 2em; line-height: 22.4px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;（四）煽动民族仇恨、民族歧视，破坏民族团结的；&lt;/p&gt;&lt;p style=&quot;margin: 0px auto 10px; padding: 0px; font-size: 14px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(102, 102, 102); list-style: none; outline: none; width: auto; height: auto; text-indent: 2em; line-height: 22.4px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;（五）破坏国家宗教政策，宣扬邪教和封建迷信的；&lt;/p&gt;&lt;p style=&quot;margin: 0px auto 10px; padding: 0px; font-size: 14px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(102, 102, 102); list-style: none; outline: none; width: auto; height: auto; text-indent: 2em; line-height: 22.4px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;（六）散布谣言，扰乱社会秩序，破坏社会稳定的；&lt;/p&gt;&lt;p style=&quot;margin: 0px auto 10px; padding: 0px; font-size: 14px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(102, 102, 102); list-style: none; outline: none; width: auto; height: auto; text-indent: 2em; line-height: 22.4px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;（七）散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的；&lt;/p&gt;&lt;p style=&quot;margin: 0px auto 10px; padding: 0px; font-size: 14px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(102, 102, 102); list-style: none; outline: none; width: auto; height: auto; text-indent: 2em; line-height: 22.4px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;（八）侮辱或者诽谤他人，侵害他人合法权益的；&lt;/p&gt;&lt;p style=&quot;margin: 0px auto 10px; padding: 0px; font-size: 14px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(102, 102, 102); list-style: none; outline: none; width: auto; height: auto; text-indent: 2em; line-height: 22.4px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;（九）含有法律、行政法规禁止的其他内容的。&lt;/p&gt;&lt;p style=&quot;margin: 0px auto 10px; padding: 0px; font-size: 14px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(102, 102, 102); list-style: none; outline: none; width: auto; height: auto; text-indent: 2em; line-height: 22.4px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;会员以虚假信息骗取账号名称注册，或其账号头像、简介等注册信息存在违法和不良信息的，有缘网有权采取通知限期改正、暂停使用、注销登记等措施。&lt;/p&gt;&lt;p style=&quot;margin: 0px auto 10px; padding: 0px; font-size: 14px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(102, 102, 102); list-style: none; outline: none; width: auto; height: auto; text-indent: 2em; line-height: 22.4px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;对冒用关联机构或社会名人注册账号名称的会员，有缘网有权注销其账号。&lt;/p&gt;&lt;h4 style=&quot;margin: 0px 0px 5px; padding: 0px; font-size: 15px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(51, 51, 51); list-style: none; outline: none; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;4、服务说明&lt;/h4&gt;&lt;p style=&quot;margin: 0px auto 10px; padding: 0px; font-size: 14px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(102, 102, 102); list-style: none; outline: none; width: auto; height: auto; text-indent: 2em; line-height: 22.4px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;1) 有缘网在提供网络服务时，可能会对部分网络服务收取一定的费用，在此情况下，会在相关页面上做明确的提示。如会员拒绝支付该等费用，则不能使用相关的网络服务。付费业务将在本注册条款的基础上另行规定服务条款，以规范付费业务的内容和双方的权利义务，会员应认真阅读，如会员购买付费业务，则视为接受付费业务的服务条款。&lt;/p&gt;&lt;p style=&quot;margin: 0px auto 10px; padding: 0px; font-size: 14px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(102, 102, 102); list-style: none; outline: none; width: auto; height: auto; text-indent: 2em; line-height: 22.4px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;2) 无论是付费业务还是有缘网免费提供服务，上述服务均有有效期，有效期结束后服务将自动终止，且有效期不可中断或延期。除非本注册条款另有规定，所有付费业务均不退费。&lt;/p&gt;&lt;p style=&quot;margin: 0px auto 10px; padding: 0px; font-size: 14px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(102, 102, 102); list-style: none; outline: none; width: auto; height: auto; text-indent: 2em; line-height: 22.4px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;3) 对于利用有缘网服务进行非法活动，或其言行（无论线上或者线下的）背离有缘网严肃交友目的的，有缘网将严肃处理，包括将其列入黑名单、将其被投诉的情形公之于众、删除会员帐号等处罚措施。&lt;/p&gt;&lt;p style=&quot;margin: 0px auto 10px; padding: 0px; font-size: 14px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(102, 102, 102); list-style: none; outline: none; width: auto; height: auto; text-indent: 2em; line-height: 22.4px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;4) 有缘网有权向其会员发送广告信，或为组织线下活动等目的，向其会员发送电子邮件、短信或电话通知。由于手机网络的特殊性，有缘网有权获取会员的手机信息，如手机号码或会员的基站位置等。&lt;/p&gt;&lt;p style=&quot;margin: 0px auto 10px; padding: 0px; font-size: 14px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(102, 102, 102); list-style: none; outline: none; width: auto; height: auto; text-indent: 2em; line-height: 22.4px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;5) 为提高有缘网会员的交友的成功率和效率的目的，有缘网有权将有缘网会员的交友信息在有缘网的合作网站上进行展示或其他类似行为。&lt;/p&gt;&lt;p style=&quot;margin: 0px auto 10px; padding: 0px; font-size: 14px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(102, 102, 102); list-style: none; outline: none; width: auto; height: auto; text-indent: 2em; line-height: 22.4px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;6) 为了保障有缘网会员账户安全，如会员连续180日内未登录注册账户（会员购买有明确期限付费服务的有效期未满除外），则自第180天当天的24时起，有缘网有权对该账户进行冻结。会员重新启用账户应致电010-58103520公司客服，并通过相关验证。&lt;/p&gt;&lt;h4 style=&quot;margin: 0px 0px 5px; padding: 0px; font-size: 15px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(51, 51, 51); list-style: none; outline: none; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;5、免责条款&lt;/h4&gt;&lt;p style=&quot;margin: 0px auto 10px; padding: 0px; font-size: 14px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(102, 102, 102); list-style: none; outline: none; width: auto; height: auto; text-indent: 2em; line-height: 22.4px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;1) 有缘网不保证其提供的服务一定能满足会员的要求和期望，也不保证服务不会中断，对服务的及时性、安全性、准确性都不作保证。&lt;/p&gt;&lt;p style=&quot;margin: 0px auto 10px; padding: 0px; font-size: 14px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(102, 102, 102); list-style: none; outline: none; width: auto; height: auto; text-indent: 2em; line-height: 22.4px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;2) 对于会员通过有缘网提供的服务传送的内容，有缘网会尽合理努力按照国家有关规定严格审查，但无法完全控制经由网站服务传送的内容，不保证内容的正确性、完整性或品质。因此会员在使用有缘网服务时，可能会接触到令人不快、不适当或令人厌恶的内容。在任何情况下，有缘网均不为会员经由网站服务以张贴、发送电子邮件或其它方式传送的任何内容负责。但有缘网有权依法停止传输任何前述内容并采取相应行动，包括但不限于暂停会员使用网站服务的全部或部分，保存有关记录，并根据国家法律法规、相关政策在必要时向有关机关报告并配合有关机关的行动。&lt;/p&gt;&lt;p style=&quot;margin: 0px auto 10px; padding: 0px; font-size: 14px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(102, 102, 102); list-style: none; outline: none; width: auto; height: auto; text-indent: 2em; line-height: 22.4px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;3) 对于有缘网网站提供的各种广告信息、链接、资讯等，有缘网会广告内容进行初步审核，但是有缘网难以确保对方产品真实性、合法性或可靠性，由于产品购买导致的相关责任主要由广告商承担；敬告用户理性看待，如需购买或者交易，请谨慎考虑。并且，对于会员经由有缘网服务与广告商进行联系或商业往来，完全属于会员和广告商之间的行为，与有缘网无关。对于前述商业往来所产生的任何损害或损失，有缘网不承担任何责任。&lt;/p&gt;&lt;p style=&quot;margin: 0px auto 10px; padding: 0px; font-size: 14px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(102, 102, 102); list-style: none; outline: none; width: auto; height: auto; text-indent: 2em; line-height: 22.4px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;4) 对于用户上传的照片、资料、证件等，有缘网已采用相关措施并已尽合理努力进行审核，但不保证其内容的正确性、合法性或可靠性，相关责任由上传上述内容的会员负责。&lt;/p&gt;&lt;p style=&quot;margin: 0px auto 10px; padding: 0px; font-size: 14px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(102, 102, 102); list-style: none; outline: none; width: auto; height: auto; text-indent: 2em; line-height: 22.4px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;5) 会员以自己的独立判断从事与交友相关的行为，并独立承担可能产生的不利后果和责任，有缘网不承担任何法律责任。&lt;/p&gt;&lt;p style=&quot;margin: 0px auto 10px; padding: 0px; font-size: 14px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(102, 102, 102); list-style: none; outline: none; width: auto; height: auto; text-indent: 2em; line-height: 22.4px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;6)依据有关法律法规的规定或依据行政机关、司法机关、检察机关的要求，向其提供会员的基本信息或站内聊天信息，上述行为侵犯会员隐私权的，有缘网不承担任何法律责任。&lt;/p&gt;&lt;p style=&quot;margin: 0px auto 10px; padding: 0px; font-size: 14px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(102, 102, 102); list-style: none; outline: none; width: auto; height: auto; text-indent: 2em; line-height: 22.4px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;7) 有缘网作为交友平台，帮助用户寻找心仪伴侣是我们的服务内容。有缘网推出的有缘小助手、有缘红娘、收信宝等服务，全都是在用户同意并主动授权的情况下帮助授权用户寻找异性的功能性服务。有缘网不能保证用户通过此类服务授权由系统自动发出或接收到的信息完全满足用户交友需求。有缘小助手，为了提高用户处理私信的能力，看到更多符合自己要求的异性来信，提供了有缘小助手服务。在用户主动授权设置有缘小助手的情况下，有缘小助手会帮助用户过滤掉信箱中异性发来的招呼类信件，此类过滤掉的私信只是设为已读，仍然存于授权用户的信箱中。过滤的同时给符合授权用户征友要求的异性发送有缘网系统自动做出的信件回复。回复内容由有缘网根据用户交友互动中最常用的词语拟定，并由系统随机选取后发送。有缘红娘，为了帮助女用户找到符合自己要求的异性，提供了有缘红娘服务。有缘红娘服务内容包括：优先将红娘会员推荐给优质男性用户，获得更多交流机会；有缘红娘将帮助申请红娘服务的用户向符合其征友要求的异性询问交友意向；实时监控询问总数。收信宝，为了帮助男用户找到符合自己要求的异性，提供了收信宝服务。收信宝服务内容包括：优先将收信宝用户展示给女用户，通过替男用户打招呼的方式向符合男用户征友要求的女用户介绍男用户，从而增加男用户收信。 以上三种服务用户可以自行取消。&lt;/p&gt;&lt;p style=&quot;margin: 0px auto 10px; padding: 0px; font-size: 14px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(102, 102, 102); list-style: none; outline: none; width: auto; height: auto; text-indent: 2em; line-height: 22.4px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;8) 有缘网为了促进用户互动，产品上的组件应用或小游戏都带有触发招呼的功能。用户在玩此功能的组件或小游戏的同时会给符合自己征友要求的异性发去问候招呼。有缘网不能保证用户通过此类组件或小游戏发出或接受到的信息完全满足用户的交友需求。&lt;/p&gt;&lt;h4 style=&quot;margin: 0px 0px 5px; padding: 0px; font-size: 15px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(51, 51, 51); list-style: none; outline: none; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;6、会员应遵守以下法律法规：&lt;/h4&gt;&lt;p style=&quot;margin: 0px auto 10px; padding: 0px; font-size: 14px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(102, 102, 102); list-style: none; outline: none; width: auto; height: auto; text-indent: 2em; line-height: 22.4px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;1) 有缘网提醒会员在使用有缘网服务时，遵守《中华人民共和国合同法》、《中华人民共和国著作权法》、《全国人民代表大会常务委员会关于维护互联网安全的决定》、《中华人民共和国保守国家秘密法》、《中华人民共和国电信条例》、《中华人民共和国计算机信息系统安全保护条例》、《中华人民共和国计算机信息网络国际联网管理暂行规定》及其实施办法、《计算机信息系统国际联网保密管理规定》、《互联网信息服务管理办法》、《计算机信息网络国际联网安全保护管理办法》、《互联网电子公告服务管理规定》、《互联网用户账号名称管理规定》等相关中国法律法规的规定。&lt;/p&gt;&lt;p style=&quot;margin: 0px auto 10px; padding: 0px; font-size: 14px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(102, 102, 102); list-style: none; outline: none; width: auto; height: auto; text-indent: 2em; line-height: 22.4px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;2) 在任何情况下，如果有缘网有理由认为会员使用有缘网服务过程中的任何行为，包括但不限于会员的任何言论和其它行为违反或可能违反上述法律和法规的任何规定，有缘网可在任何时候不经任何事先通知终止向该会员提供服务。&lt;/p&gt;&lt;h4 style=&quot;margin: 0px 0px 5px; padding: 0px; font-size: 15px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(51, 51, 51); list-style: none; outline: none; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;7、禁止会员从事下列行为:&lt;/h4&gt;&lt;p style=&quot;margin: 0px auto 10px; padding: 0px; font-size: 14px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(102, 102, 102); list-style: none; outline: none; width: auto; height: auto; text-indent: 2em; line-height: 22.4px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;1)发布信息或者利用有缘网的服务时在有缘网的网页上或者利用有缘网的服务制作、复制、发布、传播以下信息：反对宪法所确定的基本原则的；危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的；损害国家荣誉和利益的；煽动民族仇恨、民族歧视、破坏民族团结的；破坏国家宗教政策，宣扬邪教和封建迷信的；散布谣言，扰乱社会秩序，破坏社会稳定的；散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的；侮辱或者诽谤他人，侵害他人合法权利的；含有虚假、有害、胁迫、侵害他人隐私、骚扰、侵害、中伤、粗俗、猥亵、或其它有悖道德、令人反感的内容；含有中国法律、法规、规章、条例以及任何具有法律效力的规范所限制或禁止的其它内容的。&lt;/p&gt;&lt;p style=&quot;margin: 0px auto 10px; padding: 0px; font-size: 14px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(102, 102, 102); list-style: none; outline: none; width: auto; height: auto; text-indent: 2em; line-height: 22.4px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;2) 使用有缘网服务的过程中，以任何方式危害未成年人的利益的。&lt;/p&gt;&lt;p style=&quot;margin: 0px auto 10px; padding: 0px; font-size: 14px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(102, 102, 102); list-style: none; outline: none; width: auto; height: auto; text-indent: 2em; line-height: 22.4px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;3) 冒充任何人或机构，包含但不限于冒充有缘网工作人员、版主、主持人，或以虚伪不实的方式陈述或谎称与任何人或机构有关的。&lt;/p&gt;&lt;p style=&quot;margin: 0px auto 10px; padding: 0px; font-size: 14px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(102, 102, 102); list-style: none; outline: none; width: auto; height: auto; text-indent: 2em; line-height: 22.4px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;4) 将侵犯任何人的肖像权、名誉权、隐私权、专利权、商标权、著作权、商业秘密或其它专属权利的内容上载、张贴、发送电子邮件或以其它方式传送的。&lt;/p&gt;&lt;p style=&quot;margin: 0px auto 10px; padding: 0px; font-size: 14px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(102, 102, 102); list-style: none; outline: none; width: auto; height: auto; text-indent: 2em; line-height: 22.4px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;5) 将病毒或其它计算机代码、档案和程序，加以上载、张贴、发送电子邮件或以其它方式传送的。&lt;/p&gt;&lt;p style=&quot;margin: 0px auto 10px; padding: 0px; font-size: 14px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(102, 102, 102); list-style: none; outline: none; width: auto; height: auto; text-indent: 2em; line-height: 22.4px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;6) 跟踪或以其它方式骚扰其他会员的。&lt;/p&gt;&lt;p style=&quot;margin: 0px auto 10px; padding: 0px; font-size: 14px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(102, 102, 102); list-style: none; outline: none; width: auto; height: auto; text-indent: 2em; line-height: 22.4px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;7) 未经合法授权而截获、篡改、收集、储存或删除他人个人信息、电子邮件或其它数据资料，或将获知的此类资料用于任何非法或不正当目的。&lt;/p&gt;&lt;p style=&quot;margin: 0px auto 10px; padding: 0px; font-size: 14px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(102, 102, 102); list-style: none; outline: none; width: auto; height: auto; text-indent: 2em; line-height: 22.4px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;8) 以任何方式干扰有缘网服务的。&lt;/p&gt;&lt;h4 style=&quot;margin: 0px 0px 5px; padding: 0px; font-size: 15px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(51, 51, 51); list-style: none; outline: none; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;8、关于会员在有缘婚恋的上传或张贴的内容&lt;/h4&gt;&lt;p style=&quot;margin: 0px auto 10px; padding: 0px; font-size: 14px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(102, 102, 102); list-style: none; outline: none; width: auto; height: auto; text-indent: 2em; line-height: 22.4px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;1) 会员在有缘网上传或张贴的内容（包括照片、文字、交友成功会员的成功故事等），视为会员授予有缘网免费、非独家的使用权，有缘网有权为展示、传播及推广前述张贴内容的目的，对上述内容进行复制、修改、出版等。该使用权持续至会员书面通知有缘网不得继续使用，且有缘网实际收到该等书面通知时止。有缘网合作伙伴使用或在现场活动中使用，有缘网将事先征得会员的同意，但在有缘网内使用不受此限。&lt;/p&gt;&lt;p style=&quot;margin: 0px auto 10px; padding: 0px; font-size: 14px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(102, 102, 102); list-style: none; outline: none; width: auto; height: auto; text-indent: 2em; line-height: 22.4px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;2) 因会员进行上述上传或张贴，而导致任何第三方提出侵权或索赔要求的，会员承担全部责任。&lt;/p&gt;&lt;p style=&quot;margin: 0px auto 10px; padding: 0px; font-size: 14px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(102, 102, 102); list-style: none; outline: none; width: auto; height: auto; text-indent: 2em; line-height: 22.4px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;3) 任何第三方对于会员在有缘网的公开使用区域张贴的内容进行复制、修改、编辑、传播等行为的，该行为产生的法律后果和责任均由行为人承担，与有缘网无关。&lt;/p&gt;&lt;h4 style=&quot;margin: 0px 0px 5px; padding: 0px; font-size: 15px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(51, 51, 51); list-style: none; outline: none; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;9、会员注册条款的变更和修改&lt;/h4&gt;&lt;p style=&quot;margin: 0px auto 10px; padding: 0px; font-size: 14px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(102, 102, 102); list-style: none; outline: none; width: auto; height: auto; text-indent: 2em; line-height: 22.4px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;有缘网有权随时对本注册条款进行变更和修改。一旦发生注册条款的变动，有缘网将在页面上提示修改的内容，或将最新版本的会员注册条款以邮件的形式发送给会员。会员如果不同意会员注册条款的修改，可以主动取消会员资格（如注销账号），如对部分服务支付了额外的费用，可以申请将费用全额或部分退回。如果会员继续使用会员帐号，则视为会员已经接受会员注册条款的修改。&lt;/p&gt;&lt;h4 style=&quot;margin: 0px 0px 5px; padding: 0px; font-size: 15px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(51, 51, 51); list-style: none; outline: none; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;10、北京友缘在线网络科技股份有限公司对有缘网网站及相关软件有唯一的升级修改权限，并有权终止一部分版本的使用。请及时升级最新版本。&lt;/h4&gt;&lt;p class=&quot;ta-r&quot; style=&quot;margin: 0px auto 10px; padding: 0px; font-size: 14px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(102, 102, 102); list-style: none; outline: none; width: auto; height: auto; text-align: right; text-indent: 2em; line-height: 22.4px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;幸福在线&lt;/p&gt;&lt;p class=&quot;ta-r&quot; style=&quot;margin: 0px auto 10px; padding: 0px; font-size: 14px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(102, 102, 102); list-style: none; outline: none; width: auto; height: auto; text-align: right; text-indent: 2em; line-height: 22.4px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;幸福在线网络科技股份有限公司&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(0, 170, 187); font-family: 宋体; font-size: 12px; font-weight: bold; line-height: 42px; text-align: center; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;br/&gt;&lt;/p&gt;');
INSERT INTO `help_info` VALUES ('22', '测试', '&lt;p&gt;测试&lt;/p&gt;');
INSERT INTO `help_info` VALUES ('23', '免责申明', '&lt;p&gt;，城下 ; fghghl fghfgh fghdfg fgh hfghhhhhhhhhhhdfgh&lt;span style=&quot;font-size: 24px;&quot;&gt;&lt;span style=&quot;font-size: 36px;&quot;&gt;fghhhhhhhhh&lt;/span&gt;hhhhhhhh&lt;/span&gt;hhhhhhhhhhhhdfgh sfdjglksd fgjsdfl ldfjgsdfgdfg hskdjfg kdsfjgj&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(255, 0, 0);&quot;&gt;sdfg jldfkjg lsdjfg lsdfjglkdjfgkjsdlkfjg&amp;nbsp;&lt;span style=&quot;color: rgb(255, 0, 0); font-size: 20px;&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;');

-- ----------------------------
-- Table structure for img
-- ----------------------------
DROP TABLE IF EXISTS `img`;
CREATE TABLE `img` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `message_id` int(10) unsigned DEFAULT NULL COMMENT '说说id',
  `guanggao_id` int(11) DEFAULT NULL,
  `love_id` int(11) unsigned DEFAULT NULL COMMENT '爱情故事id',
  `uid` int(11) unsigned DEFAULT NULL,
  `img` varchar(100) DEFAULT NULL,
  `time` varchar(30) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0' COMMENT '0未审核1已审核',
  `make` varchar(50) DEFAULT NULL COMMENT '1头像(也可以是普通图片)2表示爱情宝典图片3说说图片',
  PRIMARY KEY (`id`),
  KEY `index` (`uid`),
  KEY `indexs` (`message_id`,`love_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=562 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of img
-- ----------------------------
INSERT INTO `img` VALUES ('35', null, null, null, '22', '/Uploads/22/48ab1790ef625726b3b2ee7dcbf9d251.jpg', '1456921987', '1', '1');
INSERT INTO `img` VALUES ('217', null, null, '22', '17', '/Uploads/images/2016-03-15/56e782c2891bd.jpg', '1458012866', '0', '2');
INSERT INTO `img` VALUES ('37', null, null, null, '22', '/Uploads/22/d6562a55dc9e0502aadb7ac38ef71d0e.jpg', '1456921988', '0', '1');
INSERT INTO `img` VALUES ('38', null, null, null, '22', '/Uploads/22/8fa0d46f6edc61a64889acd8d5d1a93d.png', '1456921988', '1', '1');
INSERT INTO `img` VALUES ('214', null, null, null, '27', '/Uploads/27/0552a74ba1f198145b70191907f57b54.jpg', '1457945526', '0', '1');
INSERT INTO `img` VALUES ('40', null, null, null, '22', '/Uploads/22/f1d33815fef6e6f2eae3a478b880f702.jpg', '1456921989', '0', '1');
INSERT INTO `img` VALUES ('41', null, null, null, '22', '/Uploads/22/e6abe9bd8f7d94aab5b043686fea442d.png', '1456921989', '1', '1');
INSERT INTO `img` VALUES ('42', null, null, null, '22', '/Uploads/22/03654b307e683bab40814fb119c76ff1.jpg', '1456921990', '1', '1');
INSERT INTO `img` VALUES ('43', null, null, null, '22', '/Uploads/22/e02e143602a331265752bed40b427a7c.jpg', '1456921990', '1', '1');
INSERT INTO `img` VALUES ('44', null, null, null, '22', '/Uploads/22/4348c4b87c99cd7e09327ad20d760bb8.jpg', '1456923510', '1', '1');
INSERT INTO `img` VALUES ('236', null, null, null, '31', '/Uploads/31/d4ee4de57e1ef939005ecfbd389e9f77.jpg', '1458199157', '1', '1');
INSERT INTO `img` VALUES ('237', null, null, null, '31', '/Uploads/31/687f47c325fa3f49ae54e80fcb9ef180.jpeg', '1458199168', '0', '1');
INSERT INTO `img` VALUES ('298', null, null, null, '21', '/Uploads/message/2016-03-21/56ef8e1e1ab3f.jpg', '1458540062', '1', '3');
INSERT INTO `img` VALUES ('241', '38', null, null, '31', '/Uploads/message/2016-03-17/56ea77fae8bda.jpg', '1458206714', '0', '3');
INSERT INTO `img` VALUES ('306', null, null, null, '44', '/Uploads/44/58e30aff7df11328c4d436c58a993f1b.jpg', '1458610667', '1', '1');
INSERT INTO `img` VALUES ('243', null, null, null, '17', '/Uploads/17/a599a5c174b1a30c2f1f67825770783d.jpg', '1458269743', '0', '1');
INSERT INTO `img` VALUES ('244', null, null, null, null, '/Uploads/guanggao2016-03-18/56eb9a62a5393.jpg', null, '0', null);
INSERT INTO `img` VALUES ('245', null, null, null, null, '/Uploads/guanggao2016-03-18/56eb9a760a0a3.jpg', null, '0', null);
INSERT INTO `img` VALUES ('216', null, null, '22', '17', '/Uploads/images/2016-03-15/56e782c227a20.jpg', '1458012866', '0', '2');
INSERT INTO `img` VALUES ('233', null, null, null, '28', '/Uploads/28/ac8cc66088bc47ff2ebf6639412225c0.jpg', '1458198713', '1', '1');
INSERT INTO `img` VALUES ('58', null, null, null, '22', '/Uploads/22/fad57cdf217f4f6cf747155f9bc89a19.jpg', '1456923894', '1', '1');
INSERT INTO `img` VALUES ('59', null, null, null, '22', '/Uploads/22/fb0ab7b8c5652388219b34e059c99a50.jpg', '1456923894', '1', '1');
INSERT INTO `img` VALUES ('60', null, null, null, '22', '/Uploads/22/59834f1449c7b1e3e6a73cf752732e45.png', '1456923895', '0', '1');
INSERT INTO `img` VALUES ('61', null, null, null, '22', '/Uploads/22/da443d4979c10b88b8c8531a5fd1d9d0.png', '1456923895', '0', '1');
INSERT INTO `img` VALUES ('62', null, null, null, '22', '/Uploads/22/2871628562cf566cd279242df6bf698b.png', '1456923895', '0', '1');
INSERT INTO `img` VALUES ('63', null, null, null, '22', '/Uploads/22/b0da8e009a3b28d0bd78dd7ba3ab9a61.png', '1456923896', '0', '1');
INSERT INTO `img` VALUES ('64', null, null, null, '22', '/Uploads/22/70afe78716a3326fde31125ecec5dbb4.png', '1456923896', '0', '1');
INSERT INTO `img` VALUES ('65', null, null, null, '22', '/Uploads/22/52d577ae53d4d0b19cdbd2104fa227ec.png', '1456923897', '0', '1');
INSERT INTO `img` VALUES ('66', null, null, null, '22', '/Uploads/22/cc51292c4e484936d29176ba19823120.jpg', '1456926470', '0', '1');
INSERT INTO `img` VALUES ('67', null, null, null, '22', '/Uploads/22/e0b1d532567d1238fcac1854f6d18db0.png', '1456926496', '0', '1');
INSERT INTO `img` VALUES ('68', null, null, null, '22', '/Uploads/22/ad9f551a2f3cfcc1a45b07af034ed31a.jpg', '1456926519', '0', '1');
INSERT INTO `img` VALUES ('74', null, null, null, '22', '/Uploads/22/474f0f2410bd93406764e3316a694660.png', '1456969734', '0', '1');
INSERT INTO `img` VALUES ('75', null, null, null, '22', '/Uploads/22/19b8c1a04ec046c06b7ddad4b68354b5.jpg', '1456973670', '0', '1');
INSERT INTO `img` VALUES ('296', null, null, null, '1', '/Uploads/message/2016-03-21/56ef8d5d76f88.jpg', '1458539869', '0', '3');
INSERT INTO `img` VALUES ('118', null, null, '19', '21', '/Uploads/images/2016-03-03/56d81a3a288aa.jpg', '1457003066', '1', '2');
INSERT INTO `img` VALUES ('119', null, null, '19', '21', '/Uploads/images/2016-03-03/56d81a3a87963.jpg', '1457003066', '1', '2');
INSERT INTO `img` VALUES ('120', null, null, '20', '21', '/Uploads/images/2016-03-03/56d81b33b9693.jpg', '1457003315', '1', '2');
INSERT INTO `img` VALUES ('121', null, null, '20', '21', '/Uploads/images/2016-03-03/56d81b3424f48.jpg', '1457003316', '1', '2');
INSERT INTO `img` VALUES ('223', null, null, null, '28', '/Uploads/28/776f23ff6c74611d31d73b8b05e12c8f.jpg', '1458092311', '0', '1');
INSERT INTO `img` VALUES ('123', null, null, '20', '21', '/Uploads/images/2016-03-03/56d81b34de5ef.jpg', '1457003316', '1', '2');
INSERT INTO `img` VALUES ('124', null, null, '20', '21', '/Uploads/images/2016-03-03/56d81b355845a.jpg', '1457003317', '1', '2');
INSERT INTO `img` VALUES ('297', null, null, null, '1', '/Uploads/message/2016-03-21/56ef8d64b532b.jpg', '1458539876', '0', '3');
INSERT INTO `img` VALUES ('215', null, null, '22', '17', '/Uploads/images/2016-03-15/56e782c1bb801.png', '1458012865', '0', '2');
INSERT INTO `img` VALUES ('148', '13', null, null, '21', '/Uploads/message/2016-03-04/56d955c711479.jpg', '1457083847', '1', '3');
INSERT INTO `img` VALUES ('149', '13', null, null, '21', '/Uploads/message/2016-03-04/56d955ca7810b.jpg', '1457083850', '1', '3');
INSERT INTO `img` VALUES ('150', '13', null, null, '21', '/Uploads/message/2016-03-04/56d9569d493b5.jpg', '1457084061', '1', '3');
INSERT INTO `img` VALUES ('532', null, null, '43', '98', '/Uploads/images/2016-04-14/570f13f42b566.jpg', '1460605940', '0', '2');
INSERT INTO `img` VALUES ('531', null, null, null, '98', '/Uploads/98/6b04a73e95c8b5d465d1c689c5b37d70.png', '1460601850', '1', '1');
INSERT INTO `img` VALUES ('213', '27', null, null, '18', '/Uploads/message/2016-03-14/56e664f17ee49.png', '1457939697', '0', '3');
INSERT INTO `img` VALUES ('212', '27', null, null, '18', '/Uploads/message/2016-03-14/56e664f0e75e2.png', '1457939696', '0', '3');
INSERT INTO `img` VALUES ('211', null, null, null, '18', '/Uploads/message/2016-03-14/56e664ef10ca6.jpeg', '1457939695', '0', '3');
INSERT INTO `img` VALUES ('157', null, null, null, '18', './Uploads/18/eb9bfff01a6dfd7d88ac326312bc5015.jpg', '1457153588', '0', '1');
INSERT INTO `img` VALUES ('158', null, null, null, '18', './Uploads/18/3451094fabd498af8801885f7f8ba31f.jpg', '1457153588', '0', '1');
INSERT INTO `img` VALUES ('159', null, null, null, '18', './Uploads/18/804d2b40646a7c6f2adb7f133df3a55a.png', '1457153589', '0', '1');
INSERT INTO `img` VALUES ('160', '16', null, null, '22', '/Uploads/message/2016-03-05/56da8181f3740.jpg', '1457160578', '0', '3');
INSERT INTO `img` VALUES ('161', '16', null, null, '22', '/Uploads/message/2016-03-05/56da81824911b.jpg', '1457160578', '0', '3');
INSERT INTO `img` VALUES ('162', null, null, '21', '22', '/Uploads/images/2016-03-05/56dae0b0d6f58.png', '1457184944', '1', '2');
INSERT INTO `img` VALUES ('163', null, null, '21', '22', '/Uploads/images/2016-03-05/56dae0b12e8a3.jpg', '1457184945', '1', '2');
INSERT INTO `img` VALUES ('164', null, null, '21', '22', '/Uploads/images/2016-03-05/56dae0b174b88.jpg', '1457184945', '1', '2');
INSERT INTO `img` VALUES ('165', null, null, null, '22', './Uploads/22/e8c57f94518dfa537dc78468d8bcb36f.jpg', '1457225414', '0', '1');
INSERT INTO `img` VALUES ('166', null, null, null, '22', './Uploads/22/1ad09b7aa9d8dd1467c1f7db22d9e50f.jpg', '1457225415', '0', '1');
INSERT INTO `img` VALUES ('167', null, null, null, '22', './Uploads/22/3fb270d90d33cbf957d53c83fd3b60c9.jpg', '1457225415', '0', '1');
INSERT INTO `img` VALUES ('168', null, null, null, '22', './Uploads/22/fe16e6e319500052fdfd9498ae9c1266.jpg', '1457225415', '0', '1');
INSERT INTO `img` VALUES ('169', null, null, null, '22', './Uploads/22/755680927e0660754205911b3757e192.jpg', '1457225416', '0', '1');
INSERT INTO `img` VALUES ('170', null, null, null, '22', './Uploads/22/8c58b8681049ef27bc943fd42c3beafb.jpg', '1457225416', '0', '1');
INSERT INTO `img` VALUES ('171', null, null, null, '22', './Uploads/22/aae0053e83d1269db06c225dd61fe386.jpeg', '1457225416', '0', '1');
INSERT INTO `img` VALUES ('172', null, null, null, '22', './Uploads/22/54f99266b089f34bb9c2701120736ded.png', '1457225417', '0', '1');
INSERT INTO `img` VALUES ('173', null, null, null, '22', './Uploads/22/1f883b57b30881069a40ef725ecdadd9.png', '1457225420', '0', '1');
INSERT INTO `img` VALUES ('174', '17', null, null, '22', '/Uploads/message/2016-03-07/56dcf107d0793.jpg', '1457320199', '1', '3');
INSERT INTO `img` VALUES ('175', null, null, null, '24', '/Uploads/24/5894cdd3091bd425642b4cea251e6f6d.png', '1457338201', '0', '1');
INSERT INTO `img` VALUES ('176', null, null, null, '24', '/Uploads/24/cdb5592c60c79904356c4eca07f6c44f.jpg', '1457338529', '0', '1');
INSERT INTO `img` VALUES ('177', null, null, null, '26', '/Uploads/26/934636de0686b91b30fefb14f4b9bd98.png', '1457434848', '0', '1');
INSERT INTO `img` VALUES ('178', null, null, null, '26', '/Uploads/26/36c41ec0c9e6f5569c7d336d19797a17.jpg', '1457434849', '0', '1');
INSERT INTO `img` VALUES ('179', null, null, null, '26', '/Uploads/26/abbfc938c0c32aeb57444114e15a9938.jpg', '1457434986', '0', '1');
INSERT INTO `img` VALUES ('240', '36', null, null, '31', '/Uploads/message/2016-03-17/56ea71010cbde.jpg', '1458204929', '0', '3');
INSERT INTO `img` VALUES ('200', null, null, null, '18', '/Uploads/message/2016-03-12/56e3e31adca44.png', '1457775386', '0', '3');
INSERT INTO `img` VALUES ('198', null, null, null, '17', '/Uploads/17/d41d03166d30d85cb800261b7e8817d9.jpg', '1457614685', '0', '1');
INSERT INTO `img` VALUES ('184', '24', null, null, '17', '/Uploads/message/2016-03-09/56dfced62f1dd.png', '1457508054', '0', '3');
INSERT INTO `img` VALUES ('187', null, null, null, '17', '/Uploads/17/968b9522275b0e4a821f45b729e2cbf5.jpg', '1457511021', '1', '1');
INSERT INTO `img` VALUES ('188', null, null, null, '17', '/Uploads/17/1b7c04c1ed551e306cb85b2f9d3e982b.jpg', '1457511022', '1', '1');
INSERT INTO `img` VALUES ('201', null, null, null, '18', '/Uploads/message/2016-03-12/56e3e31b4d272.png', '1457775387', '0', '3');
INSERT INTO `img` VALUES ('190', null, null, null, '17', '/Uploads/17/138b2491a95566fdc546cdd7a5c640e9.jpg', '1457511022', '1', '1');
INSERT INTO `img` VALUES ('525', '121', null, null, '38', '/Uploads/message/2016-04-13/570e005321622.jpg', '1460535379', '0', '3');
INSERT INTO `img` VALUES ('533', null, null, '43', '98', '/Uploads/images/2016-04-14/570f13f5355e4.jpg', '1460605941', '0', '2');
INSERT INTO `img` VALUES ('534', null, null, '43', '98', '/Uploads/images/2016-04-14/570f140798cea.jpg', '1460605959', '0', '2');
INSERT INTO `img` VALUES ('195', null, null, null, '17', './Uploads/17/9bcddddffae4c2156dd4380e729999f2.jpg', '1457606735', '0', '1');
INSERT INTO `img` VALUES ('196', null, null, null, '17', './Uploads/17/28de4a0d72831786db79d6fd1b47fe71.jpeg', '1457606736', '0', '1');
INSERT INTO `img` VALUES ('228', null, null, '23', '31', '/Uploads/images/2016-03-17/56ea12f83425f.jpeg', '1458180856', '1', '2');
INSERT INTO `img` VALUES ('202', null, null, null, '18', '/Uploads/message/2016-03-12/56e3e3501b069.jpg', '1457775440', '0', '3');
INSERT INTO `img` VALUES ('203', null, null, null, '18', '/Uploads/message/2016-03-12/56e3e350847bc.jpeg', '1457775440', '0', '3');
INSERT INTO `img` VALUES ('204', null, null, null, '18', './Uploads/18/3046f5ea011b169b5ede6988601a4ab3.jpg', '1457775551', '0', '1');
INSERT INTO `img` VALUES ('205', null, null, null, '18', './Uploads/18/ac1f5a296af8368dd45b82efd98ea6c6.jpg', '1457775551', '0', '1');
INSERT INTO `img` VALUES ('206', null, null, null, '18', './Uploads/18/b0eb46148b4563e49810f8141ac3a248.jpeg', '1457775552', '0', '1');
INSERT INTO `img` VALUES ('207', null, null, null, '18', './Uploads/18/e9bb9e4196f6d26a340fdb17260f104b.png', '1457775552', '0', '1');
INSERT INTO `img` VALUES ('208', null, null, null, '18', './Uploads/18/2fdd87a7976b3d14b0a6161bec8c08de.png', '1457775552', '0', '1');
INSERT INTO `img` VALUES ('210', null, null, null, '18', './Uploads/18/2c0639b3fc07fc94342e75ec97ced9e4.png', '1457789372', '0', '1');
INSERT INTO `img` VALUES ('218', null, null, '22', '17', '/Uploads/images/2016-03-15/56e782c2e3039.jpg', '1458012866', '1', '2');
INSERT INTO `img` VALUES ('219', null, null, null, '29', './Uploads/29/30e7197bb2b3a791335f313a1d18c09a.jpg', '1458032470', '0', '1');
INSERT INTO `img` VALUES ('220', null, null, null, '29', './Uploads/29/fcdf44702c0e47706d71371ac1410cbd.jpg', '1458032682', '0', '1');
INSERT INTO `img` VALUES ('221', null, null, null, '29', './Uploads/29/a352f08145d298fd9d40f14dd1cd1492.jpg', '1458032747', '0', '1');
INSERT INTO `img` VALUES ('222', null, null, null, '29', './Uploads/29/827859eaae4c6208488fd4d290adcd4c.jpg', '1458040482', '0', '1');
INSERT INTO `img` VALUES ('224', null, null, null, '31', './Uploads/31/f00a88f2589c49647655e964d42c6fa9.jpg', '1458094340', '1', '1');
INSERT INTO `img` VALUES ('234', null, null, null, '31', '/Uploads/31/574cd5bc9a28da5feafa6568c570d673.jpg', '1458199126', '1', '1');
INSERT INTO `img` VALUES ('227', null, null, null, '18', '/Uploads/18/c1e98b248386b37cacaf6722b058bf49.jpg', '1458180868', '0', '1');
INSERT INTO `img` VALUES ('229', null, null, null, '17', '/Uploads/17/6e02c56e8b41bf913c62e2cd85b6d1a3.jpg', '1458181061', '0', '1');
INSERT INTO `img` VALUES ('279', null, null, null, '37', '/Uploads/37/08c4844587f60b09a44314d89567ce1c.jpg', '1458289649', '1', '1');
INSERT INTO `img` VALUES ('452', null, '16', null, null, '/Uploads/guanggao/2016-04-09/57086234a7bfb.jpg', null, '0', '4');
INSERT INTO `img` VALUES ('275', null, null, null, '38', '/Uploads/38/91bdcb17ebcd1f99e1da46b07efa0d0e.jpg', '1458289218', '1', '1');
INSERT INTO `img` VALUES ('501', '107', null, null, '38', '/Uploads/message/2016-04-13/570dc0fe5d4e6.jpg', '1460519166', '1', '3');
INSERT INTO `img` VALUES ('500', '106', null, null, '38', '/Uploads/message/2016-04-13/570dc0cc9d4de.jpg', '1460519116', '1', '3');
INSERT INTO `img` VALUES ('278', null, null, null, '37', '/Uploads/37/bf6deb2622be7cd3b918e2c3ff1cab01.jpg', '1458289639', '1', '1');
INSERT INTO `img` VALUES ('451', null, '16', null, null, '/Uploads/guanggao/2016-04-09/57086224919ee.jpg', null, '0', '4');
INSERT INTO `img` VALUES ('294', null, null, null, '18', '/Uploads/18/c11ccbdb0120f7afb48bf30ee404367f.jpg', '1458391663', '1', '1');
INSERT INTO `img` VALUES ('312', null, '18', null, null, '/Uploads/guanggao/2016-03-22/56f0f14eae85b.jpg', null, '0', '4');
INSERT INTO `img` VALUES ('292', null, '18', null, null, '/Uploads/guanggao/2016-03-18/56ebcd93eb16b.jpg', null, '0', '4');
INSERT INTO `img` VALUES ('502', '108', null, null, '38', '/Uploads/message/2016-04-13/570dc10c35508.jpg', '1460519180', '1', '3');
INSERT INTO `img` VALUES ('465', '103', null, null, '37', '/Uploads/message/2016-04-11/570b4c4853d34.jpg', '1460358216', '1', '3');
INSERT INTO `img` VALUES ('295', null, null, null, '42', '/Uploads/42/0d25d6a783ded4804efe4271b15b08f7.jpg', '1458527689', '1', '1');
INSERT INTO `img` VALUES ('313', null, '18', null, null, '/Uploads/guanggao/2016-03-22/56f0f14eb47b9.jpg', null, '0', '4');
INSERT INTO `img` VALUES ('305', null, null, null, '37', '/Uploads/message/2016-03-21/56efbe7801b6e.jpg', '1458552440', '0', '3');
INSERT INTO `img` VALUES ('530', null, null, null, '97', '/Uploads/97/1685595d3d3a3a3dff0a4ae13960c84c.jpg', '1460601181', '1', '1');
INSERT INTO `img` VALUES ('517', '117', null, null, '38', '/Uploads/message/2016-04-13/570de0d7aeec1.jpg', '1460527319', '1', '3');
INSERT INTO `img` VALUES ('308', null, null, '26', '37', '/Uploads/images/2016-03-22/56f0b508a63cc.jpg', '1458615560', '0', '2');
INSERT INTO `img` VALUES ('309', null, null, '27', '38', '/Uploads/images/2016-03-22/56f0bff02fd37.jpg', '1458618352', '1', '2');
INSERT INTO `img` VALUES ('314', '49', null, null, '37', '/Uploads/message/2016-03-22/56f1021d10683.jpg', '1458635293', '0', '3');
INSERT INTO `img` VALUES ('529', '122', null, null, '95', '/Uploads/message/2016-04-14/570ef45f22ae6.jpg', '1460597855', '1', '3');
INSERT INTO `img` VALUES ('528', null, null, null, '95', '/Uploads/95/1cc3433e2cb0be05c06f335fda2c64fd.png', '1460540730', '1', '1');
INSERT INTO `img` VALUES ('318', '53', null, null, '37', '/Uploads/message/2016-03-23/56f2343b27073.jpg', '1458713659', '1', '3');
INSERT INTO `img` VALUES ('319', '53', null, null, '37', '/Uploads/message/2016-03-23/56f2343d84b25.jpg', '1458713661', '1', '3');
INSERT INTO `img` VALUES ('518', '117', null, null, '38', '/Uploads/message/2016-04-13/570de0d93dddc.png', '1460527321', '1', '3');
INSERT INTO `img` VALUES ('519', '117', null, null, '38', '/Uploads/message/2016-04-13/570de0da5d098.png', '1460527322', '1', '3');
INSERT INTO `img` VALUES ('520', '117', null, null, '38', '/Uploads/message/2016-04-13/570de0db98870.png', '1460527323', '1', '3');
INSERT INTO `img` VALUES ('324', null, null, null, '44', '/Uploads/44/ab46fa7ee5f612c6b3a41b3ac3608cb4.jpeg', '1458726182', '0', '1');
INSERT INTO `img` VALUES ('325', null, null, null, '54', '/Uploads/54/975dadf8e87fd6c9c7b32d3c5cce4513.jpg', '1458791919', '0', '1');
INSERT INTO `img` VALUES ('326', null, null, null, '54', '/Uploads/54/418db079041a5c0f08871267f38fc906.jpg', '1458791920', '1', '1');
INSERT INTO `img` VALUES ('327', null, null, null, '44', '/Uploads/message/2016-03-24/56f38ed2ec899.jpg', '1458802386', '0', '3');
INSERT INTO `img` VALUES ('328', '57', null, null, '37', '/Uploads/message/2016-03-24/56f399084c636.jpg', '1458805000', '1', '3');
INSERT INTO `img` VALUES ('329', '56', null, null, '44', '/Uploads/message/2016-03-24/56f39c82959d7.jpg', '1458805890', '0', '3');
INSERT INTO `img` VALUES ('330', '58', null, null, '44', '/Uploads/message/2016-03-24/56f39eabf2fc8.jpg', '1458806443', '0', '3');
INSERT INTO `img` VALUES ('331', '59', null, null, '38', '/Uploads/message/2016-03-24/56f39eeb2181b.jpg', '1458806507', '1', '3');
INSERT INTO `img` VALUES ('332', '60', null, null, '38', '/Uploads/message/2016-03-24/56f3a590d251d.jpg', '1458808208', '0', '3');
INSERT INTO `img` VALUES ('333', '60', null, null, '38', '/Uploads/message/2016-03-24/56f3a59674bda.jpg', '1458808214', '0', '3');
INSERT INTO `img` VALUES ('334', '60', null, null, '38', '/Uploads/message/2016-03-24/56f3a6838a6af.jpg', '1458808451', '0', '3');
INSERT INTO `img` VALUES ('335', '61', null, null, '38', '/Uploads/message/2016-03-24/56f3a686b9e56.jpg', '1458808454', '0', '3');
INSERT INTO `img` VALUES ('336', '61', null, null, '38', '/Uploads/message/2016-03-24/56f3a68d0c06c.jpg', '1458808461', '0', '3');
INSERT INTO `img` VALUES ('339', null, null, null, '44', '/Uploads/message/2016-03-29/56f9f1282d9ae.jpg', '1459220776', '0', '3');
INSERT INTO `img` VALUES ('338', null, '20', null, null, '/Uploads/guanggao/2016-03-24/56f39e47c5691.jpg', '', '0', '4');
INSERT INTO `img` VALUES ('527', '121', null, null, '38', '/Uploads/message/2016-04-13/570e0053b3b76.png', '1460535379', '0', '3');
INSERT INTO `img` VALUES ('526', '121', null, null, '38', '/Uploads/message/2016-04-13/570e005367393.jpg', '1460535379', '0', '3');
INSERT INTO `img` VALUES ('524', '121', null, null, '38', '/Uploads/message/2016-04-13/570e0052c690c.png', '1460535378', '0', '3');
INSERT INTO `img` VALUES ('523', '121', null, null, '38', '/Uploads/message/2016-04-13/570e005270c70.jpg', '1460535378', '0', '3');
INSERT INTO `img` VALUES ('522', '121', null, null, '38', '/Uploads/message/2016-04-13/570e00522584e.png', '1460535378', '0', '3');
INSERT INTO `img` VALUES ('345', '68', null, null, '37', '/Uploads/message/2016-03-30/56fb7a1ee5e56.jpg', '1459321375', '0', '3');
INSERT INTO `img` VALUES ('346', '68', null, null, '37', '/Uploads/message/2016-03-30/56fb7a1f65c2b.jpg', '1459321375', '0', '3');
INSERT INTO `img` VALUES ('347', '69', null, null, '44', '/Uploads/message/2016-04-01/56fe219805cbd.jpg', '1459495320', '1', '3');
INSERT INTO `img` VALUES ('348', '70', null, null, '37', '/Uploads/message/2016-04-01/56fe34c8539f4.jpg', '1459500232', '1', '3');
INSERT INTO `img` VALUES ('349', '72', null, null, '44', '/Uploads/message/2016-04-01/56fe356b9cfa9.jpg', '1459500395', '1', '3');
INSERT INTO `img` VALUES ('350', null, null, '31', '37', '/Uploads/images/2016-04-01/56fe388109a37.jpg', '1459501185', '1', '2');
INSERT INTO `img` VALUES ('351', null, null, '31', '37', '/Uploads/images/2016-04-01/56fe38830e1df.jpg', '1459501187', '1', '2');
INSERT INTO `img` VALUES ('352', null, null, '31', '37', '/Uploads/images/2016-04-01/56fe3885259c0.jpeg', '1459501189', '1', '2');
INSERT INTO `img` VALUES ('353', null, null, '31', '37', '/Uploads/images/2016-04-01/56fe3886e204f.jpeg', '1459501190', '1', '2');
INSERT INTO `img` VALUES ('354', '76', null, null, '37', '/Uploads/message/2016-04-01/56fe436a52546.jpg', '1459503978', '0', '3');
INSERT INTO `img` VALUES ('355', '76', null, null, '37', '/Uploads/message/2016-04-01/56fe436c8c71c.jpg', '1459503980', '0', '3');
INSERT INTO `img` VALUES ('356', '76', null, null, '37', '/Uploads/message/2016-04-01/56fe437024455.jpg', '1459503984', '0', '3');
INSERT INTO `img` VALUES ('357', '76', null, null, '37', '/Uploads/message/2016-04-01/56fe437ee25bf.jpg', '1459503998', '0', '3');
INSERT INTO `img` VALUES ('358', '76', null, null, '37', '/Uploads/message/2016-04-01/56fe4389a547d.jpg', '1459504009', '0', '3');
INSERT INTO `img` VALUES ('521', '117', null, null, '38', '/Uploads/message/2016-04-13/570de0dc3e7cd.png', '1460527324', '1', '3');
INSERT INTO `img` VALUES ('363', null, null, null, '69', '/Uploads/69/3b077517d9d990c242aa2c6a0b73efe1.png', '1459515895', '1', '1');
INSERT INTO `img` VALUES ('364', null, null, null, '70', '/Uploads/70/c4356f8509fd9e3c092b044c00f4e210.png', '1459517120', '1', '1');
INSERT INTO `img` VALUES ('365', '77', null, null, '37', '/Uploads/message/2016-04-05/57035a4550743.jpeg', '1459837509', '1', '3');
INSERT INTO `img` VALUES ('366', '77', null, null, '37', '/Uploads/message/2016-04-05/57035a5299145.jpg', '1459837522', '1', '3');
INSERT INTO `img` VALUES ('367', '77', null, null, '37', '/Uploads/message/2016-04-05/57035a5af419b.jpg', '1459837531', '1', '3');
INSERT INTO `img` VALUES ('368', '77', null, null, '37', '/Uploads/message/2016-04-05/57035a6a5e73a.jpg', '1459837546', '1', '3');
INSERT INTO `img` VALUES ('369', '77', null, null, '37', '/Uploads/message/2016-04-05/57035a6c21fa2.jpeg', '1459837548', '1', '3');
INSERT INTO `img` VALUES ('370', null, null, null, '71', '/Uploads/71/1faf9c091e65a5d14f719e731c562cd1.jpg', '1459843100', '1', '1');
INSERT INTO `img` VALUES ('371', null, null, null, '71', '/Uploads/71/c706c42cd38e372c92bf196453be3250.jpg', '1459843104', '1', '1');
INSERT INTO `img` VALUES ('372', '80', null, null, '71', '/Uploads/message/2016-04-05/57037305d7a65.jpg', '1459843845', '0', '3');
INSERT INTO `img` VALUES ('373', '81', null, null, '44', '/Uploads/message/2016-04-06/5704ab97b716e.jpg', '1459923863', '0', '3');
INSERT INTO `img` VALUES ('374', null, null, null, '73', '/Uploads/73/6b9d5f5896b9876dc659c03120521d83.jpg', '1459933308', '1', '1');
INSERT INTO `img` VALUES ('375', '82', null, null, '37', '/Uploads/message/2016-04-07/570623512add9.jpg', '1460020049', '1', '3');
INSERT INTO `img` VALUES ('376', '82', null, null, '37', '/Uploads/message/2016-04-07/5706235243c27.jpg', '1460020050', '1', '3');
INSERT INTO `img` VALUES ('377', '82', null, null, '37', '/Uploads/message/2016-04-07/57062352e9dc5.jpg', '1460020050', '1', '3');
INSERT INTO `img` VALUES ('378', '82', null, null, '37', '/Uploads/message/2016-04-07/5706235d028ef.jpg', '1460020061', '1', '3');
INSERT INTO `img` VALUES ('379', '82', null, null, '37', '/Uploads/message/2016-04-07/5706236477ddb.jpg', '1460020068', '1', '3');
INSERT INTO `img` VALUES ('380', '84', null, null, '38', '/Uploads/message/2016-04-07/570625f42fd85.jpg', '1460020724', '0', '3');
INSERT INTO `img` VALUES ('381', null, null, '33', '38', '/Uploads/images/2016-04-07/57062b3302b1b.jpg', '1460022067', '1', '2');
INSERT INTO `img` VALUES ('488', null, '21', null, null, '/Uploads/guanggao/2016-04-12/570c69eaace78.jpg', null, '0', '4');
INSERT INTO `img` VALUES ('461', null, null, null, '88', '/Uploads/88/62a60f8639da0a81561acc048e9cd5af.jpg', '1460346431', '0', '1');
INSERT INTO `img` VALUES ('455', null, '20', null, null, '/Uploads/guanggao/2016-04-09/5708630ca38e3.jpg', null, '0', '4');
INSERT INTO `img` VALUES ('449', '99', null, null, '43', '/Uploads/message/2016-04-09/5708602ed38ec.jpg', '1460166702', '1', '3');
INSERT INTO `img` VALUES ('438', null, null, null, '43', '/Uploads/43/68afb4483b6964911774ef47d27b4dc7.jpg', '1460157291', '1', '1');
INSERT INTO `img` VALUES ('439', null, null, null, '43', '/Uploads/43/2e375012fd439569ac7cd2614f6bf628.jpg', '1460157308', '1', '1');
INSERT INTO `img` VALUES ('440', null, null, null, '43', '/Uploads/43/3bea622ce875e51d77eafae8d018f260.jpg', '1460157313', '1', '1');
INSERT INTO `img` VALUES ('441', null, null, null, '43', '/Uploads/43/8af9c024d96fe6f5433738adc7d567a9.jpg', '1460157319', '1', '1');
INSERT INTO `img` VALUES ('442', '94', null, null, '43', '/Uploads/message/2016-04-09/570840abb1e79.jpg', '1460158635', '1', '3');
INSERT INTO `img` VALUES ('443', null, null, null, '43', '/Uploads/43/f3a20daee51e9f0dd53e2f3621272fd0.jpg', '1460164475', '1', '1');
INSERT INTO `img` VALUES ('444', null, null, null, '43', '/Uploads/43/06d4d1dc1f9567fd4da80bd3aa707f40.jpg', '1460164480', '1', '1');
INSERT INTO `img` VALUES ('445', null, null, null, '43', '/Uploads/43/d94a3efb617a97c264708555d55a40e7.jpg', '1460164487', '1', '1');
INSERT INTO `img` VALUES ('446', '95', null, null, '43', '/Uploads/message/2016-04-09/570857b7df6cb.jpg', '1460164535', '1', '3');
INSERT INTO `img` VALUES ('447', null, null, '34', '43', '/Uploads/images/2016-04-09/570857f372fa5.jpg', '1460164595', '1', '2');
INSERT INTO `img` VALUES ('491', null, '24', null, null, '/Uploads/guanggao/2016-04-12/570c6c1c4e595.jpg', null, '0', '4');
INSERT INTO `img` VALUES ('460', null, '23', null, null, '/Uploads/guanggao/2016-04-09/5708677d50426.png', null, '0', '4');
INSERT INTO `img` VALUES ('462', null, null, null, '88', '/Uploads/88/b71264f9e04d8d370ca4884c5627e6ce.jpg', '1460346521', '0', '1');
INSERT INTO `img` VALUES ('493', null, '22', null, null, '/Uploads/guanggao/2016-04-12/570c6d58cf997.jpg', null, '0', '4');
INSERT INTO `img` VALUES ('466', '103', null, null, '37', '/Uploads/message/2016-04-11/570b4c5a74c54.jpg', '1460358234', '1', '3');
INSERT INTO `img` VALUES ('467', '103', null, null, '37', '/Uploads/message/2016-04-11/570b4c5bf3602.jpg', '1460358235', '1', '3');
INSERT INTO `img` VALUES ('468', '103', null, null, '37', '/Uploads/message/2016-04-11/570b4c5d3b52b.jpg', '1460358237', '1', '3');
INSERT INTO `img` VALUES ('469', '103', null, null, '37', '/Uploads/message/2016-04-11/570b4c5dbe881.jpg', '1460358237', '1', '3');
INSERT INTO `img` VALUES ('470', '104', null, null, '37', '/Uploads/message/2016-04-11/570b4ca9df8f3.jpg', '1460358313', '1', '3');
INSERT INTO `img` VALUES ('471', '104', null, null, '37', '/Uploads/message/2016-04-11/570b4caaab006.jpeg', '1460358314', '1', '3');
INSERT INTO `img` VALUES ('472', '104', null, null, '37', '/Uploads/message/2016-04-11/570b4cac3317d.jpeg', '1460358316', '1', '3');
INSERT INTO `img` VALUES ('473', '104', null, null, '37', '/Uploads/message/2016-04-11/570b4cac7cc1b.jpg', '1460358316', '1', '3');
INSERT INTO `img` VALUES ('474', '104', null, null, '37', '/Uploads/message/2016-04-11/570b4caccad0e.jpg', '1460358316', '1', '3');
INSERT INTO `img` VALUES ('475', null, null, '35', '37', '/Uploads/images/2016-04-11/570b5a5eaf351.jpeg', '1460361822', '0', '2');
INSERT INTO `img` VALUES ('476', null, null, '35', '37', '/Uploads/images/2016-04-11/570b5a5fa1c23.jpg', '1460361823', '0', '2');
INSERT INTO `img` VALUES ('477', null, null, '35', '37', '/Uploads/images/2016-04-11/570b5a643e65b.jpg', '1460361828', '0', '2');
INSERT INTO `img` VALUES ('478', null, null, '35', '37', '/Uploads/images/2016-04-11/570b5a64c8a5e.jpg', '1460361828', '0', '2');
INSERT INTO `img` VALUES ('479', null, null, '35', '37', '/Uploads/images/2016-04-11/570b5a6545087.jpg', '1460361829', '0', '2');
INSERT INTO `img` VALUES ('480', null, null, '36', '37', '/Uploads/images/2016-04-11/570b5b6ec8551.jpg', '1460362094', '0', '2');
INSERT INTO `img` VALUES ('481', null, null, '36', '37', '/Uploads/images/2016-04-11/570b5b70df177.jpg', '1460362096', '0', '2');
INSERT INTO `img` VALUES ('482', null, null, '36', '37', '/Uploads/images/2016-04-11/570b5b7176b09.jpg', '1460362097', '0', '2');
INSERT INTO `img` VALUES ('483', null, null, '36', '37', '/Uploads/images/2016-04-11/570b5b7227a24.jpg', '1460362098', '0', '2');
INSERT INTO `img` VALUES ('484', null, null, '37', '37', '/Uploads/images/2016-04-12/570c59b8d2e21.jpg', '1460427192', '1', '2');
INSERT INTO `img` VALUES ('485', '105', null, null, '37', '/Uploads/message/2016-04-12/570c6073b1512.jpg', '1460428915', '1', '3');
INSERT INTO `img` VALUES ('486', '105', null, null, '37', '/Uploads/message/2016-04-12/570c6078830db.jpg', '1460428920', '1', '3');
INSERT INTO `img` VALUES ('490', null, '19', null, null, '/Uploads/guanggao/2016-04-12/570c6b369fe8a.jpg', null, '0', '4');
INSERT INTO `img` VALUES ('499', null, null, null, '38', '/Uploads/38/55cc28f7c97c3a45569ad7165219feb8.jpg', '1460518686', '0', '1');
INSERT INTO `img` VALUES ('498', null, null, null, '33', '/Uploads/33/a826a4554e9ac115d6aaa2e2b6a832b4.jpg', '1460446569', '0', '1');
INSERT INTO `img` VALUES ('503', '109', null, null, '38', '/Uploads/message/2016-04-13/570dc11a06926.jpg', '1460519194', '1', '3');
INSERT INTO `img` VALUES ('504', '110', null, null, '38', '/Uploads/message/2016-04-13/570dc127a00ee.jpg', '1460519207', '1', '3');
INSERT INTO `img` VALUES ('505', null, null, '39', '38', '/Uploads/images/2016-04-13/570dccb3239a9.jpg', '1460522163', '1', '2');
INSERT INTO `img` VALUES ('506', null, null, '39', '38', '/Uploads/images/2016-04-13/570dccb94f95b.jpg', '1460522169', '1', '2');
INSERT INTO `img` VALUES ('507', null, null, '39', '38', '/Uploads/images/2016-04-13/570dccbf4452f.jpg', '1460522175', '1', '2');
INSERT INTO `img` VALUES ('508', null, null, '40', '38', '/Uploads/images/2016-04-13/570dcdb0b16dd.jpg', '1460522416', '1', '2');
INSERT INTO `img` VALUES ('509', null, null, '40', '38', '/Uploads/images/2016-04-13/570dcdb71bfab.jpg', '1460522423', '1', '2');
INSERT INTO `img` VALUES ('510', null, null, '40', '38', '/Uploads/images/2016-04-13/570dcdbb38771.jpg', '1460522427', '1', '2');
INSERT INTO `img` VALUES ('511', null, null, '40', '38', '/Uploads/images/2016-04-13/570dcdc097c56.jpg', '1460522432', '1', '2');
INSERT INTO `img` VALUES ('512', null, null, '40', '38', '/Uploads/images/2016-04-13/570dcdc5e01b8.jpg', '1460522437', '1', '2');
INSERT INTO `img` VALUES ('513', null, null, '40', '38', '/Uploads/images/2016-04-13/570dcdc9ecca6.jpg', '1460522441', '1', '2');
INSERT INTO `img` VALUES ('514', null, null, '40', '38', '/Uploads/images/2016-04-13/570dcdcf64e73.jpg', '1460522447', '1', '2');
INSERT INTO `img` VALUES ('515', null, null, '40', '38', '/Uploads/images/2016-04-13/570dcdd3d3403.jpg', '1460522451', '1', '2');
INSERT INTO `img` VALUES ('516', null, null, null, '43', '/Uploads/43/f28ebb343c92ff3c95dabf643f338663.jpg', '1460523899', '0', '1');
INSERT INTO `img` VALUES ('535', '123', null, null, '95', '/Uploads/message/2016-04-14/570f3be2c192f.jpg', '1460616162', '0', '3');
INSERT INTO `img` VALUES ('536', '123', null, null, '95', '/Uploads/message/2016-04-14/570f3be588a1b.jpg', '1460616165', '0', '3');
INSERT INTO `img` VALUES ('537', '123', null, null, '95', '/Uploads/message/2016-04-14/570f3be6dad9d.jpg', '1460616166', '0', '3');
INSERT INTO `img` VALUES ('538', null, null, null, '96', '/Uploads/96/3516567d7b62e822a6b06aa2612b001f.jpg', '1460616246', '1', '1');
INSERT INTO `img` VALUES ('539', '125', null, null, '96', '/Uploads/message/2016-04-14/570f3ff9b2ad1.jpg', '1460617209', '1', '3');
INSERT INTO `img` VALUES ('540', '126', null, null, '95', '/Uploads/message/2016-04-14/570f401bdcbee.jpg', '1460617243', '0', '3');
INSERT INTO `img` VALUES ('541', null, null, '52', '98', '/Uploads/images/2016-04-14/570f424a70c2c.jpg', '1460617802', '0', '2');
INSERT INTO `img` VALUES ('542', null, null, '52', '98', '/Uploads/images/2016-04-14/570f424db373e.jpg', '1460617805', '0', '2');
INSERT INTO `img` VALUES ('543', null, null, '53', '96', '/Uploads/images/2016-04-15/571067d52e390.jpg', '1460692949', '0', '2');
INSERT INTO `img` VALUES ('544', null, null, '53', '96', '/Uploads/images/2016-04-15/571067f625533.jpg', '1460692982', '0', '2');
INSERT INTO `img` VALUES ('545', null, null, '53', '96', '/Uploads/images/2016-04-15/571067f78d39e.jpg', '1460692983', '0', '2');
INSERT INTO `img` VALUES ('546', null, null, '54', '96', '/Uploads/images/2016-04-15/57108f238934c.jpg', '1460703011', '0', '2');
INSERT INTO `img` VALUES ('547', null, null, '54', '96', '/Uploads/images/2016-04-15/57108f3f9a2ec.jpg', '1460703039', '0', '2');
INSERT INTO `img` VALUES ('548', null, null, '54', '96', '/Uploads/images/2016-04-15/57108f41d3db2.jpg', '1460703041', '0', '2');
INSERT INTO `img` VALUES ('549', null, null, '55', '96', '/Uploads/images/2016-04-15/57109079c0174.jpg', '1460703353', '0', '2');
INSERT INTO `img` VALUES ('550', null, null, '55', '96', '/Uploads/images/2016-04-15/571090afb00c8.jpg', '1460703407', '0', '2');
INSERT INTO `img` VALUES ('551', null, null, '55', '96', '/Uploads/images/2016-04-15/571090b092b94.jpg', '1460703408', '0', '2');
INSERT INTO `img` VALUES ('552', null, null, '58', '96', '/Uploads/images/2016-04-15/5710934ec0742.jpg', '1460704078', '1', '2');
INSERT INTO `img` VALUES ('553', null, null, '59', '44', '/Uploads/images/2016-04-15/57109f6cadbb7.jpg', '1460707180', '0', '2');
INSERT INTO `img` VALUES ('554', null, null, '59', '44', '/Uploads/images/2016-04-15/57109f75a9d91.jpg', '1460707189', '0', '2');
INSERT INTO `img` VALUES ('555', null, null, '59', '44', '/Uploads/images/2016-04-15/57109f7c4abcb.jpg', '1460707196', '0', '2');
INSERT INTO `img` VALUES ('556', null, null, '60', '44', '/Uploads/images/2016-04-15/5710a02467f46.jpg', '1460707364', '1', '2');
INSERT INTO `img` VALUES ('557', null, null, '60', '44', '/Uploads/images/2016-04-15/5710a03598442.jpg', '1460707381', '1', '2');
INSERT INTO `img` VALUES ('558', null, null, '60', '44', '/Uploads/images/2016-04-15/5710a0371ce30.jpg', '1460707383', '1', '2');
INSERT INTO `img` VALUES ('559', null, null, null, '99', '/Uploads/99/14a40799a4da3d49d60dcbd1e3d258b1.jpg', '1460710045', '1', '1');
INSERT INTO `img` VALUES ('560', null, null, null, '101', '/Uploads/101/c214a2d64b4d7208487463fc2410410a.jpg', '1460712771', '0', '1');
INSERT INTO `img` VALUES ('561', null, null, null, '102', '/Uploads/102/cef6d73e382f0bb3fbf49868d0899d66.jpg', '1460780007', '1', '1');

-- ----------------------------
-- Table structure for jubao_info
-- ----------------------------
DROP TABLE IF EXISTS `jubao_info`;
CREATE TABLE `jubao_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jubao_id` int(10) unsigned DEFAULT NULL COMMENT '举报人id',
  `bjubao_id` int(10) unsigned DEFAULT NULL COMMENT '被举报人id',
  `content` varchar(500) DEFAULT '' COMMENT '举报内容',
  PRIMARY KEY (`id`),
  KEY `id_index` (`jubao_id`,`bjubao_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jubao_info
-- ----------------------------

-- ----------------------------
-- Table structure for letter_info
-- ----------------------------
DROP TABLE IF EXISTS `letter_info`;
CREATE TABLE `letter_info` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `jieshou_id` int(11) DEFAULT NULL COMMENT '接收人id',
  `send_id` int(11) DEFAULT NULL COMMENT '发送信息给我的人id',
  `content` text,
  `send_time` varchar(50) DEFAULT '' COMMENT '我发消息的时间',
  `status` tinyint(3) DEFAULT '0' COMMENT '是否 被读 已读：1',
  PRIMARY KEY (`id`),
  KEY `index` (`jieshou_id`,`send_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=265 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of letter_info
-- ----------------------------
INSERT INTO `letter_info` VALUES ('1', '22', '21', 'aaaaaaaaaa', '1456910000', '1');
INSERT INTO `letter_info` VALUES ('139', '58', '44', '该死的懦弱！', '1459239537', '0');
INSERT INTO `letter_info` VALUES ('140', '59', '17', '荧光般温柔?', '1459240849', '0');
INSERT INTO `letter_info` VALUES ('68', '17', '43', '红点提示太小', '1458704552', '1');
INSERT INTO `letter_info` VALUES ('67', '43', '17', '这可能 的 消息提示 不知道可以吗？\n', '1458703993', '1');
INSERT INTO `letter_info` VALUES ('116', '37', '44', '消息提醒测试 哈哈', '1458791113', '1');
INSERT INTO `letter_info` VALUES ('56', '23', '21', 'hgh', '1457847912', '0');
INSERT INTO `letter_info` VALUES ('57', '21', '18', '11', '1457861955', '1');
INSERT INTO `letter_info` VALUES ('58', '21', '17', '11', '1457861955', '1');
INSERT INTO `letter_info` VALUES ('59', '21', '22', '11', '1457861955', '1');
INSERT INTO `letter_info` VALUES ('114', '38', '37', '你好！！！！', '1458787569', '1');
INSERT INTO `letter_info` VALUES ('115', '37', '44', '新朋友，打个招呼。。', '1458790330', '1');
INSERT INTO `letter_info` VALUES ('62', '21', '17', 'fsdfsdfsdfsad', '1457959872', '1');
INSERT INTO `letter_info` VALUES ('63', '32', '31', 'jlkjrkltjlesdfjds', '1458202594', '1');
INSERT INTO `letter_info` VALUES ('65', '44', '18', '？？？？', '1458611364', '1');
INSERT INTO `letter_info` VALUES ('66', '43', '17', '你好', '1458612775', '1');
INSERT INTO `letter_info` VALUES ('36', '17', '22', '783324154', '1457697207', '1');
INSERT INTO `letter_info` VALUES ('64', '28', '31', '哈罗哈罗。。。。', '1458204048', '0');
INSERT INTO `letter_info` VALUES ('48', '21', '18', '44士大夫撒旦法', '1457860000', '1');
INSERT INTO `letter_info` VALUES ('117', '44', '37', '噢噢噢噢哦哦', '1458791254', '1');
INSERT INTO `letter_info` VALUES ('118', '38', '44', '土豆土豆，我是地瓜。。。', '1458791671', '1');
INSERT INTO `letter_info` VALUES ('119', '54', '37', 'yggggggggggg', '1458801402', '1');
INSERT INTO `letter_info` VALUES ('172', '17', '54', 'sdfsdf', '1460115478', '1');
INSERT INTO `letter_info` VALUES ('121', '54', '37', '国， ', '1458811478', '1');
INSERT INTO `letter_info` VALUES ('170', '80', '59', '十梦九有你∧', '1460108429', '1');
INSERT INTO `letter_info` VALUES ('171', '17', '43', '嗨 你好', '1460114027', '1');
INSERT INTO `letter_info` VALUES ('169', '79', '60', '伱是我年少時最藍的海', '1460095171', '1');
INSERT INTO `letter_info` VALUES ('244', '96', '95', '哦哦哦哦。。。。', '1460616871', '1');
INSERT INTO `letter_info` VALUES ('167', '77', '61', '凉城小街姑娘未离去。', '1460087603', '0');
INSERT INTO `letter_info` VALUES ('243', '95', '96', '111111', '1460616839', '1');
INSERT INTO `letter_info` VALUES ('165', '75', '21', 'Summer° 初夏', '1460083605', '1');
INSERT INTO `letter_info` VALUES ('242', '95', '96', 'ksdjflkjsdljfksldf', '1460616831', '1');
INSERT INTO `letter_info` VALUES ('163', '73', '33', '朝着阳光走', '1459933203', '0');
INSERT INTO `letter_info` VALUES ('162', '72', '44', '迷失的麋鹿', '1459848644', '1');
INSERT INTO `letter_info` VALUES ('241', '95', '96', '哈喽。。。。', '1460616814', '1');
INSERT INTO `letter_info` VALUES ('160', '70', '45', 'nightmare梦魇', '1459517096', '0');
INSERT INTO `letter_info` VALUES ('159', '69', '44', '十年浮夸终成孤独患者', '1459515796', '1');
INSERT INTO `letter_info` VALUES ('240', '96', '95', '你好，我是。。。', '1460616691', '1');
INSERT INTO `letter_info` VALUES ('157', '37', '44', '巴拉巴拉小魔仙。。。。。', '1459478588', '1');
INSERT INTO `letter_info` VALUES ('136', '55', '33', '十梦九有你∧', '1459239024', '1');
INSERT INTO `letter_info` VALUES ('137', '56', '36', '迷失的麋鹿', '1459239176', '0');
INSERT INTO `letter_info` VALUES ('138', '57', '22', 'Sandm。旧颜', '1459239359', '1');
INSERT INTO `letter_info` VALUES ('113', '21', '47', 'fsdfsdfsdfsad', '1458786741', '1');
INSERT INTO `letter_info` VALUES ('111', '54', '29', '带着爱意奔波四方', '1458738044', '1');
INSERT INTO `letter_info` VALUES ('112', '21', '17', 'fsdfsdfsdfsad', '1458786741', '1');
INSERT INTO `letter_info` VALUES ('239', '37', '98', '嗨 你好', '1460603798', '1');
INSERT INTO `letter_info` VALUES ('142', '61', '27', 'Autism（孤独症）', '1459241049', '0');
INSERT INTO `letter_info` VALUES ('143', '62', '46', '柠檬草的味道、', '1459241185', '0');
INSERT INTO `letter_info` VALUES ('144', '63', '61', '爱情灼心', '1459241496', '0');
INSERT INTO `letter_info` VALUES ('145', '64', '55', 'nightmare梦魇', '1459241591', '1');
INSERT INTO `letter_info` VALUES ('146', '65', '64', '十梦九有你∧', '1459242818', '1');
INSERT INTO `letter_info` VALUES ('147', '37', '21', '', '1459319653', '1');
INSERT INTO `letter_info` VALUES ('148', '37', '21', '', '1459319929', '1');
INSERT INTO `letter_info` VALUES ('149', '37', '21', '', '1459319929', '1');
INSERT INTO `letter_info` VALUES ('150', '37', '21', '', '1459319937', '1');
INSERT INTO `letter_info` VALUES ('151', '37', '21', '', '1459320417', '1');
INSERT INTO `letter_info` VALUES ('152', '37', '21', '', '1459320973', '1');
INSERT INTO `letter_info` VALUES ('153', '37', '21', '嗨 你好', '1459321471', '1');
INSERT INTO `letter_info` VALUES ('154', '66', '45', '伱是我年少時最藍的海', '1459322022', '0');
INSERT INTO `letter_info` VALUES ('156', '38', '44', 'hi', '1459475070', '1');
INSERT INTO `letter_info` VALUES ('173', '81', '74', '用旅行来遗忘爱', '1460154446', '1');
INSERT INTO `letter_info` VALUES ('174', '82', '27', '薄荷加冰i', '1460155577', '1');
INSERT INTO `letter_info` VALUES ('175', '46', '43', '建立三级地方两级萨拉丁解放路撒旦解放了深刻鉴定费雷斯柯达将发生的垃圾分类考试的减肥', '1460156071', '1');
INSERT INTO `letter_info` VALUES ('176', '17', '43', '你好', '1460156745', '1');
INSERT INTO `letter_info` VALUES ('177', '17', '43', 'nizailjlkjf', '1460156753', '1');
INSERT INTO `letter_info` VALUES ('178', '17', '43', '打发打发', '1460156945', '1');
INSERT INTO `letter_info` VALUES ('179', '17', '43', '士大夫撒旦发射点发', '1460156952', '1');
INSERT INTO `letter_info` VALUES ('180', '82', '43', '就看见空间', '1460158438', '1');
INSERT INTO `letter_info` VALUES ('181', '17', '43', '打发打发打发', '1460158560', '1');
INSERT INTO `letter_info` VALUES ('182', '17', '43', '奋斗奋斗司法所', '1460158566', '1');
INSERT INTO `letter_info` VALUES ('183', '17', '43', '放松放松法', '1460158570', '1');
INSERT INTO `letter_info` VALUES ('184', '17', '43', '飞洒放松', '1460158575', '1');
INSERT INTO `letter_info` VALUES ('185', '17', '43', '飞洒放松', '1460158579', '1');
INSERT INTO `letter_info` VALUES ('186', '88', '29', '用旅行来遗忘爱', '1460173301', '1');
INSERT INTO `letter_info` VALUES ('187', '43', '17', '右下角的 信息提示只有首次注册的时候才有', '1460181793', '1');
INSERT INTO `letter_info` VALUES ('238', '98', '61', 'Hi，你好！能交个朋友吗？', '1460601796', '1');
INSERT INTO `letter_info` VALUES ('189', '44', '17', '方的观点是', '1460193719', '1');
INSERT INTO `letter_info` VALUES ('190', '37', '17', '嗨 你好', '1460194442', '1');
INSERT INTO `letter_info` VALUES ('191', '37', '17', '嗨 你好', '1460194500', '1');
INSERT INTO `letter_info` VALUES ('192', '89', '88', '嗨 你好', '1460195115', '0');
INSERT INTO `letter_info` VALUES ('193', '41', '88', '嗨 你好', '1460201632', '0');
INSERT INTO `letter_info` VALUES ('194', '54', '40', '你好我是你老公', '1460204328', '1');
INSERT INTO `letter_info` VALUES ('195', '40', '54', 'nihao \n', '1460204352', '1');
INSERT INTO `letter_info` VALUES ('196', '40', '54', '我不认识你', '1460204369', '1');
INSERT INTO `letter_info` VALUES ('197', '54', '40', '你怎么还不回家', '1460204379', '1');
INSERT INTO `letter_info` VALUES ('198', '54', '40', '你老公在家里等你呢', '1460204389', '1');
INSERT INTO `letter_info` VALUES ('199', '54', '40', '老婆', '1460204409', '1');
INSERT INTO `letter_info` VALUES ('200', '54', '40', '我爱你', '1460204419', '1');
INSERT INTO `letter_info` VALUES ('201', '37', '54', 'j\'k\'m\'n\'b\'j\'k\'g\'h', '1460204427', '1');
INSERT INTO `letter_info` VALUES ('202', '29', '54', 'nv\'b\'j\'h\'gu\'j', '1460204437', '0');
INSERT INTO `letter_info` VALUES ('203', '54', '40', '家里短发散发', '1460204437', '1');
INSERT INTO `letter_info` VALUES ('204', '54', '40', '福瑞特尔特 ', '1460204452', '1');
INSERT INTO `letter_info` VALUES ('205', '40', '54', '你把经过十几个号码，n', '1460204453', '1');
INSERT INTO `letter_info` VALUES ('206', '54', '40', '第三方斯蒂芬斯蒂芬', '1460204456', '1');
INSERT INTO `letter_info` VALUES ('207', '40', '54', '穆念慈阿门，d\'nv\'m\'vn', '1460204464', '1');
INSERT INTO `letter_info` VALUES ('208', '40', '54', '嗨 你好', '1460204543', '1');
INSERT INTO `letter_info` VALUES ('209', '31', '17', '嗨 你好', '1460278321', '0');
INSERT INTO `letter_info` VALUES ('210', '44', '38', '嗨 你好', '1460343186', '1');
INSERT INTO `letter_info` VALUES ('211', '37', '38', '嗨 你好', '1460343255', '1');
INSERT INTO `letter_info` VALUES ('212', '38', '37', '中国西电大声唱', '1460343988', '1');
INSERT INTO `letter_info` VALUES ('213', '37', '80', '嗨 你好', '1460353632', '1');
INSERT INTO `letter_info` VALUES ('214', '37', '43', '嗨 你好', '1460364068', '1');
INSERT INTO `letter_info` VALUES ('215', '92', '40', 'Hi,我们能聊聊吗？', '1460384283', '1');
INSERT INTO `letter_info` VALUES ('216', '93', '59', 'Hi,我们能聊聊吗？', '1460384619', '1');
INSERT INTO `letter_info` VALUES ('217', '44', '38', 'dfdfd', '1460518351', '1');
INSERT INTO `letter_info` VALUES ('218', '38', '75', 'hjhj', '1460518445', '1');
INSERT INTO `letter_info` VALUES ('219', '75', '38', '你好', '1460518489', '1');
INSERT INTO `letter_info` VALUES ('220', '38', '75', 'jkjk', '1460518563', '1');
INSERT INTO `letter_info` VALUES ('221', '75', '38', '加快建立棵', '1460518611', '1');
INSERT INTO `letter_info` VALUES ('222', '46', '38', '嗨 你好', '1460518904', '1');
INSERT INTO `letter_info` VALUES ('223', '75', '38', '打扫打扫打扫的', '1460519701', '1');
INSERT INTO `letter_info` VALUES ('224', '75', '38', '撒旦撒旦撒旦撒', '1460519706', '1');
INSERT INTO `letter_info` VALUES ('225', '75', '38', '撒旦撒旦撒旦', '1460519711', '1');
INSERT INTO `letter_info` VALUES ('226', '75', '38', '撒旦撒旦撒旦撒', '1460519715', '1');
INSERT INTO `letter_info` VALUES ('227', '75', '38', '22饿了凉快凉快凉快', '1460519724', '1');
INSERT INTO `letter_info` VALUES ('228', '80', '37', 'nihao', '1460520000', '1');
INSERT INTO `letter_info` VALUES ('229', '80', '37', '111111', '1460521338', '1');
INSERT INTO `letter_info` VALUES ('230', '80', '37', '222222', '1460521345', '1');
INSERT INTO `letter_info` VALUES ('231', '80', '37', '33333333', '1460521350', '1');
INSERT INTO `letter_info` VALUES ('232', '80', '37', '44444444', '1460521358', '1');
INSERT INTO `letter_info` VALUES ('233', '37', '38', '你好啊', '1460521800', '1');
INSERT INTO `letter_info` VALUES ('234', '44', '37', 'fgfghfhgfhgf', '1460536684', '1');
INSERT INTO `letter_info` VALUES ('235', '95', '29', 'Hi,我们能聊聊吗？', '1460540659', '1');
INSERT INTO `letter_info` VALUES ('237', '97', '93', 'Hi,我们能聊聊吗？', '1460601142', '1');
INSERT INTO `letter_info` VALUES ('245', '96', '95', '1212154545212', '1460616876', '1');
INSERT INTO `letter_info` VALUES ('246', '95', '96', 'SAFDSFDSFSDF', '1460616901', '1');
INSERT INTO `letter_info` VALUES ('247', '95', '96', 'DFDFDFDF', '1460616905', '1');
INSERT INTO `letter_info` VALUES ('248', '95', '96', '发斯蒂芬', '1460617241', '1');
INSERT INTO `letter_info` VALUES ('249', '95', '96', '发斯蒂芬是', '1460617253', '1');
INSERT INTO `letter_info` VALUES ('250', '95', '96', '啥地方啥地方啥地方阿斯蒂芬', '1460617261', '1');
INSERT INTO `letter_info` VALUES ('251', '95', '96', '1111111111111111', '1460617275', '1');
INSERT INTO `letter_info` VALUES ('252', '95', '96', '1111111111111111', '1460617276', '1');
INSERT INTO `letter_info` VALUES ('253', '95', '96', 'dfdfdfdfdf', '1460619577', '1');
INSERT INTO `letter_info` VALUES ('254', '95', '96', '发达啊啊啊啥地方啥地方      是否丰富反反复复反复发反反复复反复反复反复反复反复反反复复反复发反反复复反复反复反复反复反复啥地方反福福福福福福福福福啥地方sddddddddddddddddddddddddddddddddddddd的所发生的', '1460620015', '1');
INSERT INTO `letter_info` VALUES ('255', '96', '95', 'lsdjfkjdskfjklsdjfklsd', '1460620488', '1');
INSERT INTO `letter_info` VALUES ('256', '47', '88', 'gsdfg ', '1460687459', '1');
INSERT INTO `letter_info` VALUES ('257', '99', '38', 'Hi，你好！能交个朋友吗？', '1460709966', '1');
INSERT INTO `letter_info` VALUES ('258', '100', '29', 'Hi,我们能聊聊吗？', '1460711223', '1');
INSERT INTO `letter_info` VALUES ('259', '101', '93', 'Hi，你好！能交个朋友吗？', '1460712753', '1');
INSERT INTO `letter_info` VALUES ('260', '105', '88', 'Hi,我们能聊聊吗？', '1460776587', '0');
INSERT INTO `letter_info` VALUES ('261', '106', '62', 'Hi,我们能聊聊吗？', '1460776787', '0');
INSERT INTO `letter_info` VALUES ('262', '107', '97', 'Hi，你好！能交个朋友吗？', '1460776900', '0');
INSERT INTO `letter_info` VALUES ('263', '102', '21', 'hello', '1460793913', '1');
INSERT INTO `letter_info` VALUES ('264', '102', '21', '美女在吗？', '1460793936', '1');

-- ----------------------------
-- Table structure for liwu
-- ----------------------------
DROP TABLE IF EXISTS `liwu`;
CREATE TABLE `liwu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jieshou_id` int(11) NOT NULL,
  `send_id` int(11) NOT NULL,
  `liwu_url` varchar(255) NOT NULL COMMENT '礼物的图片',
  `liwu_count` int(11) NOT NULL,
  `time` int(11) NOT NULL DEFAULT '0' COMMENT '0表示没有回赠 1表示已经有回赠',
  `is_huizen` int(11) DEFAULT NULL,
  `liwu_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of liwu
-- ----------------------------
INSERT INTO `liwu` VALUES ('1', '18', '17', '/css/Public/assets/images/gift3.png', '3', '1457603436', null, null);
INSERT INTO `liwu` VALUES ('2', '18', '17', '/css/Public/assets/images/gift2.png', '1', '1457603596', null, null);
INSERT INTO `liwu` VALUES ('3', '18', '17', '/css/Public/assets/images/gift2.png', '2', '1457603603', null, null);
INSERT INTO `liwu` VALUES ('4', '18', '17', '/css/Public/assets/images/gift2.png', '2', '1457603637', null, null);
INSERT INTO `liwu` VALUES ('5', '18', '17', '/css/Public/assets/images/gift2.png', '2', '1457603639', null, null);
INSERT INTO `liwu` VALUES ('6', '18', '17', '/css/Public/assets/images/gift2.png', '2', '1457603641', null, null);
INSERT INTO `liwu` VALUES ('7', '18', '17', '/css/Public/assets/images/gift3.png', '1', '1457603658', null, null);
INSERT INTO `liwu` VALUES ('8', '18', '17', '/css/Public/assets/images/gift3.png', '48', '1457603671', null, null);
INSERT INTO `liwu` VALUES ('9', '17', '22', '/css/Public/assets/images/gift3.png', '20', '1457615179', null, null);
INSERT INTO `liwu` VALUES ('10', '17', '22', '/css/Public/assets/images/gift4.png', '20', '1457615184', null, null);
INSERT INTO `liwu` VALUES ('11', '17', '22', '/css/Public/assets/images/gift6.png', '20', '1457615191', null, null);
INSERT INTO `liwu` VALUES ('12', '17', '22', '/css/Public/assets/images/gift9.png', '20', '1457615196', null, null);
INSERT INTO `liwu` VALUES ('13', '17', '22', '/css/Public/assets/images/gift9.png', '20', '1457615196', null, null);
INSERT INTO `liwu` VALUES ('14', '17', '22', '/css/Public/assets/images/gift5.png', '4', '1457665882', null, 'xiaoche');
INSERT INTO `liwu` VALUES ('15', '17', '22', '/css/Public/assets/images/gift1.png', '33', '1457665889', null, '小车');
INSERT INTO `liwu` VALUES ('16', '17', '22', '/css/Public/assets/images/gift6.png', '20', '1457665899', null, '汽油');
INSERT INTO `liwu` VALUES ('17', '17', '22', '/css/Public/assets/images/gift7.png', '1', '1457665906', null, '');
INSERT INTO `liwu` VALUES ('18', '17', '22', '/css/Public/assets/images/gift3.png', '1', '1457666441', null, '');
INSERT INTO `liwu` VALUES ('19', '17', '22', '/css/Public/assets/images/gift9.png', '1', '1457666453', null, '');
INSERT INTO `liwu` VALUES ('20', '17', '22', '/css/Public/assets/images/gift10.png', '1', '1457666457', null, '');
INSERT INTO `liwu` VALUES ('21', '17', '22', '/css/Public/assets/images/gift7.png', '1', '1457666460', null, '');
INSERT INTO `liwu` VALUES ('22', '17', '22', '/css/Public/assets/images/gift6.png', '1', '1457666463', null, '');
INSERT INTO `liwu` VALUES ('23', '17', '22', '/css/Public/assets/images/gift5.png', '1', '1457666802', null, '彩虹伞');
INSERT INTO `liwu` VALUES ('24', '17', '22', '/css/Public/assets/images/gift3.png', '1', '1457666806', null, '爱心早餐');
INSERT INTO `liwu` VALUES ('25', '17', '22', '/css/Public/assets/images/gift1.png', '1', '1457666808', null, '10克拉钻戒');
INSERT INTO `liwu` VALUES ('26', '17', '22', '/css/Public/assets/images/gift1.png', '1', '1457666809', null, '10克拉钻戒');
INSERT INTO `liwu` VALUES ('27', '17', '22', '/css/Public/assets/images/gift3.png', '1', '1457666812', null, '爱心早餐');
INSERT INTO `liwu` VALUES ('28', '17', '22', '/css/Public/assets/images/gift10.png', '1', '1457666823', null, '金苹果');
INSERT INTO `liwu` VALUES ('29', '21', '17', '/css/Public/assets/images/gift4.png', '1', '1457684337', null, '爱心枕');
INSERT INTO `liwu` VALUES ('30', '21', '17', '/css/Public/assets/images/gift5.png', '1', '1457684341', null, '彩虹伞');
INSERT INTO `liwu` VALUES ('31', '21', '17', '/css/Public/assets/images/gift1.png', '200', '1457684348', null, '10克拉钻戒');
INSERT INTO `liwu` VALUES ('32', '21', '17', '/css/Public/assets/images/gift3.png', '20', '1457684353', null, '爱心早餐');
INSERT INTO `liwu` VALUES ('33', '17', '17', '/css/Public/assets/images/gift4.png', '55', '1457684553', null, '爱心枕');
INSERT INTO `liwu` VALUES ('34', '17', '17', '/css/Public/assets/images/gift4.png', '1', '1457702692', null, '爱心枕');
INSERT INTO `liwu` VALUES ('35', '21', '21', '/jiaoyou/Public/assets/images/gift3.png', '3', '1457923786', null, '爱心早餐');
INSERT INTO `liwu` VALUES ('36', '17', '18', '/css/Public/assets/images/gift10.png', '100', '1457925400', '1', '金苹果');
INSERT INTO `liwu` VALUES ('37', '21', '18', '/css/Public/assets/images/gift4.png', '1', '1457925425', null, '爱心枕');
INSERT INTO `liwu` VALUES ('38', '21', '18', '/css/Public/assets/images/gift5.png', '1', '1457925428', null, '彩虹伞');
INSERT INTO `liwu` VALUES ('39', '18', '17', '/css/Public/assets/images/gift9.png', '1', '1457952900', null, '海洋之心');
INSERT INTO `liwu` VALUES ('40', '18', '17', '/css/Public/assets/images/gift10.png', '10', '1457952911', '1', '金苹果');
INSERT INTO `liwu` VALUES ('41', '17', '17', '/css/Public/assets/images/gift5.png', '1', '1457954855', null, '彩虹伞');
INSERT INTO `liwu` VALUES ('42', '17', '17', '/css/Public/assets/images/gift4.png', '1', '1457954858', null, '爱心枕');
INSERT INTO `liwu` VALUES ('43', '17', '17', '/css/Public/assets/images/gift2.png', '1', '1457954863', null, '爱心天鹅');
INSERT INTO `liwu` VALUES ('44', '17', '17', '/css/Public/assets/images/gift3.png', '1', '1457956608', '1', '爱心早餐');
INSERT INTO `liwu` VALUES ('45', '17', '17', '/css/Public/assets/images/gift10.png', '1', '1457956830', '1', '金苹果');
INSERT INTO `liwu` VALUES ('46', '21', '17', '/css/Public/assets/images/gift3.png', '1', '1458008374', null, '爱心早餐');
INSERT INTO `liwu` VALUES ('47', '21', '17', '/css/Public/assets/images/gift3.png', '1', '1458008374', null, '爱心早餐');
INSERT INTO `liwu` VALUES ('48', '21', '17', '/css/Public/assets/images/gift5.png', '1', '1458008377', null, '彩虹伞');
INSERT INTO `liwu` VALUES ('49', '17', '31', '/css/Public/assets/images/gift4.png', '552', '1458196273', '1', '爱心枕');
INSERT INTO `liwu` VALUES ('50', '31', '32', '/css/Public/assets/images/gift3.png', '1', '1458199349', null, '爱心早餐');
INSERT INTO `liwu` VALUES ('51', '32', '31', '/css/Public/assets/images/gift10.png', '2', '1458201711', null, '金苹果');
INSERT INTO `liwu` VALUES ('52', '32', '31', '/css/Public/assets/images/gift10.png', '2', '1458201770', null, '金苹果');
INSERT INTO `liwu` VALUES ('53', '32', '31', '/css/Public/assets/images/gift10.png', '2', '1458201838', null, '金苹果');
INSERT INTO `liwu` VALUES ('54', '31', '32', '/css/Public/assets/images/gift4.png', '10', '1458202078', null, '爱心枕');
INSERT INTO `liwu` VALUES ('55', '32', '31', '/css/Public/assets/images/gift3.png', '1', '1458202099', null, '爱心早餐');
INSERT INTO `liwu` VALUES ('56', '32', '31', '/css/Public/assets/images/gift3.png', '1', '1458202157', null, '爱心早餐');
INSERT INTO `liwu` VALUES ('57', '32', '31', '/css/Public/assets/images/gift9.png', '100', '1458202256', null, '海洋之心');
INSERT INTO `liwu` VALUES ('58', '32', '31', '/css/Public/assets/images/gift3.png', '1', '1458202273', null, '爱心早餐');
INSERT INTO `liwu` VALUES ('59', '31', '17', '/css/Public/assets/images/gift3.png', '1', '1458203260', null, '爱心早餐');
INSERT INTO `liwu` VALUES ('60', '31', '17', '/css/Public/assets/images/gift5.png', '1', '1458203264', null, '彩虹伞');
INSERT INTO `liwu` VALUES ('61', '31', '17', '/css/Public/assets/images/gift5.png', '1', '1458203265', null, '彩虹伞');
INSERT INTO `liwu` VALUES ('62', '31', '32', '/css/Public/assets/images/gift7.png', '10', '1458203694', null, '创意花束');
INSERT INTO `liwu` VALUES ('63', '31', '32', '/css/Public/assets/images/gift7.png', '10', '1458203778', null, '创意花束');
INSERT INTO `liwu` VALUES ('64', '31', '17', '/css/Public/assets/images/gift_8.png', '1', '1458203890', null, '粉抱枕');
INSERT INTO `liwu` VALUES ('65', '31', '17', '/css/Public/assets/images/gift_8.png', '1', '1458205271', null, '粉抱枕');
INSERT INTO `liwu` VALUES ('66', '17', '17', '/css/Public/assets/images/gift_8.png', '12', '1458205277', '1', '粉抱枕');
INSERT INTO `liwu` VALUES ('67', '17', '17', '/css/Public/assets/images/gift_8.png', '3', '1458205286', null, '粉抱枕');
INSERT INTO `liwu` VALUES ('68', '17', '17', '/css/Public/assets/images/gift9.png', '1', '1458219039', '1', '海洋之心');
INSERT INTO `liwu` VALUES ('69', '17', '17', '/css/Public/assets/images/gift9.png', '1', '1458219058', '1', '海洋之心');
INSERT INTO `liwu` VALUES ('70', '17', '17', '/css/Public/assets/images/gift9.png', '1', '1458219077', null, '海洋之心');
INSERT INTO `liwu` VALUES ('71', '18', '17', '/css/Public/assets/images/gift_8.png', '1', '1458219167', '1', '粉抱枕');
INSERT INTO `liwu` VALUES ('72', '17', '17', '/css/Public/assets/images/gift4.png', '-1', '1458293217', null, '爱心枕');
INSERT INTO `liwu` VALUES ('73', '17', '17', '/css/Public/assets/images/gift4.png', '-1', '1458293217', null, '爱心枕');
INSERT INTO `liwu` VALUES ('74', '17', '17', '/css/Public/assets/images/gift4.png', '-1', '1458293218', null, '爱心枕');
INSERT INTO `liwu` VALUES ('75', '17', '17', '/css/Public/assets/images/gift3.png', '-1', '1458293231', null, '爱心早餐');
INSERT INTO `liwu` VALUES ('76', '18', '17', '/css/Public/assets/images/gift4.png', '1', '1458293460', '1', '爱心枕');
INSERT INTO `liwu` VALUES ('77', '18', '17', '/css/Public/assets/images/gift3.png', '5', '1458293607', '1', '爱心早餐');
INSERT INTO `liwu` VALUES ('78', '41', '18', '/klzx/Public/assets/images/gift4.png', '1', '1458391742', null, '爱心枕');
INSERT INTO `liwu` VALUES ('79', '41', '18', '/klzx/Public/assets/images/gift9.png', '1', '1458391748', null, '海洋之心');
INSERT INTO `liwu` VALUES ('80', '44', '18', '/css/Public/assets/images/gift_8.png', '1', '1458611375', null, '粉抱枕');
INSERT INTO `liwu` VALUES ('81', '44', '18', '/css/Public/assets/images/gift10.png', '1', '1458611382', null, '金苹果');
INSERT INTO `liwu` VALUES ('82', '43', '17', '/klzx/Public/assets/images/gift5.png', '1', '1458612779', null, '彩虹伞');
INSERT INTO `liwu` VALUES ('83', '43', '17', '/klzx/Public/assets/images/gift6.png', '1', '1458612782', null, '敞篷跑车');
INSERT INTO `liwu` VALUES ('84', '17', '18', '/css/Public/assets/images/gift9.png', '1', '1458613102', null, '海洋之心');
INSERT INTO `liwu` VALUES ('85', '17', '18', '/css/Public/assets/images/gift_8.png', '1', '1458613114', null, '粉抱枕');
INSERT INTO `liwu` VALUES ('86', '17', '18', '/css/Public/assets/images/gift_8.png', '1', '1458613121', null, '粉抱枕');
INSERT INTO `liwu` VALUES ('87', '17', '18', '/css/Public/assets/images/gift_8.png', '1', '1458613130', null, '粉抱枕');
INSERT INTO `liwu` VALUES ('88', '17', '18', '/css/Public/assets/images/gift9.png', '1', '1458613135', null, '海洋之心');
INSERT INTO `liwu` VALUES ('89', '44', '43', '/klzx/Public/assets/images/gift3.png', '1', '1458710663', null, '爱心早餐');
INSERT INTO `liwu` VALUES ('90', '44', '43', '/klzx/Public/assets/images/gift4.png', '1', '1458710668', null, '爱心枕');
INSERT INTO `liwu` VALUES ('91', '44', '37', '/css/Public/assets/images/gift4.png', '5', '1458799822', null, '爱心枕');
INSERT INTO `liwu` VALUES ('92', '44', '37', '/css/Public/assets/images/gift2.png', '6', '1458799964', '1', '爱心天鹅');
INSERT INTO `liwu` VALUES ('93', '37', '44', '/css/Public/assets/images/gift6.png', '8', '1458800583', null, '敞篷跑车');
INSERT INTO `liwu` VALUES ('94', '43', '17', '/klzx/Public/assets/images/gift3.png', '1', '1458821061', null, '爱心早餐');
INSERT INTO `liwu` VALUES ('95', '43', '17', '/klzx/Public/assets/images/gift4.png', '1', '1458821066', null, '爱心枕');
INSERT INTO `liwu` VALUES ('96', '43', '17', '/klzx/Public/assets/images/gift5.png', '99999', '1458821100', null, '彩虹伞');
INSERT INTO `liwu` VALUES ('97', '22', '54', '/css/Public/assets/images/gift4.png', '1', '1458887726', null, '爱心枕');
INSERT INTO `liwu` VALUES ('98', '37', '43', '/klzx/Public/assets/images/gift5.png', '1', '1458902217', null, '彩虹伞');
INSERT INTO `liwu` VALUES ('99', '44', '38', '/klzx/Public/assets/images/gift3.png', '1', '1460000003', null, '爱心早餐');
INSERT INTO `liwu` VALUES ('100', '17', '38', '/klzx/Public/assets/images/gift5.png', '1', '1460000689', null, '彩虹伞');
INSERT INTO `liwu` VALUES ('101', '46', '43', '/klzx/Public/assets/images/gift5.png', '1', '1460156078', null, '彩虹伞');
INSERT INTO `liwu` VALUES ('102', '46', '43', '/klzx/Public/assets/images/gift3.png', '1', '1460156083', null, '爱心早餐');
INSERT INTO `liwu` VALUES ('103', '37', '17', '/css/Public/assets/images/gift3.png', '1', '1460194464', null, '爱心早餐');
INSERT INTO `liwu` VALUES ('104', '40', '54', '/klzx/Public/assets/images/gift6.png', '1', '1460204555', '1', '敞篷跑车');
INSERT INTO `liwu` VALUES ('105', '54', '40', '/klzx/Public/assets/images/gift10.png', '1', '1460204588', '1', '金苹果');
INSERT INTO `liwu` VALUES ('106', '40', '54', '/klzx/Public/assets/images/gift6.png', '1', '1460204649', '1', '敞篷跑车');
INSERT INTO `liwu` VALUES ('107', '54', '40', '/klzx/Public/assets/images/gift_8.png', '1', '1460204667', null, '粉抱枕');
INSERT INTO `liwu` VALUES ('108', '54', '40', '/klzx/Public/assets/images/gift9.png', '1', '1460204670', null, '海洋之心');
INSERT INTO `liwu` VALUES ('109', '54', '40', '/klzx/Public/assets/images/gift1.png', '1', '1460204675', null, '10克拉钻戒');
INSERT INTO `liwu` VALUES ('110', '54', '40', '/klzx/Public/assets/images/gift2.png', '1', '1460204678', null, '爱心天鹅');
INSERT INTO `liwu` VALUES ('111', '54', '40', '/klzx/Public/assets/images/gift3.png', '1', '1460204680', null, '爱心早餐');
INSERT INTO `liwu` VALUES ('112', '54', '40', '/klzx/Public/assets/images/gift4.png', '1', '1460204683', null, '爱心枕');
INSERT INTO `liwu` VALUES ('113', '37', '38', '/Public/assets/images/gift4.png', '2', '1460521815', null, '爱心枕');
INSERT INTO `liwu` VALUES ('114', '96', '95', '/klzx/Public/assets/images/gift5.png', '12', '1460616725', null, '彩虹伞');

-- ----------------------------
-- Table structure for lovestory
-- ----------------------------
DROP TABLE IF EXISTS `lovestory`;
CREATE TABLE `lovestory` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned DEFAULT NULL COMMENT '发布者id',
  `title` varchar(50) DEFAULT NULL,
  `content` text,
  `status` tinyint(3) unsigned DEFAULT '0' COMMENT '是否审核 未审核为0 审核为1',
  `pub_time` varchar(50) DEFAULT '' COMMENT '发布时间',
  `love_money` int(10) unsigned DEFAULT NULL COMMENT '消耗的恋爱币',
  PRIMARY KEY (`id`),
  KEY `uid_index` (`uid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lovestory
-- ----------------------------
INSERT INTO `lovestory` VALUES ('30', '54', '撒娇的福克斯的', '&lt;p&gt;发生的啥地方水电费卡死了都付款阿什是的杀毒看看啥地方&amp;nbsp;&lt;/p&gt;', '1', '1458886490', null);
INSERT INTO `lovestory` VALUES ('31', '37', '121212122', '&lt;p&gt;走过的路长了，遇见的人多了，经历的事杂了。不经意间发现，人生最曼妙的风景是内心的淡定与从容，头脑的睿智与清醒。人生最奢侈的拥有是一颗不老的童心，一个生生不息的信念，一个健康的身体，一个永远牵手的爱人。一个自由的心态，一份喜欢的工作，一份安稳的睡眠，一份享受生活的美好心情。&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/Uploads/201604/2016-04-01/1459501161608211.jpg&quot; style=&quot;&quot; title=&quot;1459501161608211.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/Uploads/201604/2016-04-01/1459501161135989.jpg&quot; style=&quot;&quot; title=&quot;1459501161135989.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/Uploads/201604/2016-04-01/1459501161612944.jpg&quot; style=&quot;&quot; title=&quot;1459501161612944.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/Uploads/201604/2016-04-01/1459501161396150.jpg&quot; style=&quot;&quot; title=&quot;1459501161396150.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '1', '1459501183', null);
INSERT INTO `lovestory` VALUES ('19', '21', '呃呃呃呃', '嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎', '1', '1457003063', null);
INSERT INTO `lovestory` VALUES ('26', '37', '陪伴是最长情的告白', '走过了人来人往\n不喜欢也得欣赏\n我是沉默的存在\n不当你世界 只作你肩膀\n拒绝成长到成长\n变成想要的模样\n在举手投降以前\n让我再陪你一段\n陪你把沿路感想活出了答案\n陪你把独自孤单变成了勇敢\n一次次失去又重来 我没离开\n陪伴是 最长情的告白\n陪你把想念的酸 拥抱成温暖\n陪你把彷徨 写出情节来\n未来多漫长 再漫长 还有期待\n陪伴你 一直到 故事给说完\n让我们静静分享\n此刻难得的坦白\n只是无声地交谈\n都感觉幸福 感觉不孤单\n陪你把沿路感想 活出了答案\n陪你把独自孤单 变成了勇敢\n一次次失去 又重来 我没离开\n陪伴是 最长情的告白\n陪你把想念的酸 拥抱成温暖\n陪你把彷徨 写出情节来\n未来多漫长 再漫长 还有期待\n陪伴你 一直到 故事给说完\n陪你把沿路感想 活出了答案\n陪你把独自孤单 变成了勇敢\n一次次失去 又重来 我没离开\n陪伴是 最长情的告白\n陪你把想念的酸 拥抱成温暖\n陪你把彷徨 写出情节来\n未来多漫长 再漫长 还有期待\n陪伴你 一直到 这故事说完', '1', '1458615560', null);
INSERT INTO `lovestory` VALUES ('21', '22', '的方法', '他说的分散', '1', '1457184944', null);
INSERT INTO `lovestory` VALUES ('22', '17', '失去你的无人可以替代', '东方会计师快递费访客了贷款是否开始的疯狂了深刻的法律的考试法律双方开始了的看法快递费苏打绿咖啡sfsskdflks；开始都快离开对方离开对方上岛咖啡；快递费的放开水电费老师看上岛咖啡打开看Y(^o^)YO(∩_∩)O哈哈~', '0', '1458012865', null);
INSERT INTO `lovestory` VALUES ('27', '38', '五枚金币', '有个叫阿巴格的人生活在内蒙古草原上。有一次，年少的阿巴格和他爸爸在草原上迷了路，阿巴格又累又怕，到最后快走不动了。\n\n爸爸就从兜里掏出5枚硬币，把一枚硬币埋在草地里，把其余4枚放在阿巴格的手上说，人生有5枚金币，童年、少年、青年、中年、老年各有一枚。\n\n你现在才用了一枚，就是埋在草地里的那一枚，你不能把5枚都扔在草原里，你要一点点地用，每一次都用出不同来，这样才不枉人生一世。\n\n今天我们一定要走出草原，你将来也一定要走出草原。世界很大，人活着，就要多走些地方，多看看，不要让你的金币没有用就扔掉。\n\n在父亲的鼓励下，那天阿巴格走出了草原。长大后，阿巴格离开了家乡，成了一名优秀的船长。  ', '1', '1458618350', null);
INSERT INTO `lovestory` VALUES ('28', '21', '测试成功故事', '生生世世是生生世世', '1', '1458636214', null);
INSERT INTO `lovestory` VALUES ('29', '21', '测试成功故事2', '生生世世是生生世世22222222222', '1', '1458636596', null);
INSERT INTO `lovestory` VALUES ('32', '44', '成功故事发布后金币有奖励没', '&lt;p&gt;成功故事发布后金币有奖励没成功故事发布后金币有奖励没成功故事发布后金币有奖励没成功故事发布后金币有奖励没&lt;/p&gt;', '1', '1459501268', null);
INSERT INTO `lovestory` VALUES ('33', '38', '写啥呢', '&lt;p&gt;这则故事 是测试前台 &amp;nbsp;后台故事内容展示的&lt;/p&gt;', '1', '1460022065', null);
INSERT INTO `lovestory` VALUES ('34', '43', '123', '&lt;p&gt;奖励十个金币659--669&lt;/p&gt;', '1', '1460164587', null);
INSERT INTO `lovestory` VALUES ('37', '37', '这个是查看后台有无记录奖励10金币', '&lt;p&gt;这个是查看后台有无记录奖励10金币这个是查看后台有无记录奖励10金币这个是查看后台有无记录奖励10金币这个是查看后台有无记录奖励10金币这个是查看后台有无记录奖励10金币这个是查看后台有无记录奖励10金币这个是查看后台有无记录奖励10金币这个是查看后台有无记录奖励10金币这个是查看后台有无记录奖励10金币&lt;/p&gt;&lt;p&gt;这个是查看后台有无记录奖励10金币这个是查看后台有无记录奖励10金币这个是查看后台有无记录奖励10金币这个是查看后台有无记录奖励10金币这个是查看后台有无记录奖励10金币这个是查看后台有无记录奖励10金币这个是查看后台有无记录奖励10金币&lt;/p&gt;&lt;p&gt;这个是查看后台有无记录奖励10金币这个是查看后台有无记录奖励10金币这个是查看后台有无记录奖励10金币这个是查看后台有无记录奖励10金币&lt;/p&gt;', '1', '1460427191', null);
INSERT INTO `lovestory` VALUES ('38', '37', '没有图片', '&lt;p&gt;这条故事不上传图片。。后台展示是否正常&lt;/p&gt;', '0', '1460427268', null);
INSERT INTO `lovestory` VALUES ('45', '21', 'ss ', '&lt;p&gt;是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是', '0', '1460606263', null);
INSERT INTO `lovestory` VALUES ('42', '98', '唉哎呀', '&lt;p&gt;11111&lt;/p&gt;', '0', '1460605938', null);
INSERT INTO `lovestory` VALUES ('43', '98', '唉哎呀', '&lt;p&gt;11111&lt;/p&gt;', '0', '1460605939', null);
INSERT INTO `lovestory` VALUES ('44', '98', 'again', '&lt;p&gt;每个人有每个人的故事，每个人有每个人的悲喜，这是一个宽容的城市，所有悲哀最终都将消逝，遇见爱请不要掩饰，用真心去体会它的快乐真实！每个人有每个人的故事，每个人有每个人的悲喜，这是一个宽容的城市，所有悲哀最终都将消逝，遇见爱请不要掩饰，用真心去体会它的快乐真实！每个人有每个人的故事，每个人有每个人的悲喜，这是一个宽容的城市，所有悲哀最终都将消逝，遇见爱请不要掩饰，用真心去体会它的快乐真实！每个人有每个人的故事，每个人有每个人的悲喜，这是一个宽容的城市，所有悲哀最终都将消逝，遇见爱请不要掩饰，用真心去体会它的快乐真实！每个人有每个人的故事，每个人有每个人的悲喜，这是一个宽容的城市，所有悲哀最终都将消逝，遇见爱请不要掩饰，用真心去体会它的快乐真实！每个人有每个人的故事，每个人有每个人的悲喜，这是一个宽容的城市，所有悲哀最终都将消逝，遇见爱请不要掩饰，用真心去体会它的快乐真实！每个人有每个人的故事，每个人有每个人的悲喜，这是一个宽容的城市，所有悲哀最终都将消逝，遇见爱请不要掩饰，用真心去体会它的快乐真实！每个人有每个人的故事，每个人有每个人的悲喜，这是一个宽容的城市，所有悲哀最终都将消逝，遇见爱请不要掩饰，用真心去体会它的快乐真实！每个人有每个人的故事，每个人有每个人的悲喜，这是一个宽容的城市，所有悲哀最终都将消逝，遇见爱请不要掩饰，用真心去体会它的快乐真实！&lt;/p&gt;&lt;p&gt;每个人有每个人的故事，每个人有每个人的悲喜，这是一个宽容的城市，所有悲哀最终都将消逝，遇见爱请不要掩饰，用真心去体会它的快乐真实！每个人有每个人的故事，每个人有每个人的悲喜，这是一个宽容的城市，所有悲哀最终都将消逝，遇见爱请不要掩饰，用真心去体会它的快乐真实！每个人有每个人的故&lt;/p&gt;', '0', '1460606090', null);
INSERT INTO `lovestory` VALUES ('46', '21', '说说', '&lt;p&gt;是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是是&lt;/p&gt;', '0', '1460608399', null);
INSERT INTO `lovestory` VALUES ('60', '44', '我是一个粉刷匠', '&lt;p&gt;我是一个粉刷匠，粉刷本领强&lt;/p&gt;&lt;p&gt;我要把那新房子，刷得很漂亮&lt;/p&gt;&lt;p&gt;我是一个粉刷匠，粉刷本领强&lt;/p&gt;&lt;p&gt;我要把那新房子，刷得很漂亮&lt;/p&gt;&lt;p&gt;我是一个粉刷匠，粉刷本领强&lt;/p&gt;&lt;p&gt;我要把那新房子，刷得很漂亮&lt;/p&gt;&lt;p&gt;我是一个粉刷匠，粉刷本领强&lt;/p&gt;&lt;p&gt;我要把那新房子，刷得很漂亮&lt;/p&gt;&lt;p&gt;我是一个粉刷匠，粉刷本领强&lt;/p&gt;&lt;p&gt;我要把那新房子，刷得很漂亮&lt;/p&gt;', '1', '1460707362', null);
INSERT INTO `lovestory` VALUES ('61', '38', '121212', '&lt;p&gt;我是一个粉刷匠，粉刷本领强&lt;br/&gt;我要把那新房子，刷得很漂亮&lt;br/&gt;我是一个粉刷匠，粉刷本领强&lt;/p&gt;', '1', '1460710607', null);
INSERT INTO `lovestory` VALUES ('63', '93', '大是大非', '&lt;p style=&quot;text-align: center;&quot;&gt;发生的啥地方啥地方sd&lt;/p&gt;', '0', '1460730435', null);
INSERT INTO `lovestory` VALUES ('64', '93', '对方水电费', '&lt;p&gt;是打发斯蒂芬发发生的给第三方的风格和给对方按地方噶地方个阿斯顿飞高点发斯蒂芬阿斯顿发送到发斯蒂芬阿斯蒂芬阿萨德嘎多舒服噶是打发撒旦发斯蒂芬爱啥啥的风格啥地方是打发点更好打发个啥打对方告诉地方噶啥地方噶啥地方撒大法师都干啥的归属地发生地方撒旦噶啥都干啥地方按时给第三方刚是大法官是大法官是大法官是大法官水哥按时到岗发的归属地飞哥df水电费水电费是&lt;span style=&quot;background-color: rgb(192, 80, 77);&quot;&gt;发送撒大法师啥地方撒大法师发生的啥地方爱是分散撒大法师&lt;/span&gt;发&lt;/p&gt;', '0', '1460730479', null);
INSERT INTO `lovestory` VALUES ('65', '93', '大概', '&lt;p style=&quot;text-align: center;&quot;&gt;撒大法师股份十多个是大法官大范甘迪风格大方是大法官大概三国杀对方归属地覆盖是大法官的分公司的公司的g 大概规范地方是大法官sdfg飞哥是大法官是否感受到反攻倒算大概dfg&lt;span style=&quot;color: rgb(255, 0, 0);&quot;&gt;大概大概水电费和规范dfgfkjasdlfj水平的分公司的分公司的飞哥&lt;/span&gt;的sdf&lt;/p&gt;', '0', '1460730527', null);
INSERT INTO `lovestory` VALUES ('58', '96', 'aaaa', '&lt;p&gt;sdsfsdfsdfdsfsdfsdfdsf&lt;/p&gt;', '1', '1460704062', null);
INSERT INTO `lovestory` VALUES ('48', '21', 'ss ', '&lt;p&gt;试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是&lt;/p&gt;', '1', '1460613039', null);
INSERT INTO `lovestory` VALUES ('50', '21', '是是是是是是', '&lt;p&gt;试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是&lt;/p&gt;', '0', '1460613528', null);
INSERT INTO `lovestory` VALUES ('57', '21', 'ss ', '&lt;p&gt;是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是是是是是是是是是是是是是是是是试试事实上试试事实上是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是是是是是试试事实上是是是试试事实上是是是是是是是是是是是是是是是是是是&lt;/p&gt;', '0', '1460703774', null);

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '说说id',
  `uid` int(10) unsigned NOT NULL COMMENT '发布者id',
  `pub_time` varchar(50) DEFAULT '' COMMENT '评论时间',
  `img_url` varchar(100) DEFAULT NULL,
  `love_money` int(10) unsigned DEFAULT NULL COMMENT '消费恋爱币',
  `title` varchar(50) DEFAULT '' COMMENT '标题',
  `description` varchar(200) DEFAULT '' COMMENT '描述',
  `content` varchar(1000) DEFAULT '' COMMENT '说说内容',
  `hits` int(10) unsigned DEFAULT '0' COMMENT '点击量',
  `hots` int(10) unsigned DEFAULT NULL COMMENT '点赞量',
  `m_status` tinyint(3) unsigned DEFAULT '0' COMMENT '是否审核通过 通过1',
  `is_show` tinyint(3) DEFAULT '1' COMMENT '显示当天发布的说说 0不显示',
  `is_tuikuan` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid_index` (`uid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('13', '21', '1457083845', null, '10', '', '', '但是计划单列市客户的看来是', '0', null, '1', '0', null);
INSERT INTO `message` VALUES ('14', '21', '1457084061', null, '8', '', '', '淡淡的淡淡的淡淡的淡淡的淡淡的', '0', null, '1', '0', null);
INSERT INTO `message` VALUES ('15', '21', '1457085530', null, '20', '', '', '到底等等等等等等等等等等等等等等等等的', '0', null, '1', '0', null);
INSERT INTO `message` VALUES ('16', '22', '1457160577', null, '30', '', '', '是打发斯蒂芬', '0', null, '1', '0', null);
INSERT INTO `message` VALUES ('36', '31', '1458204927', null, '39', '', '', '理科生的减肥快乐圣诞节 哈哈哈哈\n少得可怜减肥开始的减肥可加快了第三方', '0', null, '1', '0', null);
INSERT INTO `message` VALUES ('27', '18', '1457939695', null, '1', '', '', 'sdfsdf ', '0', null, '1', '0', null);
INSERT INTO `message` VALUES ('28', '18', '1457939824', null, '1', '', '', 'sdfsd', '0', null, '1', '0', null);
INSERT INTO `message` VALUES ('29', '18', '1457939840', null, '1', '', '', 'sdffffffffffffffffffffffsdf sdfssssssssssssfsdf sdffffffffffffffffsdf sdfsdf sdfffffffffff', '0', null, '1', '0', null);
INSERT INTO `message` VALUES ('34', '32', '1458196637', null, '100', '', '', '结婚了看见了', '0', null, '1', '0', null);
INSERT INTO `message` VALUES ('35', '32', '1458196805', null, '12', '', '', '455651', '0', null, '1', '0', null);
INSERT INTO `message` VALUES ('33', '32', '1458196561', null, '8', '', '', '就会看见快乐回家', '0', null, '1', '0', null);
INSERT INTO `message` VALUES ('32', '17', '1457944188', null, '1', '', '', 'http://127.0.0.1/css/index.php/Home/Index/search.html', '0', null, '1', '0', null);
INSERT INTO `message` VALUES ('37', '31', '1458205276', null, '1', '', '', '排位是正确的麽', '0', null, '1', '0', null);
INSERT INTO `message` VALUES ('38', '31', '1458206714', null, '0', '', '', '然而，在我们漫长的一生里，又会遇见几个懂自己的人，就算是遇见了，又会有几个真正愿意懂自己的。', '0', null, '0', '1', null);
INSERT INTO `message` VALUES ('39', '31', '1458206953', null, '20', '', '', '没有任何一个女人可以单靠美貌赢得男人的尊重，但也没有任何女人可素面朝天赢得男人的欣赏，更没有一个女人能不加修饰就能与岁月抗衡，聪明的女人总是懂得内外兼修，没有自然美，只有美得自然。美不完全是为了取悦别人，其实更是尊重自己，因为你比你想象的更为重要。\n\n这个是测试网站币退回滴', '0', null, '1', '0', null);
INSERT INTO `message` VALUES ('40', '31', '1458207128', null, '0', '', '', '45645312313', '0', null, '1', '0', null);
INSERT INTO `message` VALUES ('41', '17', '1458271348', null, '5', '', '', '水电费水电费是', '0', null, '1', '0', null);
INSERT INTO `message` VALUES ('44', '21', '1458540069', null, '1', '', '', '测试说说：啊哈哈哈哈哈哈哈', '0', null, '1', '0', null);
INSERT INTO `message` VALUES ('45', '17', '1458545140', null, '1000', '', '', '测试恋爱币', '0', null, '1', '0', '1');
INSERT INTO `message` VALUES ('46', '21', '1458545514', null, '1000', '', '', '测试退款', '0', null, '1', '0', '1');
INSERT INTO `message` VALUES ('49', '37', '1458635278', null, '10', '', '', '世间的感情莫过于两种：一种是相濡以沫，却厌倦到终老；另一种是相忘于江湖，却怀念到哭泣。', '0', null, '0', '1', '1');
INSERT INTO `message` VALUES ('50', '21', '1458638317', null, '1', '', '', '1111', '0', null, '1', '0', '0');
INSERT INTO `message` VALUES ('51', '43', '1458704485', null, '1', '', '', '过后还是感觉就像饺子', '0', null, '1', '0', '1');
INSERT INTO `message` VALUES ('52', '43', '1458704497', null, '1', '', '', '回家看看星空星空哭着哭着哭着看看这款', '0', null, '1', '0', '1');
INSERT INTO `message` VALUES ('53', '37', '1458713658', null, '92', '', '', '21212121212', '0', null, '1', '0', '0');
INSERT INTO `message` VALUES ('54', '37', '1458713954', null, '10', '', '', '只发布文字，没有图片。。。', '0', null, '1', '0', '0');
INSERT INTO `message` VALUES ('55', '37', '1458801900', null, '10', '', '', '不用说不用问   就明白就了解  ', '0', null, '1', '0', '0');
INSERT INTO `message` VALUES ('56', '44', '1458802389', null, '15', '', '', '一颗心 一个人 一段情 ；离开了 错过了 后悔了；\n再爱了 重复着 反复了 ；\n爱情不过来来往往重复所经历的；\n不过角色变了  配角变成了主角', '0', null, '0', '1', '0');
INSERT INTO `message` VALUES ('57', '37', '1458804998', null, '20', '', '', '你改变不了环境，但你可以改变自己；你改变不了事实，但你可以改变态度；你改变不了过去，但你可以改变现在；你不能控制他人，但你可以掌握自己；你不能预知明天，但你可以把握今天；你不可以样样顺利，但你可以事事尽心；你不能延伸生命的长度，但你可以决定生命的宽度。', '0', null, '1', '0', '0');
INSERT INTO `message` VALUES ('58', '44', '1458806443', null, '10', '', '', '先审核说说，再审核图片，查看互动专区列表、说说列表展示问题', '0', null, '1', '0', '0');
INSERT INTO `message` VALUES ('59', '38', '1458806506', null, '15', '', '', '这个说说是用来测试排名的', '0', null, '1', '0', '0');
INSERT INTO `message` VALUES ('70', '37', '1459500229', null, '30', '', '', '有个叫阿巴格的人生活在内蒙古草原上。有一次，年少的阿巴格和他爸爸在草原上迷了路，阿巴格又累又怕，到最后快走不动了。 爸爸就从兜里掏出5枚硬币，把一枚硬币埋在草地里，把其余4枚放在阿巴格的手上说，人生有5枚金币，童年、少年、青年、中年、老年各有一枚。 你现在才用了一枚，就是埋在草地里的那一枚，你不能把5枚都扔在草原里，你要一点点地用，每一次都用出不同来，这样才不枉人生一世。 今天我们一定要走出草原，你将来也一定要走出草原。世界很大，人活着，就要多走些地方，多看看，不要让你的金币没有用就扔掉。 在父亲的鼓励下，那天阿巴格走出了草原。长大后，阿巴格离开了家乡，成了一名优秀的船长。', '0', null, '1', '0', '0');
INSERT INTO `message` VALUES ('69', '44', '1459495319', null, '23', '', '', '说点啥呢，说点啥呢，说点啥呢，说点啥呢，说点啥呢，说点啥呢，', '0', null, '1', '0', '0');
INSERT INTO `message` VALUES ('68', '37', '1459321374', null, '10', '', '', '淡淡的忧愁。。。。。', '0', null, '0', '1', '0');
INSERT INTO `message` VALUES ('71', '37', '1459500291', null, '5', '', '', '我只是测试列表展示的。。', '0', null, '1', '0', '0');
INSERT INTO `message` VALUES ('72', '44', '1459500389', null, '5', '', '', '查看说说排位哈。。。', '0', null, '1', '0', '0');
INSERT INTO `message` VALUES ('77', '37', '1459837507', null, '10', '', '', '20150405发一篇说说', '0', null, '1', '1', '0');
INSERT INTO `message` VALUES ('73', '43', '1459501204', null, '1', '', '', 'wqeqweqweqweqwe', '0', null, '1', '1', '0');
INSERT INTO `message` VALUES ('74', '37', '1459503383', null, '5', '', '', '再花5金币', '0', null, '1', '0', '0');
INSERT INTO `message` VALUES ('75', '44', '1459503562', null, '5', '', '', '55555', '0', null, '1', '0', '0');
INSERT INTO `message` VALUES ('76', '37', '1459503976', null, '1', '', '', '多图片查看', '0', null, '0', '1', '0');
INSERT INTO `message` VALUES ('78', '38', '1459837772', null, '10', '', '', '20160405，下午14：32，花10金币发布一条说说', '0', null, '1', '1', '0');
INSERT INTO `message` VALUES ('79', '44', '1459837825', null, '20', '', '', '这个是20金币的说说', '0', null, '1', '1', '0');
INSERT INTO `message` VALUES ('80', '71', '1459843843', null, '20', '', '', '新用户签到。。。。', '0', null, '0', '1', '0');
INSERT INTO `message` VALUES ('81', '44', '1459923862', null, '15', '', '', '发条说说，只是测试排序问题哈。。。', '0', null, '0', '1', '0');
INSERT INTO `message` VALUES ('82', '37', '1460020048', null, '6', '', '', 'everythingeverythingeverythingeverythingeverythingeverythingeverythingeverythingeverythingeverythingeverythingeverything', '0', null, '1', '1', '0');
INSERT INTO `message` VALUES ('83', '37', '1460020662', null, '5', '', '', '2016年4月7日 17：18分发布的说说：用来测试说说列表中排序是否正确2016年4月7日 17：18分发布的说说：用来测试说说列表中排序是否正确', '0', null, '1', '1', '0');
INSERT INTO `message` VALUES ('84', '38', '1460020723', null, '5', '', '', '2016年4月7日 17：19分发布的说说：这个是测试后台说说审核列表排序是否正确，同样花5金币', '0', null, '0', '1', '1');
INSERT INTO `message` VALUES ('85', '37', '1460020811', null, '4', '', '', '17：20分发布一条说说：5金币，不审核 ，后台是否自动退款；当前剩余金币为40700', '0', null, '0', '1', '1');
INSERT INTO `message` VALUES ('86', '37', '1460081615', null, '4', '', '', '10.14发布的说说：批量审核一', '0', null, '1', '1', '0');
INSERT INTO `message` VALUES ('87', '38', '1460081679', null, '6', '', '', '10.14发布这条说说，测试批量审核。。。10.14发布这条说说，测试批量审核。。。10.14发布这条说说，测试批量审核。。。10.14发布这条说说，测试批量审核。。。', '0', null, '1', '1', '0');
INSERT INTO `message` VALUES ('88', '38', '1460082093', null, '2', '', '', '当前金币8962，再发一条说说扣除2金币后，后台测试批量退款，能否退成功', '0', null, '1', '1', '0');
INSERT INTO `message` VALUES ('89', '44', '1460083094', null, '5', '', '', '10.37发布说说（5金币）：测试后台批量退款，当前扣除后剩余金币3870', '0', null, '1', '1', '0');
INSERT INTO `message` VALUES ('90', '37', '1460083135', null, '5', '', '', '10.39说说：5金币，测试后台批量退款', '0', null, '1', '1', '0');
INSERT INTO `message` VALUES ('91', '54', '1460110293', null, '1', '', '', '是打发斯蒂芬就开始对方', '0', null, '1', '1', '0');
INSERT INTO `message` VALUES ('92', '54', '1460110303', null, '1', '', '', '是打发斯蒂芬就开始对方', '0', null, '1', '1', '0');
INSERT INTO `message` VALUES ('100', '54', '1460204402', null, '1', '', '', '嗨，大家好、', '0', null, '1', '1', '0');
INSERT INTO `message` VALUES ('101', '54', '1460205039', null, '1', '', '', '就好像八九十开吧肯定不及时报道vcmnsbdhdfjwreghduiwheuifh', '0', null, '1', '1', '0');
INSERT INTO `message` VALUES ('99', '43', '1460166697', null, '1', '', '', '说点什么', '0', null, '1', '1', '0');
INSERT INTO `message` VALUES ('102', '37', '1460355562', null, '10', '', '', '这条说说是测试发布的时间及评论时间的', '0', null, '1', '1', '0');
INSERT INTO `message` VALUES ('105', '37', '1460428903', null, '1', '', '', '不必羡慕别人的精彩 你要活得自在不必羡慕别人的精彩 你要活得自在不必羡慕别人的精彩 你要活得自在不必羡慕别人的精彩 你要活得自在', '0', null, '1', '1', '0');
INSERT INTO `message` VALUES ('117', '38', '1460527319', null, '50', '', '', '发生的发生', '0', null, '1', '1', '0');
INSERT INTO `message` VALUES ('118', '43', '1460527718', null, '1', '', '', '说点什么呢', '0', null, '0', '1', '0');
INSERT INTO `message` VALUES ('119', '80', '1460527854', null, '100', '', '', '岁月是朵两生花岁月是朵两生花岁月是朵两生花岁月是朵两生花岁月是朵两生花岁月是朵两生花岁月是朵两生花岁月是朵两生花岁月是朵两生花', '0', null, '1', '1', '0');
INSERT INTO `message` VALUES ('123', '95', '1460616161', null, '20', '', '', '走过的路长了，遇见的人多了，经历的事杂了。不经意间发现，人生最曼妙的风景是内心的淡定与从容，头脑的睿智与清醒。人生最奢侈的拥有是一颗不老的童心，一个生生不息的信念，一个健康的身体，一个永远牵手的爱人。一个自由的心态，一份喜欢的工作，一份安稳的睡眠，一份享受生活的美好心情。', '0', null, '0', '1', '0');
INSERT INTO `message` VALUES ('122', '95', '1460597854', null, '30', '', '', '刚刚充值啦，有钱啦', '0', null, '1', '1', '0');
INSERT INTO `message` VALUES ('120', '43', '1460528902', null, '1', '', '', '说些什么呢，我想看看评论', '0', null, '1', '1', '0');
INSERT INTO `message` VALUES ('121', '38', '1460535377', null, '1', '', '', '发送的快捷方式；sj', '0', null, '0', '1', '0');
INSERT INTO `message` VALUES ('124', '96', '1460616441', null, '35', '', '', '风趣的围巾风趣的围巾风趣的围巾风趣的围巾', '0', null, '1', '1', '0');
INSERT INTO `message` VALUES ('125', '96', '1460617208', null, '10', '', '', 'piliangshenheyoumeiyouyongha....piliangshenheyoumeiyouyongha', '0', null, '1', '1', '0');
INSERT INTO `message` VALUES ('126', '95', '1460617241', null, '8', '', '', 'zailaiyipian  ceshiceshi  piliangshenhe  hahahahah', '0', null, '0', '1', '0');
INSERT INTO `message` VALUES ('127', '21', '1460684564', null, '1', '', '', '试试事实上', '0', null, '0', '1', '0');
INSERT INTO `message` VALUES ('128', '21', '1460684596', null, '1', '', '', '试试事实上是是是', '0', null, '0', '1', '0');

-- ----------------------------
-- Table structure for money
-- ----------------------------
DROP TABLE IF EXISTS `money`;
CREATE TABLE `money` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `time` varchar(13) DEFAULT '',
  `money` int(11) DEFAULT NULL,
  `phone` varchar(50) DEFAULT '' COMMENT '手机或者邮箱',
  `tuikuan_money` int(11) unsigned DEFAULT NULL,
  `tuikuan_time` varchar(13) DEFAULT '' COMMENT '退款时间',
  `jiangli_time` varchar(13) DEFAULT '' COMMENT '奖励时间',
  `jiangli_money` int(11) unsigned DEFAULT NULL,
  `info` varchar(600) DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=863 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of money
-- ----------------------------
INSERT INTO `money` VALUES ('58', '21', '1459256287', '-11', '18874968273', null, '', '', null, null);
INSERT INTO `money` VALUES ('59', '21', '1459261327', '-20', '18874968273', null, '', '', null, null);
INSERT INTO `money` VALUES ('60', '21', '1459261753', '-22', '18874968273', null, '', '', null, null);
INSERT INTO `money` VALUES ('61', '21', '1459304211', '-1', '18874968273', null, '', '', null, null);
INSERT INTO `money` VALUES ('81', '21', '', null, '18874968273', '10', '1459603383', '', null, null);
INSERT INTO `money` VALUES ('82', '44', '', null, '15116317831', '15', '1459603383', '', null, null);
INSERT INTO `money` VALUES ('85', '21', '', null, '18874968273', null, '', '1459609845', '1', null);
INSERT INTO `money` VALUES ('88', '21', '', null, '18874968273', null, '', '1459820061', '1', null);
INSERT INTO `money` VALUES ('89', '37', '', null, '15116341580', null, '', '1459820929', '1', null);
INSERT INTO `money` VALUES ('90', '44', '', null, '15116317831', null, '', '1459822080', '1', null);
INSERT INTO `money` VALUES ('91', '47', '1459824075', '1', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('92', '43', '1459824672', '1', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('93', '37', '1459827504', '1', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('94', '54', '', null, '15616945256', null, '', '1459834845', '1', null);
INSERT INTO `money` VALUES ('95', '37', '1459837508', '-10', '15116341580', null, '', '', null, null);
INSERT INTO `money` VALUES ('96', '38', '1459837772', '-10', '15084750628', null, '', '', null, null);
INSERT INTO `money` VALUES ('97', '44', '1459837825', '-20', '15116317831', null, '', '', null, null);
INSERT INTO `money` VALUES ('98', '71', '1459843843', '-20', null, null, '', '', null, null);
INSERT INTO `money` VALUES ('99', '37', '1459850099', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('100', '37', '', null, '15116341580', null, '', '1459904405', '1', null);
INSERT INTO `money` VALUES ('101', '71', '', null, null, null, '', '1459905782', '1', null);
INSERT INTO `money` VALUES ('102', '17', '', null, '15616945257', null, '', '1459906241', '1', null);
INSERT INTO `money` VALUES ('103', '44', '', null, '15116317831', null, '', '1459923800', '1', null);
INSERT INTO `money` VALUES ('104', '44', '1459923862', '-15', '15116317831', null, '', '', null, null);
INSERT INTO `money` VALUES ('105', '47', '', null, '15111455509', null, '', '1459928886', '1', null);
INSERT INTO `money` VALUES ('106', '43', '', null, '17751556218', null, '', '1459933624', '1', null);
INSERT INTO `money` VALUES ('107', '43', '1459937429', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('108', '43', '1459937466', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('109', '43', '1459937481', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('110', '43', '1459937514', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('111', '43', '1459937698', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('112', '43', '1459938433', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('113', '43', '1459938525', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('114', '43', '1459938529', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('115', '43', '1459940302', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('116', '43', '1459940345', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('117', '43', '1459940397', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('118', '43', '1459940488', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('119', '47', '', null, '15111455509', null, '', '1459987476', '1', null);
INSERT INTO `money` VALUES ('120', '37', '', null, '15116341580', null, '', '1459991210', '1', null);
INSERT INTO `money` VALUES ('121', '44', '', null, '15116317831', null, '', '1459991877', '1', null);
INSERT INTO `money` VALUES ('122', '37', '1459992649', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('123', '44', '1459992794', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('124', '17', '', null, '15616945257', null, '', '1459992864', '1', null);
INSERT INTO `money` VALUES ('125', '17', '1459992962', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('126', '54', '', null, '15616945256', null, '', '1459993019', '1', null);
INSERT INTO `money` VALUES ('127', '54', '1459993381', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('128', '21', '1459993546', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('129', '17', '1459993467', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('130', '21', '1459993567', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('131', '21', '', null, '18874968273', null, '', '1459994355', '1', null);
INSERT INTO `money` VALUES ('132', '44', '1459994410', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('133', '37', '1459994441', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('134', '38', '1460000003', '-1', '15084750628', null, '', '', null, null);
INSERT INTO `money` VALUES ('135', '38', '1460000689', '-1', '15084750628', null, '', '', null, null);
INSERT INTO `money` VALUES ('136', '37', '1460010852', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('137', '37', '1460020048', '-6', '15116341580', null, '', '', null, null);
INSERT INTO `money` VALUES ('138', '37', '1460020662', '-5', '15116341580', null, '', '', null, null);
INSERT INTO `money` VALUES ('139', '38', '1460020723', '-5', '15084750628', null, '', '', null, null);
INSERT INTO `money` VALUES ('140', '37', '1460020811', '-4', '15116341580', null, '', '', null, null);
INSERT INTO `money` VALUES ('141', '37', '', null, '15116341580', null, '', '1460080080', '1', null);
INSERT INTO `money` VALUES ('142', '17', '', null, '15616945257', null, '', '1460080186', '1', null);
INSERT INTO `money` VALUES ('143', '38', '', null, '15084750628', '5', '1460081325', '', null, null);
INSERT INTO `money` VALUES ('144', '37', '', null, '15116341580', '4', '1460081325', '', null, null);
INSERT INTO `money` VALUES ('145', '37', '1460081615', '-4', '15116341580', null, '', '', null, null);
INSERT INTO `money` VALUES ('146', '38', '1460081679', '-6', '15084750628', null, '', '', null, null);
INSERT INTO `money` VALUES ('147', '44', '', null, '15116317831', null, '', '1460081844', '1', null);
INSERT INTO `money` VALUES ('148', '38', '1460082093', '-2', '15084750628', null, '', '', null, null);
INSERT INTO `money` VALUES ('149', '44', '1460083094', '-5', '15116317831', null, '', '', null, null);
INSERT INTO `money` VALUES ('150', '37', '1460083135', '-5', '15116341580', null, '', '', null, null);
INSERT INTO `money` VALUES ('151', '38', '', null, '15084750628', null, '', '1460083751', '1', null);
INSERT INTO `money` VALUES ('152', '43', '', null, '17751556218', null, '', '1460084018', '1', null);
INSERT INTO `money` VALUES ('153', '44', '1460084067', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('154', '38', '1460084103', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('155', '37', '1460084285', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('156', '38', '1460094541', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('157', '47', '', null, '15111455509', null, '', '1460094923', '1', null);
INSERT INTO `money` VALUES ('158', '37', '1460095206', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('159', '44', '1460095234', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('160', '38', '1460095264', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('161', '39', '', null, '15616945288', null, '', '1460095320', '1', null);
INSERT INTO `money` VALUES ('162', '39', '1460095438', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('163', '40', '', null, '15616945333', null, '', '1460095690', '1', null);
INSERT INTO `money` VALUES ('164', '40', '1460095706', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('165', '40', '1460095791', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('166', '75', '1460096096', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('167', '41', '', null, '15111455555', null, '', '1460096240', '1', null);
INSERT INTO `money` VALUES ('168', '75', '1460097240', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('169', '41', '1460097268', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('170', '71', '', null, '18163674116', null, '', '1460097891', '1', null);
INSERT INTO `money` VALUES ('171', '71', '1460098355', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('172', '40', '1460098948', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('173', '39', '1460099240', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('174', '44', '1460099616', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('175', '17', '1460099817', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('176', '37', '1460099946', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('177', '17', '1460099967', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('178', '21', '', null, '18874968273', null, '', '1460099979', '1', null);
INSERT INTO `money` VALUES ('179', '44', '1460100216', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('180', '44', '1460100246', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('181', '38', '1460100290', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('182', '21', '1460100322', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('183', '38', '1460100492', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('184', '38', '1460100588', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('185', '21', '1460100605', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('186', '54', '', null, '15616945256', null, '', '1460108495', '1', null);
INSERT INTO `money` VALUES ('187', '54', '1460110294', '-1', '15616945256', null, '', '', null, null);
INSERT INTO `money` VALUES ('188', '54', '1460110304', '-1', '15616945256', null, '', '', null, null);
INSERT INTO `money` VALUES ('189', '43', '1460113220', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('190', '43', '', null, '17751556218', null, '', '1460152161', '1', null);
INSERT INTO `money` VALUES ('191', '47', '', null, '15111455509', null, '', '1460153845', '1', null);
INSERT INTO `money` VALUES ('192', '43', '1460154039', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('193', '43', '1460156078', '-1', '17751556218', null, '', '', null, null);
INSERT INTO `money` VALUES ('194', '43', '1460156083', '-1', '17751556218', null, '', '', null, null);
INSERT INTO `money` VALUES ('195', '43', '1460157264', '-1', '17751556218', null, '', '', null, null);
INSERT INTO `money` VALUES ('196', '43', '1460158630', '-1', '17751556218', null, '', '', null, null);
INSERT INTO `money` VALUES ('197', '43', '1460158813', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('198', '43', '1460161815', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('199', '43', '1460161966', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('200', '43', '1460164530', '-1', '17751556218', null, '', '', null, null);
INSERT INTO `money` VALUES ('201', '43', '1460165184', '-10000', '17751556218', null, '', '', null, null);
INSERT INTO `money` VALUES ('202', '43', '1460165200', '-777', '17751556218', null, '', '', null, null);
INSERT INTO `money` VALUES ('203', '43', '1460166564', '-50', '17751556218', null, '', '', null, null);
INSERT INTO `money` VALUES ('204', '43', '1460166697', '-1', '17751556218', null, '', '', null, null);
INSERT INTO `money` VALUES ('205', '43', '1460169412', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('206', '46', '1460170100', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('207', '43', '1460181145', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('208', '17', '', null, '15616945257', null, '', '1460181706', '1', null);
INSERT INTO `money` VALUES ('209', '37', '', null, '15116341580', null, '', '1460186114', '1', null);
INSERT INTO `money` VALUES ('210', '37', '1460186125', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('211', '37', '1460186700', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('212', '37', '1460186863', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('213', '37', '1460186915', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('214', '44', '', null, '15116317831', null, '', '1460188185', '1', null);
INSERT INTO `money` VALUES ('215', '44', '1460189220', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('216', '38', '', null, '15084750628', null, '', '1460190228', '1', null);
INSERT INTO `money` VALUES ('217', '38', '1460190319', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('218', '54', '', null, '15616945256', null, '', '1460190492', '1', null);
INSERT INTO `money` VALUES ('219', '17', '1460194464', '-1', '15616945257', null, '', '', null, null);
INSERT INTO `money` VALUES ('220', '44', '1460199614', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('221', '38', '1460199701', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('222', '44', '1460199752', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('223', '54', '1460204234', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('224', '40', '', null, '15616945333', null, '', '1460204261', '1', null);
INSERT INTO `money` VALUES ('225', '40', '1460204270', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('226', '54', '1460204402', '-1', '15616945256', null, '', '', null, null);
INSERT INTO `money` VALUES ('227', '54', '1460204555', '-1', '15616945256', null, '', '', null, null);
INSERT INTO `money` VALUES ('228', '40', '1460204588', '-1', '15616945333', null, '', '', null, null);
INSERT INTO `money` VALUES ('229', '54', '1460204649', '-1', '15616945256', null, '', '', null, null);
INSERT INTO `money` VALUES ('230', '40', '1460204667', '-1', '15616945333', null, '', '', null, null);
INSERT INTO `money` VALUES ('231', '40', '1460204670', '-1', '15616945333', null, '', '', null, null);
INSERT INTO `money` VALUES ('232', '40', '1460204675', '-1', '15616945333', null, '', '', null, null);
INSERT INTO `money` VALUES ('233', '40', '1460204678', '-1', '15616945333', null, '', '', null, null);
INSERT INTO `money` VALUES ('234', '40', '1460204680', '-1', '15616945333', null, '', '', null, null);
INSERT INTO `money` VALUES ('235', '40', '1460204683', '-1', '15616945333', null, '', '', null, null);
INSERT INTO `money` VALUES ('236', '54', '1460205039', '-1', '15616945256', null, '', '', null, null);
INSERT INTO `money` VALUES ('237', '39', '', null, '15616945288', null, '', '1460208809', '1', null);
INSERT INTO `money` VALUES ('238', '39', '1460208821', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('239', '39', '1460208839', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('240', '37', '1460209593', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('241', '44', '1460209690', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('242', '41', '', null, '15111455555', null, '', '1460209738', '1', null);
INSERT INTO `money` VALUES ('243', '41', '1460209752', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('244', '71', '', null, '18163674116', null, '', '1460209841', '1', null);
INSERT INTO `money` VALUES ('245', '71', '1460209851', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('246', '40', '1460211720', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('247', '40', '1460211747', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('248', '39', '1460212502', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('249', '54', '', null, '15616945256', null, '', '1460267887', '1', null);
INSERT INTO `money` VALUES ('250', '43', '1460268317', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('251', '37', '', null, '15116341580', null, '', '1460337477', '1', null);
INSERT INTO `money` VALUES ('252', '38', '', null, '15084750628', null, '', '1460338179', '1', null);
INSERT INTO `money` VALUES ('253', '38', '1460338246', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('254', '47', '', null, '15111455509', null, '', '1460338599', '1', null);
INSERT INTO `money` VALUES ('255', '88', '', null, '783324154@qq.com', null, '', '1460340065', '1', null);
INSERT INTO `money` VALUES ('256', '37', '1460341520', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('257', '38', '1460341750', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('258', '75', '', null, '350700223@qq.com', null, '', '1460342906', '1', null);
INSERT INTO `money` VALUES ('259', '37', '1460344645', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('260', '38', '1460344669', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('261', '37', '1460345001', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('262', '38', '1460345028', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('263', '75', '1460345591', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('264', '54', '', null, '15616945256', null, '', '1460346362', '1', null);
INSERT INTO `money` VALUES ('265', '38', '1460355290', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('266', '37', '1460355562', '-10', '15116341580', null, '', '', null, null);
INSERT INTO `money` VALUES ('267', '47', '1460355885', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('268', '38', '1460356269', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('269', '47', '1460356285', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('270', '47', '1460357136', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('271', '38', '1460357330', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('272', '37', '1460357366', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('273', '47', '1460358071', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('274', '37', '1460358199', '-5', '15116341580', null, '', '', null, null);
INSERT INTO `money` VALUES ('275', '37', '1460358309', '-10', '15116341580', null, '', '', null, null);
INSERT INTO `money` VALUES ('276', '47', '1460358662', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('277', '38', '1460359432', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('278', '43', '', null, '17751556218', null, '', '1460361244', '1', null);
INSERT INTO `money` VALUES ('279', '44', '', null, '15116317831', null, '', '1460361341', '1', null);
INSERT INTO `money` VALUES ('280', '44', '1460361358', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('281', '44', '1460361476', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('282', '54', '1460362103', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('283', '44', '1460362114', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('284', '47', '1460362122', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('285', '21', '', null, '18874968273', null, '', '1460362177', '1', null);
INSERT INTO `money` VALUES ('286', '21', '1460362196', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('287', '37', '1460363975', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('288', '21', '1460364286', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('289', '44', '1460364304', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('290', '47', '1460364311', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('291', '47', '1460365890', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('292', '37', '1460366142', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('293', '75', '1460366219', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('294', '38', '1460366313', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('295', '91', '', null, '13611740593', null, '', '1460366316', '1', null);
INSERT INTO `money` VALUES ('296', '39', '', null, '15616945288', null, '', '1460366785', '1', null);
INSERT INTO `money` VALUES ('297', '39', '1460366828', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('298', '40', '', null, '15616945333', null, '', '1460366923', '1', null);
INSERT INTO `money` VALUES ('299', '80', '', null, '602050873@qq.com', null, '', '1460368207', '1', null);
INSERT INTO `money` VALUES ('300', '47', '1460375828', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('301', '46', '', null, '18921896638', null, '', '1460383530', '1', null);
INSERT INTO `money` VALUES ('302', '37', '', null, '15116341580', null, '', '1460423536', '1', null);
INSERT INTO `money` VALUES ('303', '38', '', null, '15084750628', null, '', '1460424006', '1', null);
INSERT INTO `money` VALUES ('304', '44', '', null, '15116317831', null, '', '1460424359', '1', null);
INSERT INTO `money` VALUES ('305', '75', '', null, '350700223@qq.com', null, '', '1460424420', '1', null);
INSERT INTO `money` VALUES ('306', '47', '', null, '15111455509', null, '', '1460425186', '1', null);
INSERT INTO `money` VALUES ('307', '37', '1460425503', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('308', '44', '1460425715', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('309', '75', '1460425961', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('310', '88', '', null, '783324154@qq.com', null, '', '1460426723', '1', null);
INSERT INTO `money` VALUES ('311', '37', '', null, '', null, '', '1460427308', '10', null);
INSERT INTO `money` VALUES ('312', '17', '', null, '15616945257', null, '', '1460428646', '1', null);
INSERT INTO `money` VALUES ('313', '37', '1460428903', '-1', '15116341580', null, '', '', null, null);
INSERT INTO `money` VALUES ('314', '75', '1460441840', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('315', '44', '1460441877', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('316', '39', '', null, '15616945288', null, '', '1460441933', '1', null);
INSERT INTO `money` VALUES ('317', '40', '', null, '15616945333', null, '', '1460442008', '1', null);
INSERT INTO `money` VALUES ('318', '37', '1460442025', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('319', '39', '1460442123', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('320', '40', '1460442202', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('321', '38', '1460442268', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('322', '80', '', null, '602050873@qq.com', null, '', '1460442428', '1', null);
INSERT INTO `money` VALUES ('323', '80', '1460442842', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('324', '38', '1460443181', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('325', '75', '1460443387', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('326', '39', '1460443714', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('327', '39', '1460443759', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('328', '44', '1460443767', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('329', '38', '1460443950', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('330', '75', '1460444268', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('331', '44', '1460446500', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('332', '33', '', null, '18711034930', null, '', '1460446668', '1', null);
INSERT INTO `money` VALUES ('333', '75', '1460446736', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('334', '33', '1460446869', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('335', '33', '1460447070', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('336', '37', '1460447098', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('337', '38', '1460447285', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('338', '39', '1460447566', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('339', '46', '', null, '18921896638', null, '', '1460455628', '1', null);
INSERT INTO `money` VALUES ('340', '46', '1460465353', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('341', '46', '1460466234', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('342', '21', '', null, '18874968273', null, '', '1460467809', '1', null);
INSERT INTO `money` VALUES ('343', '46', '1460469816', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('344', '43', '', null, '17751556218', null, '', '1460470015', '1', null);
INSERT INTO `money` VALUES ('345', '46', '', null, '18921896638', null, '', '1460506411', '1', null);
INSERT INTO `money` VALUES ('346', '21', '', null, '18874968273', null, '', '1460510237', '1', null);
INSERT INTO `money` VALUES ('347', '37', '', null, '15116341580', null, '', '1460511292', '1', null);
INSERT INTO `money` VALUES ('348', '38', '', null, '15084750628', null, '', '1460516912', '1', null);
INSERT INTO `money` VALUES ('349', '38', '1460516925', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('350', '44', '', null, '15116317831', null, '', '1460517005', '1', null);
INSERT INTO `money` VALUES ('351', '75', '', null, '350700223@qq.com', null, '', '1460517127', '1', null);
INSERT INTO `money` VALUES ('352', '75', '1460517144', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('353', '54', '', null, '15616945256', null, '', '1460517267', '1', null);
INSERT INTO `money` VALUES ('354', '40', '', null, '15616945333', null, '', '1460517381', '1', null);
INSERT INTO `money` VALUES ('355', '17', '', null, '15616945257', null, '', '1460517542', '1', null);
INSERT INTO `money` VALUES ('356', '47', '', null, '15111455509', null, '', '1460518262', '1', null);
INSERT INTO `money` VALUES ('357', '38', '1460519111', '-1', '15084750628', null, '', '', null, null);
INSERT INTO `money` VALUES ('358', '38', '1460519161', '-1', '15084750628', null, '', '', null, null);
INSERT INTO `money` VALUES ('359', '38', '1460519175', '-1', '15084750628', null, '', '', null, null);
INSERT INTO `money` VALUES ('360', '38', '1460519190', '-1', '15084750628', null, '', '', null, null);
INSERT INTO `money` VALUES ('361', '38', '1460519204', '-1', '15084750628', null, '', '', null, null);
INSERT INTO `money` VALUES ('362', '38', '1460521323', '-10', '15084750628', null, '', '', null, null);
INSERT INTO `money` VALUES ('363', '75', '1460521385', '-1', '350700223@qq.com', null, '', '', null, null);
INSERT INTO `money` VALUES ('364', '75', '1460521457', '-1', '350700223@qq.com', null, '', '', null, null);
INSERT INTO `money` VALUES ('365', '46', '1460521514', '-4', '18921896638', null, '', '', null, null);
INSERT INTO `money` VALUES ('366', '75', '1460521583', '-4', '350700223@qq.com', null, '', '', null, null);
INSERT INTO `money` VALUES ('367', '46', '1460521630', '-5', '18921896638', null, '', '', null, null);
INSERT INTO `money` VALUES ('368', '38', '1460521815', '-2', '15084750628', null, '', '', null, null);
INSERT INTO `money` VALUES ('369', '38', '', null, '', null, '', '1460522471', '10', null);
INSERT INTO `money` VALUES ('370', '43', '', null, '17751556218', null, '', '1460522903', '1', null);
INSERT INTO `money` VALUES ('371', '80', '', null, '602050873@qq.com', null, '', '1460525948', '1', null);
INSERT INTO `money` VALUES ('372', '38', '1460527319', '-50', '15084750628', null, '', '', null, null);
INSERT INTO `money` VALUES ('373', '43', '1460527718', '-1', '17751556218', null, '', '', null, null);
INSERT INTO `money` VALUES ('374', '80', '1460527854', '-100', '602050873@qq.com', null, '', '', null, null);
INSERT INTO `money` VALUES ('375', '43', '1460528902', '-1', '17751556218', null, '', '', null, null);
INSERT INTO `money` VALUES ('376', '38', '1460535377', '-1', '15084750628', null, '', '', null, null);
INSERT INTO `money` VALUES ('377', '88', '', null, '783324154@qq.com', null, '', '1460556070', '1', null);
INSERT INTO `money` VALUES ('378', '37', '', null, '15116341580', null, '', '1460596647', '1', null);
INSERT INTO `money` VALUES ('379', '95', '1460597854', '-30', '305988848@qq.com', null, '', '', null, null);
INSERT INTO `money` VALUES ('380', '37', '', null, '', null, '', '1460598301', '100', '好友[半城烟沙]充值成为会员,得到系统奖励100金币');
INSERT INTO `money` VALUES ('381', '21', '', null, '18874968273', null, '', '1460598559', '1', null);
INSERT INTO `money` VALUES ('382', '37', '', null, '', null, '', '1460601306', '100', '好友[风趣的围巾]充值成为会员,得到系统奖励100金币');
INSERT INTO `money` VALUES ('383', '96', '', null, null, null, '', '1460601359', '1', null);
INSERT INTO `money` VALUES ('384', '88', '', null, '783324154@qq.com', null, '', '1460602429', '1', null);
INSERT INTO `money` VALUES ('385', '95', '', null, '305988848@qq.com', null, '', '1460612945', '1', null);
INSERT INTO `money` VALUES ('386', '37', '', null, '', null, '', '1460614144', '100', '好友[青春旳不羁]充值成为会员,得到系统奖励100金币');
INSERT INTO `money` VALUES ('387', '95', '1460616161', '-20', '305988848@qq.com', null, '', '', null, null);
INSERT INTO `money` VALUES ('388', '96', '1460616441', '-35', '1225007899@qq.com', null, '', '', null, null);
INSERT INTO `money` VALUES ('389', '95', '1460616725', '-12', '305988848@qq.com', null, '', '', null, null);
INSERT INTO `money` VALUES ('390', '98', '', null, '18163674116', null, '', '1460616731', '1', null);
INSERT INTO `money` VALUES ('391', '96', '1460617208', '-10', '1225007899@qq.com', null, '', '', null, null);
INSERT INTO `money` VALUES ('392', '95', '1460617241', '-8', '305988848@qq.com', null, '', '', null, null);
INSERT INTO `money` VALUES ('393', '46', '', null, '18921896638', null, '', '1460633287', '1', null);
INSERT INTO `money` VALUES ('394', '21', '', null, '18874968273', null, '', '1460682747', '1', null);
INSERT INTO `money` VALUES ('395', '88', '', null, '783324154@qq.com', null, '', '1460682795', '1', null);
INSERT INTO `money` VALUES ('396', '21', '1460684564', '-1', '18874968273', null, '', '', null, null);
INSERT INTO `money` VALUES ('397', '21', '1460684596', '-1', '18874968273', null, '', '', null, null);
INSERT INTO `money` VALUES ('398', '37', '', null, '15116341580', null, '', '1460686033', '1', null);
INSERT INTO `money` VALUES ('399', '96', '', null, '1225007899@qq.com', null, '', '1460686680', '1', null);
INSERT INTO `money` VALUES ('400', '98', '', null, '18163674116', null, '', '1460692551', '1', null);
INSERT INTO `money` VALUES ('401', '96', '', null, '', null, '', '1460704123', '10', null);
INSERT INTO `money` VALUES ('402', '38', '', null, '15084750628', null, '', '1460705972', '1', null);
INSERT INTO `money` VALUES ('403', '44', '', null, '', null, '', '1460707401', '10', null);
INSERT INTO `money` VALUES ('404', '37', '', null, '', null, '', '1460707854', '100', '好友[笑的狠牵强]充值成为会员,得到系统奖励100金币');
INSERT INTO `money` VALUES ('405', '97', '', null, '18569076152', null, '', '1460707867', '1', null);
INSERT INTO `money` VALUES ('406', '17', '', null, '', null, '', '1460708464', '100', '好友[薄荷加冰i]充值成为会员,得到系统奖励100金币');
INSERT INTO `money` VALUES ('407', '93', '', null, '1126005112@qq.com', null, '', '1460708475', '1', null);
INSERT INTO `money` VALUES ('408', '37', '', null, '', null, '', '1460708666', '100', '好友[哈哈哈]充值成为会员,得到系统奖励100金币');
INSERT INTO `money` VALUES ('409', '17', '', null, '15616945257', null, '', '1460708693', '1', null);
INSERT INTO `money` VALUES ('410', '38', '', null, '', null, '', '1460710623', '10', null);
INSERT INTO `money` VALUES ('411', '38', '', null, '', null, '', '1460710955', '100', '好友[怪咖叔叔]充值成为会员,得到系统奖励100金币');
INSERT INTO `money` VALUES ('412', '38', '', null, '', null, '', '1460712501', '100', '好友[★悱、蓅憾﹌]充值成为会员,得到系统奖励100金币');
INSERT INTO `money` VALUES ('413', '99', '', null, null, null, '', '1460712685', '1', null);
INSERT INTO `money` VALUES ('414', '38', '', null, '', null, '', '1460713125', '100', '好友[国民萌叔]充值成为会员,得到系统奖励100金币');
INSERT INTO `money` VALUES ('415', '101', '', null, '15116341580', null, '', '1460713142', '1', null);
INSERT INTO `money` VALUES ('416', '100', '', null, '1225007899@qq.com', null, '', '1460713400', '1', null);
INSERT INTO `money` VALUES ('417', '47', '', null, '15111455509', null, '', '1460771271', '1', null);
INSERT INTO `money` VALUES ('418', '47', '1460771336', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('419', '47', '1460771427', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('420', '93', '', null, '1126005112@qq.com', null, '', '1460774342', '1', null);
INSERT INTO `money` VALUES ('421', '102', '', null, '17751556704', null, '', '1460776032', '1', null);
INSERT INTO `money` VALUES ('422', '102', '', null, '', null, '', '1460776659', '100', '好友[带着爱意奔波四方]充值成为会员,得到系统奖励100金币');
INSERT INTO `money` VALUES ('423', '102', '', null, '', null, '', '1460776817', '100', '好友[柠檬草的味道、]充值成为会员,得到系统奖励100金币');
INSERT INTO `money` VALUES ('424', '102', '', null, '', null, '', '1460776928', '100', '好友[短发飘飘不及腰]充值成为会员,得到系统奖励100金币');
INSERT INTO `money` VALUES ('425', '47', '1460777469', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('426', '102', '1460778061', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('427', '21', '', null, '18874968273', null, '', '1460793881', '1', null);
INSERT INTO `money` VALUES ('428', '91', '1460796908', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('429', '91', '', null, '13611740593', null, '', '1460797012', '1', null);
INSERT INTO `money` VALUES ('430', '91', '1460797112', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('431', '41', '', null, '15111455555', null, '', '1460797238', '1', null);
INSERT INTO `money` VALUES ('432', '101', '', null, '15116341580', null, '', '1460859818', '1', null);
INSERT INTO `money` VALUES ('433', '47', '', null, '15111455509', null, '', '1460860250', '1', null);
INSERT INTO `money` VALUES ('434', '100', '', null, '1225007899@qq.com', null, '', '1460860554', '1', null);
INSERT INTO `money` VALUES ('435', '100', '1460860571', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('436', '100', '1460860623', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('437', '99', '', null, '602050873@qq.com', null, '', '1460861217', '1', null);
INSERT INTO `money` VALUES ('438', '99', '1460861260', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('439', '99', '1460861807', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('440', '100', '1460862102', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('441', '101', '1460862793', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('442', '21', '', null, '18874968273', null, '', '1460884895', '1', null);
INSERT INTO `money` VALUES ('443', '46', '1460902335', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('444', '46', '', null, '18921896638', null, '', '1460902621', '1', null);
INSERT INTO `money` VALUES ('445', '46', '1460902633', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('446', '101', '', null, '15116341580', null, '', '1460939920', '1', null);
INSERT INTO `money` VALUES ('447', '101', '1460939932', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('448', '38', '', null, '15084750628', null, '', '1460940101', '1', null);
INSERT INTO `money` VALUES ('449', '38', '1460940123', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('450', '101', '1460940179', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('451', '40', '1460940428', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('452', '89', '', null, '8325904@qq.com', null, '', '1460940711', '1', null);
INSERT INTO `money` VALUES ('453', '89', '1460940755', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('454', '40', '1460940831', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('455', '102', '', null, '17751556704', null, '', '1460940945', '1', null);
INSERT INTO `money` VALUES ('456', '102', '1460940957', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('457', '102', '1460940981', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('458', '47', '', null, '15111455509', null, '', '1460942235', '1', null);
INSERT INTO `money` VALUES ('459', '100', '', null, '1225007899@qq.com', null, '', '1460942270', '1', null);
INSERT INTO `money` VALUES ('460', '99', '', null, '602050873@qq.com', null, '', '1460942409', '1', null);
INSERT INTO `money` VALUES ('461', '104', '', null, 'a51556218@163.com', null, '', '1460942746', '1', null);
INSERT INTO `money` VALUES ('462', '104', '1460942767', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('463', '97', '', null, '18569076152', null, '', '1460942949', '1', null);
INSERT INTO `money` VALUES ('464', '93', '', null, '1126005112@qq.com', null, '', '1460943961', '1', null);
INSERT INTO `money` VALUES ('465', '101', '1460946986', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('466', '101', '1460947334', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('467', '101', '1460947946', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('468', '99', '1460948674', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('469', '99', '1460953384', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('470', '100', '1460953525', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('471', '99', '1460953690', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('472', '99', '1460957910', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('473', '100', '1460958012', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('474', '99', '1460958431', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('475', '100', '1460958545', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('476', '47', '1460958709', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('477', '101', '1460958825', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('478', '47', '1460962153', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('479', '47', '1460962196', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('480', '101', '1460962312', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('481', '99', '1460962868', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('482', '101', '1460963943', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('483', '44', '1460964487', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('484', '75', '1460964539', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('485', '104', '1460964548', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('486', '44', '', null, '15116317831', null, '', '1460964593', '1', null);
INSERT INTO `money` VALUES ('487', '44', '1460964605', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('488', '75', '1460964631', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('489', '105', '', null, 'b51556218@163.com', null, '', '1460964660', '1', null);
INSERT INTO `money` VALUES ('490', '105', '1460964672', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('491', '101', '1460964676', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('492', '106', '', null, 'c51556218@163.com', null, '', '1460965440', '1', null);
INSERT INTO `money` VALUES ('493', '106', '1460965452', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('494', '38', '1460965583', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('495', '40', '', null, '15616945333', null, '', '1460965662', '1', null);
INSERT INTO `money` VALUES ('496', '40', '1460965675', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('497', '46', '', null, '18921896638', null, '', '1460965735', '1', null);
INSERT INTO `money` VALUES ('498', '69', '', null, 'afasdjf@qq.com', null, '', '1460965815', '1', null);
INSERT INTO `money` VALUES ('499', '43', '', null, '17751556218', null, '', '1460966347', '1', null);
INSERT INTO `money` VALUES ('500', '43', '1460966357', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('501', '44', '1460966429', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('502', '43', '1460966752', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('503', '106', '1460966983', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('504', '101', '1460967253', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('505', '38', '1460967285', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('506', '46', '1460967408', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('507', '99', '1460967450', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('508', '99', '1460967547', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('509', '99', '1460967756', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('510', '101', '1460967799', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('511', '99', '1460967930', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('512', '104', '1460967999', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('513', '99', '1460968231', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('514', '101', '1460969499', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('515', '101', '1460969591', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('516', '101', '1460969753', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('517', '99', '1460969789', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('518', '101', '1460970797', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('519', '91', '', null, '13611740593', null, '', '1460970958', '1', null);
INSERT INTO `money` VALUES ('520', '91', '1460970967', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('521', '40', '1460971037', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('522', '100', '1460971072', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('523', '99', '1460971260', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('524', '101', '1460971318', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('525', '101', '1460971781', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('526', '75', '', null, '350700223@qq.com', null, '', '1460971884', '1', null);
INSERT INTO `money` VALUES ('527', '75', '1460971904', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('528', '99', '1460979485', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('529', '75', '1460980317', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('530', '75', '1460980323', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('531', '75', '1460980564', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('532', '75', '1460980576', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('533', '99', '1460980811', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('534', '101', '1460982387', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('535', '101', '1460982607', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('536', '99', '1460982699', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('537', '100', '1460982739', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('538', '99', '1460982888', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('539', '47', '1460983082', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('540', '100', '1460983206', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('541', '47', '1460987887', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('542', '91', '1460988135', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('543', '47', '1460988173', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('544', '101', '', null, '15116341580', null, '', '1461027401', '1', null);
INSERT INTO `money` VALUES ('545', '47', '', null, '15111455509', null, '', '1461027447', '1', null);
INSERT INTO `money` VALUES ('546', '101', '1461027463', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('547', '101', '1461027496', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('548', '100', '', null, '1225007899@qq.com', null, '', '1461027598', '1', null);
INSERT INTO `money` VALUES ('549', '101', '1461027648', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('550', '99', '', null, '602050873@qq.com', null, '', '1461027691', '1', null);
INSERT INTO `money` VALUES ('551', '47', '1461028107', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('552', '101', '1461028191', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('553', '99', '1461028296', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('554', '21', '', null, '18874968273', null, '', '1461028473', '1', null);
INSERT INTO `money` VALUES ('555', '101', '1461028458', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('556', '75', '', null, '350700223@qq.com', null, '', '1461028563', '1', null);
INSERT INTO `money` VALUES ('557', '75', '1461028570', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('558', '38', '', null, '15084750628', null, '', '1461028606', '1', null);
INSERT INTO `money` VALUES ('559', '38', '1461028614', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('560', '39', '', null, '15616945288', null, '', '1461028648', '1', null);
INSERT INTO `money` VALUES ('561', '39', '1461028656', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('562', '39', '1461028684', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('563', '40', '', null, '15616945333', null, '', '1461028718', '1', null);
INSERT INTO `money` VALUES ('564', '40', '1461028726', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('565', '41', '', null, '15111455555', null, '', '1461028786', '1', null);
INSERT INTO `money` VALUES ('566', '41', '1461028796', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('567', '41', '1461028821', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('568', '101', '1461028843', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('569', '101', '1461028929', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('570', '38', '1461028969', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('571', '75', '1461028987', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('572', '101', '1461029011', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('573', '101', '1461029075', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('574', '38', '1461029217', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('575', '75', '1461029237', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('576', '40', '1461029626', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('577', '41', '1461029642', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('578', '44', '', null, '15116317831', null, '', '1461029685', '1', null);
INSERT INTO `money` VALUES ('579', '44', '1461029694', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('580', '101', '1461029733', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('581', '43', '', null, '17751556218', null, '', '1461029743', '1', null);
INSERT INTO `money` VALUES ('582', '38', '1461029763', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('583', '75', '1461029900', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('584', '43', '1461029928', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('585', '75', '1461029953', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('586', '43', '1461030405', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('587', '107', '', null, 'd51556218@163.com', null, '', '1461030805', '1', null);
INSERT INTO `money` VALUES ('588', '47', '1461031059', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('589', '101', '1461031092', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('590', '43', '1461031147', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('591', '47', '1461031345', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('592', '101', '1461031466', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('593', '43', '1461031650', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('594', '107', '1461031720', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('595', '47', '1461031869', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('596', '101', '1461031990', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('597', '43', '1461032056', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('598', '107', '1461032138', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('599', '43', '1461032346', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('600', '47', '1461032557', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('601', '107', '1461032753', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('602', '101', '1461032832', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('603', '43', '1461033212', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('604', '107', '1461033477', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('605', '47', '1461034179', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('606', '43', '1461034359', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('607', '104', '', null, 'a51556218@163.com', null, '', '1461034813', '1', null);
INSERT INTO `money` VALUES ('608', '105', '', null, 'b51556218@163.com', null, '', '1461034869', '1', null);
INSERT INTO `money` VALUES ('609', '105', '1461035318', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('610', '107', '1461036369', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('611', '105', '1461036636', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('612', '107', '1461037036', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('613', '43', '1461037059', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('614', '107', '1461037103', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('615', '104', '1461037144', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('616', '101', '1461038346', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('617', '101', '1461038530', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('618', '101', '1461039276', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('619', '101', '1461039422', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('620', '99', '1461039490', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('621', '99', '1461039847', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('622', '99', '1461039935', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('623', '99', '1461040047', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('624', '99', '1461040336', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('625', '99', '1461041153', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('626', '89', '', null, '8325904@qq.com', null, '', '1461042024', '1', null);
INSERT INTO `money` VALUES ('627', '102', '', null, '17751556704', null, '', '1461042068', '1', null);
INSERT INTO `money` VALUES ('628', '81', '', null, '2179773081@qq.com', null, '', '1461042343', '1', null);
INSERT INTO `money` VALUES ('629', '81', '1461043173', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('630', '81', '1461043426', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('631', '89', '1461043566', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('632', '102', '1461043637', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('633', '104', '1461043735', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('634', '104', '1461043763', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('635', '105', '1461043823', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('636', '104', '1461043887', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('637', '89', '1461044454', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('638', '104', '1461045073', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('639', '102', '1461045079', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('640', '89', '1461045084', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('641', '81', '1461045090', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('642', '101', '1461045206', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('643', '101', '1461045274', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('644', '101', '1461045369', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('645', '89', '1461045526', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('646', '104', '1461045560', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('647', '105', '1461045621', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('648', '102', '1461045858', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('649', '81', '1461045918', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('650', '101', '1461045940', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('651', '101', '1461046027', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('652', '101', '1461046114', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('653', '101', '1461046170', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('654', '101', '1461046205', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('655', '89', '1461046304', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('656', '99', '1461046330', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('657', '101', '1461046372', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('658', '99', '1461046433', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('659', '101', '1461046943', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('660', '106', '', null, 'c51556218@163.com', null, '', '1461047004', '1', null);
INSERT INTO `money` VALUES ('661', '101', '1461047742', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('662', '104', '1461047811', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('663', '101', '1461047812', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('664', '101', '1461047927', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('665', '106', '1461048013', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('666', '89', '1461048052', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('667', '102', '1461048068', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('668', '101', '1461048142', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('669', '100', '1461047977', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('670', '101', '1461048341', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('671', '102', '1461048492', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('672', '47', '1461048513', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('673', '89', '1461048703', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('674', '101', '1461048991', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('675', '101', '1461049102', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('676', '91', '', null, '13611740593', null, '', '1461049169', '1', null);
INSERT INTO `money` VALUES ('677', '91', '1461049177', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('678', '91', '1461049211', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('679', '91', '1461049452', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('680', '46', '', null, '18921896638', null, '', '1461049529', '1', null);
INSERT INTO `money` VALUES ('681', '46', '1461049546', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('682', '101', '1461049579', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('683', '91', '1461049835', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('684', '43', '1461049839', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('685', '101', '1461049891', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('686', '101', '1461049951', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('687', '101', '1461049959', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('688', '101', '1461050185', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('689', '17', '', null, '15616945257', null, '', '1461050460', '1', null);
INSERT INTO `money` VALUES ('690', '101', '1461050530', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('691', '46', '1461050977', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('692', '101', '1461050998', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('693', '17', '1461051062', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('694', '21', '1461052263', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('695', '102', '1461052498', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('696', '104', '1461053213', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('697', '105', '1461053271', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('698', '104', '1461053418', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('699', '104', '1461053573', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('700', '102', '1461053750', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('701', '105', '1461054105', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('702', '75', '1461054636', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('703', '75', '1461055971', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('704', '40', '1461055988', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('705', '40', '1461056128', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('706', '40', '1461056147', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('707', '75', '1461056173', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('708', '75', '1461056246', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('709', '75', '1461056347', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('710', '75', '1461056539', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('711', '75', '1461056699', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('712', '105', '1461057070', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('713', '102', '1461057139', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('714', '105', '1461057432', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('715', '105', '1461057613', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('716', '101', '1461057693', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('717', '107', '1461057720', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('718', '106', '1461057815', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('719', '82', '', null, '3367969202@qq.com', null, '', '1461059823', '1', null);
INSERT INTO `money` VALUES ('720', '102', '1461060724', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('721', '82', '1461060732', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('722', '81', '1461060736', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('723', '105', '1461060742', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('724', '105', '1461061111', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('725', '106', '1461062650', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('726', '43', '1461062814', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('727', '106', '1461063441', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('728', '43', '1461063919', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('729', '43', '1461063940', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('730', '108', '', null, 'e51556218@163.com', null, '', '1461064033', '1', null);
INSERT INTO `money` VALUES ('731', '43', '1461064079', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('732', '108', '1461064113', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('733', '106', '1461064238', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('734', '43', '1461064273', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('735', '43', '1461064329', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('736', '108', '1461064360', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('737', '43', '1461064412', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('738', '81', '1461064494', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('739', '46', '1461064698', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('740', '82', '1461064734', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('741', '104', '1461064911', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('742', '102', '1461065030', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('743', '102', '1461066009', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('744', '102', '1461066044', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('745', '102', '1461066310', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('746', '82', '1461066336', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('747', '102', '1461066501', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('748', '105', '1461066563', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('749', '108', '1461066584', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('750', '109', '', null, 'f51556218@163.com', null, '', '1461066618', '1', null);
INSERT INTO `money` VALUES ('751', '109', '1461066670', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('752', '108', '1461066686', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('753', '82', '1461066727', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('754', '108', '1461066780', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('755', '105', '1461066840', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('756', '81', '1461066865', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('757', '108', '1461066866', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('758', '82', '1461067512', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('759', '108', '1461067536', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('760', '89', '1461067942', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('761', '82', '1461068022', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('762', '105', '1461068102', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('763', '82', '1461068462', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('764', '104', '1461068671', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('765', '91', '1461069607', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('766', '91', '1461069721', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('767', '91', '1461069801', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('768', '91', '1461070345', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('769', '91', '1461070593', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('770', '91', '1461070668', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('771', '91', '1461071024', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('772', '91', '1461071152', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('773', '91', '1461071271', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('774', '91', '1461071424', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('775', '39', '1461071471', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('776', '40', '1461071517', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('777', '104', '1461076283', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('778', '106', '1461076365', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('779', '106', '1461076412', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('780', '105', '1461076414', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('781', '106', '1461076444', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('782', '105', '1461076864', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('783', '104', '1461076887', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('784', '81', '1461076967', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('785', '82', '1461077042', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('786', '43', '', null, '17751556218', null, '', '1461105982', '1', null);
INSERT INTO `money` VALUES ('787', '43', '1461105995', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('788', '104', '', null, 'a51556218@163.com', null, '', '1461106167', '1', null);
INSERT INTO `money` VALUES ('789', '105', '', null, 'b51556218@163.com', null, '', '1461106288', '1', null);
INSERT INTO `money` VALUES ('790', '82', '', null, '3367969202@qq.com', null, '', '1461106315', '1', null);
INSERT INTO `money` VALUES ('791', '81', '', null, '2179773081@qq.com', null, '', '1461106404', '1', null);
INSERT INTO `money` VALUES ('792', '102', '', null, '17751556704', null, '', '1461106441', '1', null);
INSERT INTO `money` VALUES ('793', '106', '', null, 'c51556218@163.com', null, '', '1461107393', '1', null);
INSERT INTO `money` VALUES ('794', '107', '', null, 'd51556218@163.com', null, '', '1461107439', '1', null);
INSERT INTO `money` VALUES ('795', '47', '', null, '15111455509', null, '', '1461107509', '1', null);
INSERT INTO `money` VALUES ('796', '105', '1461107630', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('797', '104', '1461107981', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('798', '107', '1461108113', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('799', '106', '1461108204', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('800', '82', '1461108302', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('801', '104', '1461108533', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('802', '105', '1461108558', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('803', '107', '1461108601', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('804', '81', '1461108943', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('805', '106', '1461108953', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('806', '107', '1461108978', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('807', '46', '', null, '18921896638', null, '', '1461108985', '1', null);
INSERT INTO `money` VALUES ('808', '46', '1461108998', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('809', '46', '1461109030', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('810', '109', '', null, 'f51556218@163.com', null, '', '1461109033', '1', null);
INSERT INTO `money` VALUES ('811', '109', '1461109056', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('812', '106', '1461109069', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('813', '46', '1461109134', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('814', '109', '1461109161', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('815', '107', '1461109195', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('816', '46', '1461109211', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('817', '109', '1461109347', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('818', '106', '1461109380', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('819', '105', '1461109391', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('820', '109', '1461109394', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('821', '107', '1461109400', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('822', '104', '1461109409', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('823', '106', '1461109414', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('824', '109', '1461109429', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('825', '105', '1461109458', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('826', '107', '1461109484', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('827', '105', '1461109492', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('828', '82', '1461109507', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('829', '105', '1461109522', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('830', '108', '', null, 'e51556218@163.com', null, '', '1461109565', '1', null);
INSERT INTO `money` VALUES ('831', '105', '1461109565', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('832', '81', '1461109627', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('833', '108', '1461109730', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('834', '105', '1461109792', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('835', '81', '1461109802', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('836', '108', '1461109885', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('837', '109', '1461109905', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('838', '105', '1461109947', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('839', '81', '1461109954', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('840', '108', '1461109974', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('841', '108', '1461109988', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('842', '104', '1461110045', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('843', '81', '1461110065', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('844', '105', '1461110073', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('845', '106', '1461110150', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('846', '46', '1461110177', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('847', '107', '1461110188', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('848', '109', '1461110384', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('849', '109', '1461110406', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('850', '109', '1461110416', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('851', '109', '1461110439', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('852', '82', '1461110495', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('853', '109', '1461110537', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('854', '109', '1461110556', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('855', '43', '1461111738', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('856', '46', '1461111825', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('857', '104', '1461112041', '-20', '', null, '', '', null, null);
INSERT INTO `money` VALUES ('858', '101', '', null, '15116341580', null, '', '1461113935', '1', null);
INSERT INTO `money` VALUES ('859', '44', '', null, '15116317831', null, '', '1461115078', '1', null);
INSERT INTO `money` VALUES ('860', '21', '', null, '18874968273', null, '', '1461115695', '1', null);
INSERT INTO `money` VALUES ('861', '91', '', null, '13611740593', null, '', '1461116746', '1', null);
INSERT INTO `money` VALUES ('862', '91', '1461116754', '-20', '', null, '', '', null, null);

-- ----------------------------
-- Table structure for pay_order
-- ----------------------------
DROP TABLE IF EXISTS `pay_order`;
CREATE TABLE `pay_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `goods_id` int(11) NOT NULL COMMENT '产品ID',
  `goods_name` varchar(120) NOT NULL COMMENT '产品名称',
  `price` double(10,2) NOT NULL COMMENT '产品价格',
  `pay_type` tinyint(1) NOT NULL COMMENT '支付方式：1支付宝2微信支付3网银',
  `trade_no` varchar(255) DEFAULT NULL COMMENT '支付接口交易号',
  `state` tinyint(2) NOT NULL COMMENT '交易状态：0未交易或支付不成功1 交易成功',
  `is_recharge` tinyint(1) DEFAULT '0' COMMENT '是否已进行充值操作0未操作(默认),1已操作',
  `create_time` int(11) NOT NULL COMMENT '创建订单时间',
  `trade_time` varchar(120) DEFAULT NULL COMMENT '支付成功时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=309 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pay_order
-- ----------------------------
INSERT INTO `pay_order` VALUES ('1', '21', '2', '哈哈', '55.00', '1', '111111111111', '1', '0', '1457959872', null);
INSERT INTO `pay_order` VALUES ('20', '37', '1', 'VIP会员1个月', '0.01', '1', null, '0', '0', '1460536053', null);
INSERT INTO `pay_order` VALUES ('21', '37', '1', 'VIP会员1个月', '0.01', '1', null, '0', '0', '1460536101', null);
INSERT INTO `pay_order` VALUES ('22', '37', '1', 'VIP会员1个月', '0.01', '1', '2016041321001004670247028401', '1', '1', '1460536452', '2016-04-13 16:34:53');
INSERT INTO `pay_order` VALUES ('23', '37', '4', '充值50金币', '0.01', '1', '2016041321001004670253084254', '1', '1', '1460536914', '2016-04-13 16:42:16');
INSERT INTO `pay_order` VALUES ('24', '37', '5', '充值150金币', '0.01', '1', '2016041321001004670246938996', '1', '1', '1460537225', '2016-04-13 16:47:17');
INSERT INTO `pay_order` VALUES ('25', '95', '1', 'VIP会员1个月', '0.01', '1', null, '0', '0', '1460540828', null);
INSERT INTO `pay_order` VALUES ('26', '95', '6', '充值400金币', '0.01', '1', null, '0', '0', '1460540854', null);
INSERT INTO `pay_order` VALUES ('27', '95', '5', '充值150金币', '0.01', '1', null, '0', '0', '1460540875', null);
INSERT INTO `pay_order` VALUES ('28', '95', '3', 'VIP会员1年', '0.01', '1', null, '0', '0', '1460541363', null);
INSERT INTO `pay_order` VALUES ('29', '95', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460541388', null);
INSERT INTO `pay_order` VALUES ('30', '95', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460541432', null);
INSERT INTO `pay_order` VALUES ('31', '95', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460541507', null);
INSERT INTO `pay_order` VALUES ('32', '95', '1', 'VIP会员1个月', '0.01', '1', null, '0', '0', '1460541538', null);
INSERT INTO `pay_order` VALUES ('38', '95', '1', 'VIP会员1个月', '0.01', '1', null, '0', '0', '1460541705', null);
INSERT INTO `pay_order` VALUES ('39', '47', '1', 'VIP会员1个月', '0.01', '1', null, '0', '0', '1460545812', null);
INSERT INTO `pay_order` VALUES ('40', '21', '1', 'VIP会员1个月', '0.01', '1', '2016041321001004420246746786', '1', '1', '1460546160', '2016-04-13 19:19:41');
INSERT INTO `pay_order` VALUES ('41', '88', '3', 'VIP会员1年', '0.01', '1', '2016041321001004830294104030', '1', '1', '1460555919', '2016-04-13 21:59:22');
INSERT INTO `pay_order` VALUES ('42', '21', '1', 'VIP会员1个月', '0.01', '1', '2016041321001004420246088133', '1', '1', '1460557508', '2016-04-13 22:32:47');
INSERT INTO `pay_order` VALUES ('43', '21', '4', '充值50金币', '0.01', '1', '2016041321001004420246088323', '1', '1', '1460558346', '2016-04-13 22:39:29');
INSERT INTO `pay_order` VALUES ('44', '21', '6', '充值400金币', '0.01', '1', '2016041321001004420244122421', '1', '1', '1460558425', '2016-04-13 22:40:42');
INSERT INTO `pay_order` VALUES ('45', '95', '1', 'VIP会员1个月', '0.01', '1', null, '0', '0', '1460597402', null);
INSERT INTO `pay_order` VALUES ('46', '95', '6', '充值400金币', '0.01', '1', '2016041421001004670246950017', '1', '1', '1460597716', '2016-04-14 09:35:42');
INSERT INTO `pay_order` VALUES ('47', '95', '3', 'VIP会员1年', '0.01', '1', '2016041421001004670262481773', '1', '1', '1460598268', '2016-04-14 09:44:59');
INSERT INTO `pay_order` VALUES ('48', '96', '5', '充值150金币', '0.01', '1', '2016041421001004670255678609', '1', '1', '1460599414', '2016-04-14 10:04:08');
INSERT INTO `pay_order` VALUES ('49', '96', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460601269', null);
INSERT INTO `pay_order` VALUES ('50', '96', '2', 'VIP会员半年', '0.01', '1', '2016041421001004670247040522', '1', '1', '1460601291', '2016-04-14 10:35:05');
INSERT INTO `pay_order` VALUES ('51', '21', '1', 'VIP会员1个月', '0.01', '1', '2016041421001004420239291435', '1', '1', '1460602745', '2016-04-14 10:59:30');
INSERT INTO `pay_order` VALUES ('52', '21', '1', 'VIP会员1个月', '0.01', '1', null, '0', '0', '1460603666', null);
INSERT INTO `pay_order` VALUES ('53', '98', '4', '充值50金币', '0.01', '1', '2016041421001004670262485655', '1', '1', '1460606299', '2016-04-14 11:58:48');
INSERT INTO `pay_order` VALUES ('54', '21', '1', 'VIP会员1个月', '0.01', '1', null, '0', '0', '1460612292', null);
INSERT INTO `pay_order` VALUES ('55', '98', '1', 'VIP会员1个月', '0.01', '1', '2016041421001004670262491173', '1', '1', '1460614126', '2016-04-14 14:09:03');
INSERT INTO `pay_order` VALUES ('56', '21', '6', '充值400金币', '0.01', '1', '2016041421001004420246757163', '1', '1', '1460616141', '2016-04-14 14:42:41');
INSERT INTO `pay_order` VALUES ('57', '21', '1', 'VIP会员1个月', '0.01', '1', '2016041421001004420247713216', '1', '1', '1460616223', '2016-04-14 14:44:41');
INSERT INTO `pay_order` VALUES ('58', '21', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460616524', null);
INSERT INTO `pay_order` VALUES ('59', '21', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460616647', null);
INSERT INTO `pay_order` VALUES ('60', '21', '3', 'VIP会员1年', '0.01', '1', null, '0', '0', '1460616761', null);
INSERT INTO `pay_order` VALUES ('61', '21', '3', 'VIP会员1年', '0.01', '1', null, '0', '0', '1460617044', null);
INSERT INTO `pay_order` VALUES ('62', '21', '3', 'VIP会员1年', '0.01', '1', null, '0', '0', '1460617047', null);
INSERT INTO `pay_order` VALUES ('63', '21', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460617195', null);
INSERT INTO `pay_order` VALUES ('64', '21', '2', 'VIP会员半年', '0.01', '1', '2016041421001004420246765147', '1', '1', '1460637356', '2016-04-14 20:36:20');
INSERT INTO `pay_order` VALUES ('65', '88', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460644834', null);
INSERT INTO `pay_order` VALUES ('66', '88', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460645008', null);
INSERT INTO `pay_order` VALUES ('67', '88', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460645539', null);
INSERT INTO `pay_order` VALUES ('68', '88', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460645540', null);
INSERT INTO `pay_order` VALUES ('69', '88', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460645675', null);
INSERT INTO `pay_order` VALUES ('70', '88', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460645680', null);
INSERT INTO `pay_order` VALUES ('71', '88', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460645758', null);
INSERT INTO `pay_order` VALUES ('107', '98', '6', '充值400金币', '0.01', '1', null, '0', '0', '1460692528', null);
INSERT INTO `pay_order` VALUES ('106', '98', '6', '充值400金币', '0.01', '1', '4008692001201604154859363200', '1', '1', '1460692385', '20160415115520');
INSERT INTO `pay_order` VALUES ('105', '98', '1', 'VIP会员1个月', '0.01', '1', '4008692001201604154858000656', '1', '1', '1460692223', '20160415115217');
INSERT INTO `pay_order` VALUES ('104', '21', '2', 'VIP会员半年', '0.01', '1', '4007842001201604154857921453', '1', '1', '1460692125', '20160415114916');
INSERT INTO `pay_order` VALUES ('103', '88', '3', 'VIP会员1年', '0.01', '1', '4005922001201604154855453866', '1', '1', '1460686823', '20160415102054');
INSERT INTO `pay_order` VALUES ('102', '88', '6', '充值400金币', '0.01', '1', '4005922001201604154855413611', '1', '1', '1460686705', '20160415101902');
INSERT INTO `pay_order` VALUES ('101', '88', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460686631', null);
INSERT INTO `pay_order` VALUES ('100', '88', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460685530', null);
INSERT INTO `pay_order` VALUES ('99', '88', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460684091', null);
INSERT INTO `pay_order` VALUES ('98', '88', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460683795', null);
INSERT INTO `pay_order` VALUES ('97', '88', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460682801', null);
INSERT INTO `pay_order` VALUES ('96', '88', '3', 'VIP会员1年', '0.01', '1', null, '0', '0', '1460649691', null);
INSERT INTO `pay_order` VALUES ('95', '88', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460649322', null);
INSERT INTO `pay_order` VALUES ('108', '21', '3', 'VIP会员1年', '0.01', '1', null, '0', '0', '1460692941', null);
INSERT INTO `pay_order` VALUES ('109', '21', '3', 'VIP会员1年', '0.01', '1', null, '0', '0', '1460695310', null);
INSERT INTO `pay_order` VALUES ('110', '21', '5', '充值150金币', '0.01', '1', null, '0', '0', '1460695405', null);
INSERT INTO `pay_order` VALUES ('111', '21', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460695754', null);
INSERT INTO `pay_order` VALUES ('112', '21', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460696568', null);
INSERT INTO `pay_order` VALUES ('113', '21', '2', 'VIP会员半年', '0.01', '1', '4007842001201604154862912308', '1', '1', '1460696649', '20160415130429');
INSERT INTO `pay_order` VALUES ('114', '21', '2', 'VIP会员半年', '0.01', '1', '2016041521001004420248713404', '1', '1', '1460696970', '2016-04-15 13:10:04');
INSERT INTO `pay_order` VALUES ('115', '21', '5', '充值150金币', '0.01', '1', '4007842001201604154861817163', '1', '1', '1460697125', '20160415131230');
INSERT INTO `pay_order` VALUES ('116', '88', '5', '充值150金币', '0.01', '1', '2016041521001004830299382425', '1', '1', '1460697973', '2016-04-15 13:27:16');
INSERT INTO `pay_order` VALUES ('117', '21', '2', 'VIP会员半年', '0.01', '1', '2016041521001004420244148202', '1', '1', '1460698672', '2016-04-15 13:38:24');
INSERT INTO `pay_order` VALUES ('118', '21', '5', '充值150金币', '0.01', '1', '4007842001201604154863598486', '1', '1', '1460698734', '20160415133930');
INSERT INTO `pay_order` VALUES ('119', '96', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460698590', null);
INSERT INTO `pay_order` VALUES ('120', '96', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460698633', null);
INSERT INTO `pay_order` VALUES ('121', '96', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460698676', null);
INSERT INTO `pay_order` VALUES ('122', '88', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460699758', null);
INSERT INTO `pay_order` VALUES ('123', '88', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460699956', null);
INSERT INTO `pay_order` VALUES ('124', '88', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460700049', null);
INSERT INTO `pay_order` VALUES ('125', '88', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460700090', null);
INSERT INTO `pay_order` VALUES ('126', '96', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460700492', null);
INSERT INTO `pay_order` VALUES ('127', '88', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460700705', null);
INSERT INTO `pay_order` VALUES ('128', '88', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460700724', null);
INSERT INTO `pay_order` VALUES ('129', '88', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460700727', null);
INSERT INTO `pay_order` VALUES ('130', '88', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460700789', null);
INSERT INTO `pay_order` VALUES ('131', '88', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460700834', null);
INSERT INTO `pay_order` VALUES ('132', '88', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460700907', null);
INSERT INTO `pay_order` VALUES ('133', '88', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460700953', null);
INSERT INTO `pay_order` VALUES ('134', '88', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460701552', null);
INSERT INTO `pay_order` VALUES ('135', '88', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460701704', null);
INSERT INTO `pay_order` VALUES ('136', '88', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460701777', null);
INSERT INTO `pay_order` VALUES ('137', '88', '2', 'VIP会员半年', '0.01', '1', '4005922001201604154866619590', '1', '1', '1460701784', '20160415143039');
INSERT INTO `pay_order` VALUES ('138', '88', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460702010', null);
INSERT INTO `pay_order` VALUES ('139', '88', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460702069', null);
INSERT INTO `pay_order` VALUES ('140', '88', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460702079', null);
INSERT INTO `pay_order` VALUES ('141', '88', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460702088', null);
INSERT INTO `pay_order` VALUES ('142', '88', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460702108', null);
INSERT INTO `pay_order` VALUES ('143', '88', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460702300', null);
INSERT INTO `pay_order` VALUES ('144', '88', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460702324', null);
INSERT INTO `pay_order` VALUES ('145', '88', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460702410', null);
INSERT INTO `pay_order` VALUES ('146', '88', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460702452', null);
INSERT INTO `pay_order` VALUES ('147', '88', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460702481', null);
INSERT INTO `pay_order` VALUES ('148', '88', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460702492', null);
INSERT INTO `pay_order` VALUES ('149', '88', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460702502', null);
INSERT INTO `pay_order` VALUES ('150', '88', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460702532', null);
INSERT INTO `pay_order` VALUES ('151', '88', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460702642', null);
INSERT INTO `pay_order` VALUES ('152', '88', '2', 'VIP会员半年', '0.01', '1', '4005922001201604154866803595', '1', '1', '1460702671', '20160415144448');
INSERT INTO `pay_order` VALUES ('153', '88', '6', '充值400金币', '0.01', '1', null, '0', '0', '1460702716', null);
INSERT INTO `pay_order` VALUES ('154', '88', '6', '充值400金币', '0.01', '1', null, '0', '0', '1460702766', null);
INSERT INTO `pay_order` VALUES ('155', '88', '3', 'VIP会员1年', '0.01', '1', '4005922001201604154865659734', '1', '1', '1460702776', '20160415144641');
INSERT INTO `pay_order` VALUES ('156', '88', '6', '充值400金币', '0.01', '1', '4005922001201604154866859432', '1', '1', '1460702858', '20160415144757');
INSERT INTO `pay_order` VALUES ('157', '98', '2', 'VIP会员半年', '0.01', '1', '4008692001201604154865978633', '1', '1', '1460704248', '20160415151116');
INSERT INTO `pay_order` VALUES ('158', '38', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460705498', null);
INSERT INTO `pay_order` VALUES ('159', '38', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460705533', null);
INSERT INTO `pay_order` VALUES ('160', '38', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460705537', null);
INSERT INTO `pay_order` VALUES ('161', '38', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460705625', null);
INSERT INTO `pay_order` VALUES ('162', '88', '5', '充值150金币', '0.01', '1', null, '0', '0', '1460705641', null);
INSERT INTO `pay_order` VALUES ('163', '38', '2', 'VIP会员半年', '0.01', '1', '4008692001201604154867537264', '1', '1', '1460705896', '20160415153832');
INSERT INTO `pay_order` VALUES ('164', '88', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460706131', null);
INSERT INTO `pay_order` VALUES ('165', '88', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460706313', null);
INSERT INTO `pay_order` VALUES ('166', '88', '1', 'VIP会员1个月', '0.01', '1', null, '0', '0', '1460706687', null);
INSERT INTO `pay_order` VALUES ('167', '88', '1', 'VIP会员1个月', '0.01', '1', null, '0', '0', '1460707468', null);
INSERT INTO `pay_order` VALUES ('168', '88', '5', '充值150金币', '0.01', '1', null, '0', '0', '1460707482', null);
INSERT INTO `pay_order` VALUES ('169', '97', '3', 'VIP会员1年', '0.01', '1', '4008692001201604154868795914', '1', '1', '1460707830', '20160415161053');
INSERT INTO `pay_order` VALUES ('170', '97', '4', '充值50金币', '0.01', '1', '4008692001201604154868827650', '1', '1', '1460707962', '20160415161259');
INSERT INTO `pay_order` VALUES ('171', '93', '2', 'VIP会员半年', '0.01', '1', '4005922001201604154868131473', '1', '1', '1460708439', '20160415162104');
INSERT INTO `pay_order` VALUES ('172', '17', '1', 'VIP会员1个月', '0.01', '1', '2016041521001004670256787389', '1', '1', '1460708643', '2016-04-15 16:24:26');
INSERT INTO `pay_order` VALUES ('173', '99', '4', '充值50金币', '0.01', '1', '4008692001201604154870550300', '1', '1', '1460710218', '20160415165107');
INSERT INTO `pay_order` VALUES ('174', '99', '6', '充值400金币', '0.01', '1', '4008692001201604154870646952', '1', '1', '1460710376', '20160415165721');
INSERT INTO `pay_order` VALUES ('175', '99', '5', '充值150金币', '0.01', '1', '4008692001201604154870688432', '1', '1', '1460710767', '20160415165941');
INSERT INTO `pay_order` VALUES ('176', '99', '3', 'VIP会员1年', '0.01', '1', '4008692001201604154869555745', '1', '1', '1460710938', '20160415170234');
INSERT INTO `pay_order` VALUES ('177', '100', '5', '充值150金币', '0.01', '1', '2016041521001004670246982416', '1', '1', '1460711770', '2016-04-15 17:17:08');
INSERT INTO `pay_order` VALUES ('178', '100', '4', '充值50金币', '0.01', '1', '2016041521001004670264490742', '1', '1', '1460711856', '2016-04-15 17:17:50');
INSERT INTO `pay_order` VALUES ('179', '100', '1', 'VIP会员1个月', '0.01', '1', '4008692001201604154869955933', '1', '1', '1460712479', '20160415172820');
INSERT INTO `pay_order` VALUES ('180', '101', '6', '充值400金币', '0.01', '1', '2016041521001004670254571656', '1', '1', '1460712917', '2016-04-15 17:35:36');
INSERT INTO `pay_order` VALUES ('181', '101', '2', 'VIP会员半年', '0.01', '1', '4008692001201604154870124786', '1', '1', '1460713096', '20160415173836');
INSERT INTO `pay_order` VALUES ('182', '93', '1', 'VIP会员1个月', '0.01', '1', null, '0', '0', '1460727303', null);
INSERT INTO `pay_order` VALUES ('183', '93', '3', 'VIP会员1年', '0.01', '1', null, '0', '0', '1460727309', null);
INSERT INTO `pay_order` VALUES ('184', '93', '2', 'VIP会员半年', '0.01', '1', '2016041521001004830296378016', '1', '1', '1460727743', '2016-04-15 21:42:53');
INSERT INTO `pay_order` VALUES ('185', '93', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460729044', null);
INSERT INTO `pay_order` VALUES ('186', '93', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460729055', null);
INSERT INTO `pay_order` VALUES ('187', '93', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460729398', null);
INSERT INTO `pay_order` VALUES ('188', '93', '1', 'VIP会员1个月', '0.01', '1', '4005922001201604154880846174', '1', '1', '1460729425', '20160415221047');
INSERT INTO `pay_order` VALUES ('189', '93', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460729780', null);
INSERT INTO `pay_order` VALUES ('190', '93', '1', 'VIP会员1个月', '0.01', '1', null, '0', '0', '1460729787', null);
INSERT INTO `pay_order` VALUES ('191', '93', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460774348', null);
INSERT INTO `pay_order` VALUES ('192', '46', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460774391', null);
INSERT INTO `pay_order` VALUES ('193', '46', '1', 'VIP会员1个月', '0.01', '1', null, '0', '0', '1460774404', null);
INSERT INTO `pay_order` VALUES ('194', '93', '6', '充值400金币', '0.01', '1', '2016041621001004830204776427', '1', '1', '1460774799', '2016-04-16 11:08:26');
INSERT INTO `pay_order` VALUES ('195', '102', '1', 'VIP会员1个月', '0.01', '1', '2016041621001004670255717944', '1', '1', '1460775914', '2016-04-16 11:05:54');
INSERT INTO `pay_order` VALUES ('196', '102', '4', '充值50金币', '0.01', '1', '4000432001201604164891443068', '1', '1', '1460776052', '20160416110756');
INSERT INTO `pay_order` VALUES ('197', '102', '1', 'VIP会员1个月', '0.01', '1', null, '0', '0', '1460776186', null);
INSERT INTO `pay_order` VALUES ('198', '102', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460776205', null);
INSERT INTO `pay_order` VALUES ('199', '105', '1', 'VIP会员1个月', '0.01', '1', '4000432001201604164892413497', '1', '1', '1460776631', '20160416111738');
INSERT INTO `pay_order` VALUES ('200', '93', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460776645', null);
INSERT INTO `pay_order` VALUES ('201', '106', '1', 'VIP会员1个月', '0.01', '1', '4000432001201604164891657240', '1', '1', '1460776797', '20160416112017');
INSERT INTO `pay_order` VALUES ('202', '107', '1', 'VIP会员1个月', '0.01', '1', '4000432001201604164891687015', '1', '1', '1460776910', '20160416112208');
INSERT INTO `pay_order` VALUES ('203', '93', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460778386', null);
INSERT INTO `pay_order` VALUES ('204', '93', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460780117', null);
INSERT INTO `pay_order` VALUES ('205', '102', '3', 'VIP会员1年', '0.01', '1', null, '0', '0', '1460780130', null);
INSERT INTO `pay_order` VALUES ('206', '102', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460780556', null);
INSERT INTO `pay_order` VALUES ('207', '102', '1', 'VIP会员1个月', '0.01', '1', null, '0', '0', '1460780573', null);
INSERT INTO `pay_order` VALUES ('208', '102', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460780588', null);
INSERT INTO `pay_order` VALUES ('209', '102', '3', 'VIP会员1年', '0.01', '1', null, '0', '0', '1460780604', null);
INSERT INTO `pay_order` VALUES ('210', '102', '6', '充值400金币', '0.01', '1', null, '0', '0', '1460780614', null);
INSERT INTO `pay_order` VALUES ('211', '43', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460781721', null);
INSERT INTO `pay_order` VALUES ('212', '43', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460781932', null);
INSERT INTO `pay_order` VALUES ('213', '93', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460783879', null);
INSERT INTO `pay_order` VALUES ('214', '21', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460794255', null);
INSERT INTO `pay_order` VALUES ('215', '21', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460794263', null);
INSERT INTO `pay_order` VALUES ('216', '21', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460794265', null);
INSERT INTO `pay_order` VALUES ('217', '21', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460794280', null);
INSERT INTO `pay_order` VALUES ('218', '21', '1', 'VIP会员1个月', '0.01', '1', null, '0', '0', '1460794285', null);
INSERT INTO `pay_order` VALUES ('219', '21', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460794376', null);
INSERT INTO `pay_order` VALUES ('220', '21', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460794898', null);
INSERT INTO `pay_order` VALUES ('221', '21', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460794900', null);
INSERT INTO `pay_order` VALUES ('222', '21', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460794901', null);
INSERT INTO `pay_order` VALUES ('223', '21', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460794902', null);
INSERT INTO `pay_order` VALUES ('224', '21', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460795315', null);
INSERT INTO `pay_order` VALUES ('225', '21', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460795493', null);
INSERT INTO `pay_order` VALUES ('226', '21', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460795495', null);
INSERT INTO `pay_order` VALUES ('227', '21', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460795808', null);
INSERT INTO `pay_order` VALUES ('228', '21', '5', '充值150金币', '0.01', '1', null, '0', '0', '1460795925', null);
INSERT INTO `pay_order` VALUES ('229', '21', '5', '充值150金币', '0.01', '1', null, '0', '0', '1460795940', null);
INSERT INTO `pay_order` VALUES ('230', '21', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460795947', null);
INSERT INTO `pay_order` VALUES ('231', '21', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460796039', null);
INSERT INTO `pay_order` VALUES ('232', '21', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460796372', null);
INSERT INTO `pay_order` VALUES ('233', '21', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460796539', null);
INSERT INTO `pay_order` VALUES ('234', '91', '3', 'VIP会员1年', '0.01', '1', null, '0', '0', '1460796636', null);
INSERT INTO `pay_order` VALUES ('235', '91', '3', 'VIP会员1年', '0.01', '1', '2016041621001004220261264120', '1', '1', '1460796673', '2016-04-16 16:51:59');
INSERT INTO `pay_order` VALUES ('236', '21', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460796833', null);
INSERT INTO `pay_order` VALUES ('237', '21', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460797298', null);
INSERT INTO `pay_order` VALUES ('238', '21', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460797304', null);
INSERT INTO `pay_order` VALUES ('239', '21', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460797798', null);
INSERT INTO `pay_order` VALUES ('240', '21', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460798059', null);
INSERT INTO `pay_order` VALUES ('241', '21', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460798268', null);
INSERT INTO `pay_order` VALUES ('242', '21', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460798271', null);
INSERT INTO `pay_order` VALUES ('243', '21', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460798277', null);
INSERT INTO `pay_order` VALUES ('244', '21', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460798301', null);
INSERT INTO `pay_order` VALUES ('245', '21', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460799306', null);
INSERT INTO `pay_order` VALUES ('246', '21', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460800382', null);
INSERT INTO `pay_order` VALUES ('247', '21', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460800898', null);
INSERT INTO `pay_order` VALUES ('248', '21', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460801741', null);
INSERT INTO `pay_order` VALUES ('249', '21', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460801779', null);
INSERT INTO `pay_order` VALUES ('250', '21', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460801891', null);
INSERT INTO `pay_order` VALUES ('251', '21', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460801906', null);
INSERT INTO `pay_order` VALUES ('252', '21', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460803125', null);
INSERT INTO `pay_order` VALUES ('253', '21', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460803127', null);
INSERT INTO `pay_order` VALUES ('254', '21', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460803128', null);
INSERT INTO `pay_order` VALUES ('255', '21', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460803128', null);
INSERT INTO `pay_order` VALUES ('256', '21', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460803129', null);
INSERT INTO `pay_order` VALUES ('257', '21', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460803129', null);
INSERT INTO `pay_order` VALUES ('258', '21', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460803130', null);
INSERT INTO `pay_order` VALUES ('259', '21', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460803134', null);
INSERT INTO `pay_order` VALUES ('260', '21', '1', 'VIP会员1个月', '0.01', '1', null, '0', '0', '1460803148', null);
INSERT INTO `pay_order` VALUES ('261', '21', '4', '充值50金币', '0.01', '1', null, '0', '0', '1460803201', null);
INSERT INTO `pay_order` VALUES ('262', '21', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460803264', null);
INSERT INTO `pay_order` VALUES ('263', '21', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460803353', null);
INSERT INTO `pay_order` VALUES ('264', '21', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460803358', null);
INSERT INTO `pay_order` VALUES ('265', '93', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460803401', null);
INSERT INTO `pay_order` VALUES ('266', '93', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460803414', null);
INSERT INTO `pay_order` VALUES ('267', '21', '2', 'VIP会员半年', '0.01', '1', '2016041621001004420254550469', '1', '1', '1460804070', '2016-04-16 18:53:44');
INSERT INTO `pay_order` VALUES ('268', '21', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460804290', null);
INSERT INTO `pay_order` VALUES ('269', '21', '3', 'VIP会员1年', '0.01', '1', null, '0', '0', '1460804723', null);
INSERT INTO `pay_order` VALUES ('270', '21', '3', 'VIP会员1年', '0.01', '1', null, '0', '0', '1460805569', null);
INSERT INTO `pay_order` VALUES ('271', '21', '2', 'VIP会员半年', '0.01', '1', '4007842001201604164908310943', '1', '1', '1460805723', '20160416192221');
INSERT INTO `pay_order` VALUES ('272', '21', '2', 'VIP会员半年', '0.01', '1', '2016041621001004420254764668', '1', '1', '1460805852', '2016-04-16 19:24:51');
INSERT INTO `pay_order` VALUES ('273', '21', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460884722', null);
INSERT INTO `pay_order` VALUES ('274', '21', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460884887', null);
INSERT INTO `pay_order` VALUES ('275', '21', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460884889', null);
INSERT INTO `pay_order` VALUES ('276', '21', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460884891', null);
INSERT INTO `pay_order` VALUES ('277', '21', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460884913', null);
INSERT INTO `pay_order` VALUES ('278', '21', '2', 'VIP会员半年', '0.01', '1', '4007842001201604174934125945', '1', '1', '1460884968', '640828-03-10 01:11:49');
INSERT INTO `pay_order` VALUES ('279', '21', '2', 'VIP会员半年', '0.01', '1', '4007842001201604174934207829', '1', '1', '1460885259', '20160417172752');
INSERT INTO `pay_order` VALUES ('280', '21', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460885365', null);
INSERT INTO `pay_order` VALUES ('281', '21', '1', 'VIP会员1个月', '0.01', '1', '4007842001201604174934252581', '1', '1', '1460885446', '20160417173100');
INSERT INTO `pay_order` VALUES ('282', '21', '2', 'VIP会员半年', '0.01', '1', '4007842001201604174936396243', '1', '1', '1460885911', '20160417173849');
INSERT INTO `pay_order` VALUES ('295', '21', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460888550', null);
INSERT INTO `pay_order` VALUES ('296', '21', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460888582', null);
INSERT INTO `pay_order` VALUES ('297', '21', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460888870', null);
INSERT INTO `pay_order` VALUES ('298', '21', '2', 'VIP会员半年', '0.01', '1', '4007842001201604174937295619', '1', '1', '1460889079', '20160417183146');
INSERT INTO `pay_order` VALUES ('299', '21', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460889387', null);
INSERT INTO `pay_order` VALUES ('300', '21', '2', 'VIP会员半年', '0.01', '1', '4007842001201604174938523477', '1', '1', '1460889706', '20160417184208');
INSERT INTO `pay_order` VALUES ('301', '21', '1', 'VIP会员1个月', '0.01', '1', '2016041721001004420254785165', '1', '1', '1460890010', '2016-04-17 18:47:17');
INSERT INTO `pay_order` VALUES ('302', '93', '6', '充值400金币', '0.01', '1', null, '0', '0', '1460943972', null);
INSERT INTO `pay_order` VALUES ('303', '75', '2', 'VIP会员半年', '0.01', '1', '2016041821001004670264474958', '1', '1', '1460964256', '2016-04-18 15:24:43');
INSERT INTO `pay_order` VALUES ('304', '44', '3', 'VIP会员1年', '0.01', '1', '4008692001201604184962595084', '1', '1', '1460964430', '20160418152726');
INSERT INTO `pay_order` VALUES ('305', '43', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460970928', null);
INSERT INTO `pay_order` VALUES ('306', '43', '2', 'VIP会员半年', '0.01', '1', null, '0', '0', '1460970930', null);
INSERT INTO `pay_order` VALUES ('307', '47', '1', 'VIP会员1个月', '0.01', '1', null, '0', '0', '1461058357', null);
INSERT INTO `pay_order` VALUES ('308', '21', '5', '充值150金币', '0.01', '1', '4007842001201604195005214696', '1', '1', '1461072507', '20160419212857');

-- ----------------------------
-- Table structure for pmessage
-- ----------------------------
DROP TABLE IF EXISTS `pmessage`;
CREATE TABLE `pmessage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `uid` int(10) unsigned DEFAULT NULL COMMENT '评论人id',
  `sid` int(10) unsigned DEFAULT NULL COMMENT '说说id',
  `p_time` varchar(50) DEFAULT '' COMMENT '评论时间',
  `p_content` varchar(600) DEFAULT '' COMMENT '评论内容',
  `p_status` tinyint(3) unsigned DEFAULT '0' COMMENT '是否审核 通过1',
  PRIMARY KEY (`id`),
  KEY `id_index` (`uid`,`sid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=160 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pmessage
-- ----------------------------
INSERT INTO `pmessage` VALUES ('1', '21', '12', '1457083721', 'aaaaaaa', '0');
INSERT INTO `pmessage` VALUES ('2', '21', '13', '1457083721', 'bbbbbbbbbb', '0');
INSERT INTO `pmessage` VALUES ('3', '21', '13', '1457083722', 'ccccccc', '1');
INSERT INTO `pmessage` VALUES ('4', '22', '12', '1457083722', 'ddddddd', '0');
INSERT INTO `pmessage` VALUES ('6', '21', '14', '1457169595', 'aaaaaaaaa', '0');
INSERT INTO `pmessage` VALUES ('7', '21', '15', '1457169604', 'ffffffff', '0');
INSERT INTO `pmessage` VALUES ('22', '21', '15', '1457174524', '亲戚', '0');
INSERT INTO `pmessage` VALUES ('52', '21', '15', '1457245561', 'QQ', '0');
INSERT INTO `pmessage` VALUES ('53', '21', '14', '1457313088', '11', '0');
INSERT INTO `pmessage` VALUES ('54', '22', '16', '1457314233', '复方丹参', '0');
INSERT INTO `pmessage` VALUES ('55', '22', '17', '1457320215', '发斯蒂芬', '0');
INSERT INTO `pmessage` VALUES ('56', '22', '17', '1457323039', '啥地方', '0');
INSERT INTO `pmessage` VALUES ('57', '21', '17', '1457402026', '111', '0');
INSERT INTO `pmessage` VALUES ('58', '21', '23', '1457403366', '11', '0');
INSERT INTO `pmessage` VALUES ('59', '17', '16', '1457508011', '奉公守法', '0');
INSERT INTO `pmessage` VALUES ('60', '17', '16', '1457527350', '啥地方', '0');
INSERT INTO `pmessage` VALUES ('61', '17', '16', '1457533333', '谷歌', '0');
INSERT INTO `pmessage` VALUES ('62', '21', '25', '1457572632', 'qqqqqq', '1');
INSERT INTO `pmessage` VALUES ('63', '21', '25', '1457572760', 'yyyyy', '0');
INSERT INTO `pmessage` VALUES ('64', '21', '26', '1457781615', '22222', '0');
INSERT INTO `pmessage` VALUES ('69', '32', '35', '1458196846', '1531531', '1');
INSERT INTO `pmessage` VALUES ('68', '32', '33', '1458196787', '4541', '0');
INSERT INTO `pmessage` VALUES ('70', '17', '35', '1458198742', '嘻嘻', '1');
INSERT INTO `pmessage` VALUES ('71', '17', '35', '1458198764', '阿斯蒂芬斯蒂芬', '1');
INSERT INTO `pmessage` VALUES ('72', '17', '33', '1458198770', '哈哈哈哈\n', '0');
INSERT INTO `pmessage` VALUES ('73', '31', '37', '1458205326', '猜猜猜。。。', '1');
INSERT INTO `pmessage` VALUES ('74', '31', '36', '1458206261', '啦啦啦啦啦', '0');
INSERT INTO `pmessage` VALUES ('75', '17', '43', '1458279242', 'asdfjskd sdf\n', '0');
INSERT INTO `pmessage` VALUES ('76', '17', '43', '1458280658', '2222', '0');
INSERT INTO `pmessage` VALUES ('77', '17', '42', '1458280678', 'fsdfsdf', '0');
INSERT INTO `pmessage` VALUES ('78', '17', '42', '1458280767', 'rerwer', '0');
INSERT INTO `pmessage` VALUES ('79', '17', '42', '1458280792', 'rwer', '0');
INSERT INTO `pmessage` VALUES ('80', '21', '44', '1458540232', '艹你大爷，哈哈哈哈', '1');
INSERT INTO `pmessage` VALUES ('81', '43', '44', '1458562511', '4855545', '0');
INSERT INTO `pmessage` VALUES ('82', '37', '49', '1458636957', '啊哈。。。。', '0');
INSERT INTO `pmessage` VALUES ('83', '37', '49', '1458637554', '止\n', '0');
INSERT INTO `pmessage` VALUES ('84', '38', '49', '1458639647', '啦啦啦。。。', '0');
INSERT INTO `pmessage` VALUES ('85', '37', '54', '1458714001', '圆顶jdlf', '1');
INSERT INTO `pmessage` VALUES ('86', '44', '55', '1458805735', '？？？啥啥啥', '1');
INSERT INTO `pmessage` VALUES ('87', '37', '75', '1459503843', 'HHHHHHHHHHH123', '1');
INSERT INTO `pmessage` VALUES ('88', '37', '78', '1459847837', '只是看看评论展示的', '1');
INSERT INTO `pmessage` VALUES ('89', '37', '87', '1460081779', '评论评论。。。。55555555555555', '1');
INSERT INTO `pmessage` VALUES ('90', '37', '87', '1460081799', '第二次评论咯。', '1');
INSERT INTO `pmessage` VALUES ('91', '44', '87', '1460081885', '我也说一句咯。shuodianshane', '1');
INSERT INTO `pmessage` VALUES ('92', '78', '87', '1460094808', '我差点就信了', '0');
INSERT INTO `pmessage` VALUES ('93', '43', '95', '1460164988', '22222222222222', '1');
INSERT INTO `pmessage` VALUES ('94', '43', '93', '1460164995', '33333333', '1');
INSERT INTO `pmessage` VALUES ('95', '43', '93', '1460165248', '的撒旦撒旦', '0');
INSERT INTO `pmessage` VALUES ('96', '43', '99', '1460166806', '玩蜀门', '1');
INSERT INTO `pmessage` VALUES ('97', '81', '99', '1460185001', 'ddd', '1');
INSERT INTO `pmessage` VALUES ('98', '54', '99', '1460194063', '好', '0');
INSERT INTO `pmessage` VALUES ('99', '54', '101', '1460205062', '哈哈哈啊', '0');
INSERT INTO `pmessage` VALUES ('100', '43', '101', '1460205695', 'klkllllllllkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', '0');
INSERT INTO `pmessage` VALUES ('101', '38', '104', '1460358375', '12152451251251512512121121524512512515125121211215245125125151251212112152451251251512512121', '1');
INSERT INTO `pmessage` VALUES ('102', '44', '105', '1460429188', '啦啦啦啦啦啦', '1');
INSERT INTO `pmessage` VALUES ('103', '38', '110', '1460519313', '啊啊啊啊', '1');
INSERT INTO `pmessage` VALUES ('104', '38', '110', '1460519320', '啊啊ass是', '1');
INSERT INTO `pmessage` VALUES ('105', '38', '110', '1460519326', '青蛙青蛙青蛙', '1');
INSERT INTO `pmessage` VALUES ('106', '38', '110', '1460519332', '噩噩噩噩噩噩', '1');
INSERT INTO `pmessage` VALUES ('107', '38', '110', '1460519336', '太太太太团', '1');
INSERT INTO `pmessage` VALUES ('108', '38', '110', '1460519341', '反对地方 ', '1');
INSERT INTO `pmessage` VALUES ('109', '38', '110', '1460519346', '演绎忐忑忐忑', '1');
INSERT INTO `pmessage` VALUES ('110', '38', '110', '1460519351', 'ccxcv', '1');
INSERT INTO `pmessage` VALUES ('111', '38', '110', '1460519357', '演绎忐忑他', '1');
INSERT INTO `pmessage` VALUES ('112', '38', '110', '1460519365', '婆婆婆婆', '1');
INSERT INTO `pmessage` VALUES ('113', '38', '110', '1460519370', '兰陵缭乱', '0');
INSERT INTO `pmessage` VALUES ('114', '38', '110', '1460519375', '那你们美女', '0');
INSERT INTO `pmessage` VALUES ('115', '38', '110', '1460519380', '呸呸呸呸呸', '0');
INSERT INTO `pmessage` VALUES ('116', '38', '110', '1460519389', '西村雄出席此次宣传宣传', '0');
INSERT INTO `pmessage` VALUES ('117', '38', '110', '1460519394', '重新出现', '0');
INSERT INTO `pmessage` VALUES ('118', '38', '110', '1460519398', '婆婆婆婆', '0');
INSERT INTO `pmessage` VALUES ('119', '38', '110', '1460519403', '地方vc', '0');
INSERT INTO `pmessage` VALUES ('120', '38', '110', '1460519412', '准备vcc', '0');
INSERT INTO `pmessage` VALUES ('121', '38', '110', '1460519417', 'ikkjjj', '0');
INSERT INTO `pmessage` VALUES ('122', '38', '110', '1460519423', '日卡卡卡卡角', '0');
INSERT INTO `pmessage` VALUES ('123', '38', '110', '1460519477', '撒旦撒旦撒', '0');
INSERT INTO `pmessage` VALUES ('124', '38', '110', '1460519482', 'cvcvc', '0');
INSERT INTO `pmessage` VALUES ('125', '38', '110', '1460519488', '中国高管股份', '0');
INSERT INTO `pmessage` VALUES ('126', '38', '110', '1460519494', '考虑考虑看了看', '0');
INSERT INTO `pmessage` VALUES ('127', '38', '110', '1460519498', 'poor', '0');
INSERT INTO `pmessage` VALUES ('128', '38', '110', '1460519504', '郁郁郁郁郁郁', '0');
INSERT INTO `pmessage` VALUES ('129', '38', '110', '1460519509', '在咨询在线咨询', '0');
INSERT INTO `pmessage` VALUES ('130', '38', '110', '1460519513', '在线咨询在线', '0');
INSERT INTO `pmessage` VALUES ('131', '38', '110', '1460519521', '青蛙青蛙青蛙青蛙', '0');
INSERT INTO `pmessage` VALUES ('132', '17', '110', '1460519623', '这么6666666666666666666666666', '0');
INSERT INTO `pmessage` VALUES ('133', '80', '119', '1460527941', '啊哈哈', '1');
INSERT INTO `pmessage` VALUES ('134', '80', '119', '1460527952', '11111111', '1');
INSERT INTO `pmessage` VALUES ('135', '80', '119', '1460527957', 'aaaaaaaa', '1');
INSERT INTO `pmessage` VALUES ('136', '80', '119', '1460527961', 'qqqqqqqq', '1');
INSERT INTO `pmessage` VALUES ('137', '80', '119', '1460527967', 'zzzzzzzzzzzzzzzzzzzzzzzzzzzz', '1');
INSERT INTO `pmessage` VALUES ('138', '80', '119', '1460527972', 'asadsadsadsadsadsad', '1');
INSERT INTO `pmessage` VALUES ('139', '44', '119', '1460528059', 'dfdsfsdfdsfsdf', '1');
INSERT INTO `pmessage` VALUES ('140', '44', '119', '1460528063', 'dfdfdsfsdf', '1');
INSERT INTO `pmessage` VALUES ('141', '75', '120', '1460528986', '鬼火鬼火鬼火鬼火', '1');
INSERT INTO `pmessage` VALUES ('142', '43', '120', '1460529025', '看看评论恢复怎么养了', '1');
INSERT INTO `pmessage` VALUES ('143', '43', '120', '1460529029', '打发打发', '1');
INSERT INTO `pmessage` VALUES ('144', '43', '120', '1460529034', '司法所地方', '1');
INSERT INTO `pmessage` VALUES ('145', '43', '120', '1460529039', '司法所地方斯蒂芬', '1');
INSERT INTO `pmessage` VALUES ('146', '43', '120', '1460529044', '司法所地方斯蒂芬', '1');
INSERT INTO `pmessage` VALUES ('147', '43', '120', '1460529048', '似懂非懂司法所地方', '1');
INSERT INTO `pmessage` VALUES ('151', '98', '124', '1460616496', '哈哈唯品侃侃', '1');
INSERT INTO `pmessage` VALUES ('152', '95', '124', '1460616526', 'caicaicaiciaiijdsfjksd', '1');
INSERT INTO `pmessage` VALUES ('150', '98', '124', '1460616487', 'ksdjfklsdjfkljsdklfj', '1');
INSERT INTO `pmessage` VALUES ('153', '95', '124', '1460616532', '1111111111', '1');
INSERT INTO `pmessage` VALUES ('154', '95', '124', '1460616552', '杨万里地喱哪里有嘿嘿田团团圆圆', '1');
INSERT INTO `pmessage` VALUES ('155', '98', '124', '1460616589', '1aaaas', '1');
INSERT INTO `pmessage` VALUES ('156', '98', '124', '1460616592', 'ddddd', '1');
INSERT INTO `pmessage` VALUES ('157', '98', '124', '1460616598', 'qqqqq', '1');
INSERT INTO `pmessage` VALUES ('158', '98', '124', '1460616601', 'aaaaa', '1');
INSERT INTO `pmessage` VALUES ('159', '98', '124', '1460616605', 'dfsdfsdfsd', '1');

-- ----------------------------
-- Table structure for session
-- ----------------------------
DROP TABLE IF EXISTS `session`;
CREATE TABLE `session` (
  `session_id` varchar(255) NOT NULL,
  `session_expire` int(11) NOT NULL,
  `session_data` blob,
  UNIQUE KEY `session_id` (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of session
-- ----------------------------
INSERT INTO `session` VALUES ('j01lgb6ku8ctgvmvd0abh40c72', '1461128709', 0x70686F6E657C733A31313A223133363131373430353933223B75736549647C733A323A223931223B6E616D657C733A31323A22E9929FE9B8A3E6B58BE8AF95223B7365787C733A313A2232223B);
INSERT INTO `session` VALUES ('08m98r8588vp9sq8s4dsrpegk6', '1461128634', '');
INSERT INTO `session` VALUES ('sklj39savni0pulqcstsslpl02', '1461128653', 0x70686F6E657C733A31313A223135313136333431353830223B75736549647C733A333A22313031223B6E616D657C733A31323A22E59BBDE6B091E8908CE58F94223B7365787C733A313A2231223B);

-- ----------------------------
-- Table structure for shenhe_info
-- ----------------------------
DROP TABLE IF EXISTS `shenhe_info`;
CREATE TABLE `shenhe_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '审核id',
  `comment_id` int(11) DEFAULT NULL COMMENT '评论说说id',
  `uid` int(11) DEFAULT NULL COMMENT '会员id',
  `love_id` int(11) DEFAULT NULL COMMENT '爱情宝典id',
  `img_id` int(11) DEFAULT NULL COMMENT '相册id',
  `message_id` int(11) DEFAULT NULL COMMENT '说说id',
  `content` varchar(500) DEFAULT '' COMMENT '审核内容',
  `shenhe_time` varchar(30) DEFAULT '' COMMENT '审核发送时间',
  PRIMARY KEY (`id`),
  KEY `uid_index` (`uid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=342 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shenhe_info
-- ----------------------------
INSERT INTO `shenhe_info` VALUES ('159', null, '38', '27', null, null, '您的成功故事已审核通过：', '1458708586');
INSERT INTO `shenhe_info` VALUES ('160', null, '21', '28', null, null, '您的成功故事已审核通过：', '1458708586');
INSERT INTO `shenhe_info` VALUES ('166', null, '54', null, '326', null, '您的相册已审核通过：<image style=\"height:50px;width:50px;\" src=\"/klzx/Public/Uploads/54/418db079041a5c0f08871267f38fc906.jpg\"/> ', '1458796676');
INSERT INTO `shenhe_info` VALUES ('168', null, '37', null, null, '57', '您的说说已审核通过：你改变不了环境，但你可以改变自己；你改变不了事实，但你可以改变态度；你改变不了过去，但你可以改变现在；你不能控制他人，但你可以掌握自己；你不能预知明天，但你可以把握今天；你不可以样样顺利，但你可以事事尽心；你不能延伸生命的长度，但你可以决定生命的宽度。', '1458805031');
INSERT INTO `shenhe_info` VALUES ('169', '86', '44', null, null, null, '您的评论已审核通过：？？？啥啥啥', '1458805985');
INSERT INTO `shenhe_info` VALUES ('171', null, '44', null, null, '58', '您的说说已审核通过：先审核说说，再审核图片，查看互动专区列表、说说列表展示问题', '1458806601');
INSERT INTO `shenhe_info` VALUES ('172', null, '38', null, '331', null, '您的图片已审核通过：<image style=\"height:50px;width:50px;\" src=\"/css/Public/Uploads/message/2016-03-24/56f39eeb2181b.jpg\"/> ', '1458806775');
INSERT INTO `shenhe_info` VALUES ('173', null, '38', null, null, '59', '您的说说已审核通过：这个说说是用来测试排名的', '1458806838');
INSERT INTO `shenhe_info` VALUES ('174', null, '21', null, null, '65', '您的说说已审核通过：uuuuuuuuuu      ', '1459253437');
INSERT INTO `shenhe_info` VALUES ('175', null, '21', null, null, '62', '您的说说已审核通过：22222', '1459253453');
INSERT INTO `shenhe_info` VALUES ('176', null, '21', null, null, '63', '您的说说已审核通过：哈哈哈哈哈啊啊啊啊啊啊啊啊啊啊啊啊啊啊', '1459253453');
INSERT INTO `shenhe_info` VALUES ('177', null, '21', null, null, '64', '您的说说已审核通过：哈哈哈哈哈啊啊啊啊啊啊啊啊啊啊啊啊啊啊', '1459253453');
INSERT INTO `shenhe_info` VALUES ('178', null, '21', null, null, '65', '您的说说已审核通过：uuuuuuuuuu      ', '1459253453');
INSERT INTO `shenhe_info` VALUES ('179', null, '21', null, null, '66', '您的说说已审核通过：11111111111111111111111111', '1459253454');
INSERT INTO `shenhe_info` VALUES ('180', null, '21', null, null, '67', '您的说说已审核通过：11111111111111111111111111', '1459253454');
INSERT INTO `shenhe_info` VALUES ('181', null, '44', null, '347', null, '您的图片已审核通过：<image style=\"height:50px;width:50px;\" src=\"/css/Public/Uploads/message/2016-04-01/56fe219805cbd.jpg\"/> ', '1459498804');
INSERT INTO `shenhe_info` VALUES ('183', null, '44', null, '349', null, '您的图片已审核通过：<image style=\"height:50px;width:50px;\" src=\"/css/Public/Uploads/message/2016-04-01/56fe356b9cfa9.jpg\"/> ', '1459500649');
INSERT INTO `shenhe_info` VALUES ('184', null, '44', null, null, '72', '您的说说已审核通过：查看说说排位哈。。。', '1459500709');
INSERT INTO `shenhe_info` VALUES ('185', null, '44', '32', null, null, '您的成功故事已审核通过：&lt;p&gt;成功故事发布后金币有奖励没成功故事发布后金币有奖励没成功故事发布后金币有奖励没成功故事发布后金币有奖励没&lt;/p&gt;', '1459501421');
INSERT INTO `shenhe_info` VALUES ('186', null, '37', null, '350', null, '您的图片已审核通过：<image style=\"height:50px;width:50px;\" src=\"/css/Public/Uploads/images/2016-04-01/56fe388109a37.jpg\"/> ', '1459501815');
INSERT INTO `shenhe_info` VALUES ('187', null, '37', null, '351', null, '您的图片已审核通过：<image style=\"height:50px;width:50px;\" src=\"/css/Public/Uploads/images/2016-04-01/56fe38830e1df.jpg\"/> ', '1459501815');
INSERT INTO `shenhe_info` VALUES ('188', null, '37', null, '352', null, '您的图片已审核通过：<image style=\"height:50px;width:50px;\" src=\"/css/Public/Uploads/images/2016-04-01/56fe3885259c0.jpeg\"/> ', '1459501815');
INSERT INTO `shenhe_info` VALUES ('189', null, '37', null, '353', null, '您的图片已审核通过：<image style=\"height:50px;width:50px;\" src=\"/css/Public/Uploads/images/2016-04-01/56fe3886e204f.jpeg\"/> ', '1459501816');
INSERT INTO `shenhe_info` VALUES ('190', null, '37', null, null, '71', '您的说说已审核通过：我只是测试列表展示的。。', '1459502779');
INSERT INTO `shenhe_info` VALUES ('191', null, '44', null, null, '69', '您的说说已审核通过：说点啥呢，说点啥呢，说点啥呢，说点啥呢，说点啥呢，说点啥呢，', '1459503035');
INSERT INTO `shenhe_info` VALUES ('192', null, '37', null, '348', null, '您的图片已审核通过：<image style=\"height:50px;width:50px;\" src=\"/css/Public/Uploads/message/2016-04-01/56fe34c8539f4.jpg\"/> ', '1459503236');
INSERT INTO `shenhe_info` VALUES ('193', null, '37', null, null, '70', '您的说说已审核通过：有个叫阿巴格的人生活在内蒙古草原上。有一次，年少的阿巴格和他爸爸在草原上迷了路，阿巴格又累又怕，到最后快走不动了。 爸爸就从兜里掏出5枚硬币，把一枚硬币埋在草地里，把其余4枚放在阿巴格的手上说，人生有5枚金币，童年、少年、青年、中年、老年各有一枚。 你现在才用了一枚，就是埋在草地里的那一枚，你不能把5枚都扔在草原里，你要一点点地用，每一次都用出不同来，这样才不枉人生一世。 今天我们一定要走出草原，你将来也一定要走出草原。世界很大，人活着，就要多走些地方，多看看，不要让你的金币没有用就扔掉。 在父亲的鼓励下，那天阿巴格走出了草原。长大后，阿巴格离开了家乡，成了一名优秀的船长。', '1459503305');
INSERT INTO `shenhe_info` VALUES ('194', null, '44', null, null, '75', '您的说说已审核通过：55555', '1459503614');
INSERT INTO `shenhe_info` VALUES ('195', null, '37', null, null, '74', '您的说说已审核通过：再花5金币', '1459503627');
INSERT INTO `shenhe_info` VALUES ('196', '87', '37', null, null, null, '您的评论已审核通过：HHHHHHHHHHH123', '1459504018');
INSERT INTO `shenhe_info` VALUES ('197', null, '37', null, null, '77', '您的说说已审核通过：20150405发一篇说说', '1459838243');
INSERT INTO `shenhe_info` VALUES ('198', null, '44', null, null, '79', '您的说说已审核通过：这个是20金币的说说', '1459838705');
INSERT INTO `shenhe_info` VALUES ('199', null, '38', null, null, '78', '您的说说已审核通过：20160405，下午14：32，花10金币发布一条说说', '1459847816');
INSERT INTO `shenhe_info` VALUES ('200', '88', '37', null, null, null, '您的评论已审核通过：只是看看评论展示的', '1459848079');
INSERT INTO `shenhe_info` VALUES ('201', null, '37', null, null, '82', '您的说说已审核通过：everythingeverythingeverythingeverythingeverythingeverythingeverythingeverythingeverythingeverythingeverythingeverything', '1460020446');
INSERT INTO `shenhe_info` VALUES ('202', null, '38', '33', null, null, '您的成功故事已审核通过：&lt;p&gt;这则故事 是测试前台 &amp;nbsp;后台故事内容展示的&lt;/p&gt;', '1460022125');
INSERT INTO `shenhe_info` VALUES ('203', null, '37', null, null, '83', '您的成功故事已审核通过：2016年4月7日 17：18分发布的说说：用来测试说说列表中排序是否正确2016年4月7日 17：18分发布的说说：用来测试说说列表中排序是否正确', '1460081255');
INSERT INTO `shenhe_info` VALUES ('204', null, '37', null, null, '86', '您的成功故事已审核通过：10.14发布的说说：批量审核一', '1460081741');
INSERT INTO `shenhe_info` VALUES ('205', null, '38', null, null, '87', '您的成功故事已审核通过：10.14发布这条说说，测试批量审核。。。10.14发布这条说说，测试批量审核。。。10.14发布这条说说，测试批量审核。。。10.14发布这条说说，测试批量审核。。。', '1460081741');
INSERT INTO `shenhe_info` VALUES ('206', '89', '37', null, null, null, '您的评论已审核通过：评论评论。。。。55555555555555', '1460081900');
INSERT INTO `shenhe_info` VALUES ('207', '90', '37', null, null, null, '您的评论已审核通过：第二次评论咯。', '1460081900');
INSERT INTO `shenhe_info` VALUES ('208', '91', '44', null, null, null, '您的评论已审核通过：我也说一句咯。shuodianshane', '1460081900');
INSERT INTO `shenhe_info` VALUES ('209', null, '54', null, null, '92', '您的说说已审核通过：是打发斯蒂芬就开始对方', '1460110666');
INSERT INTO `shenhe_info` VALUES ('210', null, '21', null, '362', null, '您的图片已审核通过：<image style=\"height:50px;width:50px;\" src=\"/klzx/Public/Uploads/21/df67132de664cf6e81fa9853438e6e94.png\"/> ', '1460159015');
INSERT INTO `shenhe_info` VALUES ('211', null, '69', null, '363', null, '您的图片已审核通过：<image style=\"height:50px;width:50px;\" src=\"/klzx/Public/Uploads/69/3b077517d9d990c242aa2c6a0b73efe1.png\"/> ', '1460159015');
INSERT INTO `shenhe_info` VALUES ('212', null, '70', null, '364', null, '您的图片已审核通过：<image style=\"height:50px;width:50px;\" src=\"/klzx/Public/Uploads/70/c4356f8509fd9e3c092b044c00f4e210.png\"/> ', '1460159015');
INSERT INTO `shenhe_info` VALUES ('213', null, '71', null, '370', null, '您的图片已审核通过：<image style=\"height:50px;width:50px;\" src=\"/klzx/Public/Uploads/71/1faf9c091e65a5d14f719e731c562cd1.jpg\"/> ', '1460159015');
INSERT INTO `shenhe_info` VALUES ('214', null, '71', null, '371', null, '您的图片已审核通过：<image style=\"height:50px;width:50px;\" src=\"/klzx/Public/Uploads/71/c706c42cd38e372c92bf196453be3250.jpg\"/> ', '1460159015');
INSERT INTO `shenhe_info` VALUES ('215', null, '73', null, '374', null, '您的图片已审核通过：<image style=\"height:50px;width:50px;\" src=\"/klzx/Public/Uploads/73/6b9d5f5896b9876dc659c03120521d83.jpg\"/> ', '1460159015');
INSERT INTO `shenhe_info` VALUES ('216', null, '43', null, '438', null, '您的图片已审核通过：<image style=\"height:50px;width:50px;\" src=\"/klzx/Public/Uploads/43/68afb4483b6964911774ef47d27b4dc7.jpg\"/> ', '1460159015');
INSERT INTO `shenhe_info` VALUES ('217', null, '43', null, '439', null, '您的图片已审核通过：<image style=\"height:50px;width:50px;\" src=\"/klzx/Public/Uploads/43/2e375012fd439569ac7cd2614f6bf628.jpg\"/> ', '1460159015');
INSERT INTO `shenhe_info` VALUES ('218', null, '43', null, '440', null, '您的图片已审核通过：<image style=\"height:50px;width:50px;\" src=\"/klzx/Public/Uploads/43/3bea622ce875e51d77eafae8d018f260.jpg\"/> ', '1460159015');
INSERT INTO `shenhe_info` VALUES ('219', null, '43', null, '441', null, '您的图片已审核通过：<image style=\"height:50px;width:50px;\" src=\"/klzx/Public/Uploads/43/8af9c024d96fe6f5433738adc7d567a9.jpg\"/> ', '1460159015');
INSERT INTO `shenhe_info` VALUES ('220', null, '37', null, null, '86', '您的成功故事已审核通过：10.14发布的说说：批量审核一', '1460159031');
INSERT INTO `shenhe_info` VALUES ('221', null, '38', null, null, '87', '您的成功故事已审核通过：10.14发布这条说说，测试批量审核。。。10.14发布这条说说，测试批量审核。。。10.14发布这条说说，测试批量审核。。。10.14发布这条说说，测试批量审核。。。', '1460159031');
INSERT INTO `shenhe_info` VALUES ('222', null, '38', null, null, '88', '您的成功故事已审核通过：当前金币8962，再发一条说说扣除2金币后，后台测试批量退款，能否退成功', '1460159031');
INSERT INTO `shenhe_info` VALUES ('223', null, '44', null, null, '89', '您的成功故事已审核通过：10.37发布说说（5金币）：测试后台批量退款，当前扣除后剩余金币3870', '1460159031');
INSERT INTO `shenhe_info` VALUES ('224', null, '37', null, null, '90', '您的成功故事已审核通过：10.39说说：5金币，测试后台批量退款', '1460159031');
INSERT INTO `shenhe_info` VALUES ('225', null, '54', null, null, '91', '您的成功故事已审核通过：是打发斯蒂芬就开始对方', '1460159031');
INSERT INTO `shenhe_info` VALUES ('226', null, '54', null, null, '92', '您的成功故事已审核通过：', '1460159031');
INSERT INTO `shenhe_info` VALUES ('227', null, '43', null, null, '93', '您的成功故事已审核通过：未完全恶趣味请问企鹅去', '1460159031');
INSERT INTO `shenhe_info` VALUES ('228', null, '43', null, '445', null, '您的相册已审核通过：<image style=\"height:50px;width:50px;\" src=\"/klzx/Public/Uploads/43/d94a3efb617a97c264708555d55a40e7.jpg\"/> ', '1460164842');
INSERT INTO `shenhe_info` VALUES ('229', null, '43', null, '444', null, '您的相册已审核通过：<image style=\"height:50px;width:50px;\" src=\"/klzx/Public/Uploads/43/06d4d1dc1f9567fd4da80bd3aa707f40.jpg\"/> ', '1460164843');
INSERT INTO `shenhe_info` VALUES ('230', null, '43', null, '443', null, '您的相册已审核通过：<image style=\"height:50px;width:50px;\" src=\"/klzx/Public/Uploads/43/f3a20daee51e9f0dd53e2f3621272fd0.jpg\"/> ', '1460164844');
INSERT INTO `shenhe_info` VALUES ('231', null, '43', null, null, '95', '您的说说已审核通过：111111111111111111111111', '1460164867');
INSERT INTO `shenhe_info` VALUES ('232', null, '43', null, null, '94', '您的说说已审核通过：撒旦撒旦撒', '1460164875');
INSERT INTO `shenhe_info` VALUES ('233', '93', '43', null, null, null, '您的评论已审核通过：22222222222222', '1460165045');
INSERT INTO `shenhe_info` VALUES ('234', '94', '43', null, null, null, '您的评论已审核通过：33333333', '1460165064');
INSERT INTO `shenhe_info` VALUES ('235', null, '43', '34', null, null, '您的成功故事已审核通过：&lt;p&gt;奖励十个金币659--669&lt;/p&gt;', '1460165088');
INSERT INTO `shenhe_info` VALUES ('236', null, '43', null, null, '96', '您的说说已审核通过：qqqqq', '1460165326');
INSERT INTO `shenhe_info` VALUES ('237', null, '43', null, null, '98', '您的说说已审核通过：说点什么', '1460166605');
INSERT INTO `shenhe_info` VALUES ('238', null, '43', null, null, '99', '您的说说已审核通过：说点什么', '1460166717');
INSERT INTO `shenhe_info` VALUES ('239', null, '37', null, null, '57', '您的成功故事已审核通过：', '1460166762');
INSERT INTO `shenhe_info` VALUES ('240', null, '38', null, null, '59', '您的成功故事已审核通过：', '1460166762');
INSERT INTO `shenhe_info` VALUES ('241', null, '37', null, null, '70', '您的成功故事已审核通过：', '1460166762');
INSERT INTO `shenhe_info` VALUES ('242', null, '44', null, null, '69', '您的成功故事已审核通过：', '1460166762');
INSERT INTO `shenhe_info` VALUES ('243', null, '37', null, null, '71', '您的成功故事已审核通过：我只是测试列表展示的。。', '1460166762');
INSERT INTO `shenhe_info` VALUES ('244', null, '44', null, null, '72', '您的成功故事已审核通过：', '1460166762');
INSERT INTO `shenhe_info` VALUES ('245', null, '43', null, null, '73', '您的成功故事已审核通过：wqeqweqweqweqwe', '1460166762');
INSERT INTO `shenhe_info` VALUES ('246', '96', '43', null, null, null, '您的评论已审核通过：玩蜀门', '1460166841');
INSERT INTO `shenhe_info` VALUES ('247', '97', '81', null, null, null, '您的评论已审核通过：ddd', '1460185014');
INSERT INTO `shenhe_info` VALUES ('248', null, '54', null, null, '100', '您的说说已审核通过：嗨，大家好、', '1460205032');
INSERT INTO `shenhe_info` VALUES ('249', null, '54', null, null, '101', '您的说说已审核通过：就好像八九十开吧肯定不及时报道vcmnsbdhdfjwreghduiwheuifh', '1460205045');
INSERT INTO `shenhe_info` VALUES ('250', null, '37', null, null, '102', '您的说说已审核通过：这条说说是测试发布的时间及评论时间的', '1460355580');
INSERT INTO `shenhe_info` VALUES ('251', null, '37', null, null, '103', '您的说说已审核通过：dfdsjkfdnfdsfdsfdsfdsfdsvcdv', '1460358244');
INSERT INTO `shenhe_info` VALUES ('252', null, '37', null, null, '104', '您的说说已审核通过：每个人有每个人的故事，每个人有每个人的悲喜，这是一个宽容的城市，所有悲哀最终都将消逝，遇见爱请不要掩饰，用真心去体会它的快乐真实！每个人有每个人的故事，每个人有每个人的悲喜，这是一个宽容的城市，所有悲哀最终都将消逝，遇见爱请不要掩饰，用真心去体会它的快乐真实！每个人有每个人的故事，每个人有每个人的悲喜，这是一个宽容的城市，所有悲哀最终都将消逝，遇见爱请不要掩饰，用真心去体会它的快乐真实！每个人有每个人的故事，每个人有每个人的悲喜，这是一个宽容的城市，所有悲哀最终都将消逝，遇见爱请不要掩饰，用真心去体会它的快乐真实！每个人有每个人的故事，每个人有每个人的悲喜，这是一个宽容的城市，所有悲哀最终都将消逝，遇见爱请不要掩饰，用真心去体会它的快乐真实！', '1460358330');
INSERT INTO `shenhe_info` VALUES ('253', '101', '38', null, null, null, '您的评论已审核通过：12152451251251512512121121524512512515125121211215245125125151251212112152451251251512512121', '1460358389');
INSERT INTO `shenhe_info` VALUES ('254', null, '37', '37', null, null, '您的成功故事已审核通过：&lt;p&gt;这个是查看后台有无记录奖励10金币这个是查看后台有无记录奖励10金币这个是查看后台有无记录奖励10金币这个是查看后台有无记录奖励10金币这个是查看后台有无记录奖励10金币这个是查看后台有无记录奖励10金币这个是查看后台有无记录奖励10金币这个是查看后台有无记录奖励10金币这个是查看后台有无记录奖励10金币&lt;/p&gt;&lt;p&gt;这个是查看后台有无记录奖励10金币这个是查看后台有无记录奖励10金币这个是查看后台有无记录奖励10金币这个是查看后台有无记录奖励10金币这个是查看后台有无记录奖励10金币这个是查看后台有无记录奖励10金币这个是查看后台有无记录奖励10金币&lt;/p&gt;&lt;p&gt;这个是查看后台有无记录奖励10金币这个是查看后台有无记录奖励10金币这个是查看后台有无记录奖励10金币这个是查看后台有无记录奖励10金币&lt;/p&gt;', '1460427308');
INSERT INTO `shenhe_info` VALUES ('255', null, '37', null, null, '105', '您的说说已审核通过：不必羡慕别人的精彩 你要活得自在不必羡慕别人的精彩 你要活得自在不必羡慕别人的精彩 你要活得自在不必羡慕别人的精彩 你要活得自在', '1460429127');
INSERT INTO `shenhe_info` VALUES ('256', '102', '44', null, null, null, '您的评论已审核通过：啦啦啦啦啦啦', '1460429198');
INSERT INTO `shenhe_info` VALUES ('257', null, '38', null, null, '106', '您的说说已审核通过：打扫打扫打扫的打扫打扫', '1460519245');
INSERT INTO `shenhe_info` VALUES ('258', null, '38', null, null, '107', '您的说说已审核通过：扫扫地', '1460519252');
INSERT INTO `shenhe_info` VALUES ('259', null, '38', null, null, '110', '您的说说已审核通过：宣传政策执行此次再次做出选择', '1460519260');
INSERT INTO `shenhe_info` VALUES ('260', null, '38', null, null, '109', '您的说说已审核通过：撒旦撒旦撒东西恰恰恰', '1460519276');
INSERT INTO `shenhe_info` VALUES ('261', null, '38', null, null, '108', '您的说说已审核通过：撒旦撒旦撒旦', '1460519282');
INSERT INTO `shenhe_info` VALUES ('262', '103', '38', null, null, null, '您的评论已审核通过：啊啊啊啊', '1460519434');
INSERT INTO `shenhe_info` VALUES ('263', '104', '38', null, null, null, '您的评论已审核通过：啊啊ass是', '1460519434');
INSERT INTO `shenhe_info` VALUES ('264', '105', '38', null, null, null, '您的评论已审核通过：青蛙青蛙青蛙', '1460519434');
INSERT INTO `shenhe_info` VALUES ('265', '106', '38', null, null, null, '您的评论已审核通过：噩噩噩噩噩噩', '1460519434');
INSERT INTO `shenhe_info` VALUES ('266', '107', '38', null, null, null, '您的评论已审核通过：太太太太团', '1460519434');
INSERT INTO `shenhe_info` VALUES ('267', '108', '38', null, null, null, '您的评论已审核通过：反对地方 ', '1460519434');
INSERT INTO `shenhe_info` VALUES ('268', '109', '38', null, null, null, '您的评论已审核通过：演绎忐忑忐忑', '1460519434');
INSERT INTO `shenhe_info` VALUES ('269', '110', '38', null, null, null, '您的评论已审核通过：ccxcv', '1460519434');
INSERT INTO `shenhe_info` VALUES ('270', '111', '38', null, null, null, '您的评论已审核通过：演绎忐忑他', '1460519434');
INSERT INTO `shenhe_info` VALUES ('271', '112', '38', null, null, null, '您的评论已审核通过：婆婆婆婆', '1460519434');
INSERT INTO `shenhe_info` VALUES ('272', null, '38', null, null, '111', '您的说说已审核通过：花了10金币 我在哪里？', '1460521333');
INSERT INTO `shenhe_info` VALUES ('273', null, '75', null, null, '112', '您的说说已审核通过：花了一个网站币，我又在哪里呢', '1460521396');
INSERT INTO `shenhe_info` VALUES ('274', null, '75', null, null, '113', '您的说说已审核通过：五个网站币我在那里', '1460521479');
INSERT INTO `shenhe_info` VALUES ('275', null, '46', null, null, '114', '您的说说已审核通过：hjhjhjhjhjhjhjhjhjhjhjhjhjhjhj', '1460521525');
INSERT INTO `shenhe_info` VALUES ('276', null, '75', null, null, '115', '您的说说已审核通过：花4个网站币我在哪里', '1460521594');
INSERT INTO `shenhe_info` VALUES ('277', null, '46', null, null, '116', '您的说说已审核通过：ghghgh', '1460521641');
INSERT INTO `shenhe_info` VALUES ('278', null, '38', '40', null, null, '您的成功故事已审核通过：&lt;p&gt;轻微区委区为轻微区委区为轻微区委区为轻微的撒旦撒旦杀毒杀掉撒旦撒旦撒旦撒旦撒旦轻微区委区为轻微区委区为轻微区委区为轻微的撒旦撒旦杀毒杀掉撒旦撒旦撒旦撒旦撒旦轻微区委区为轻微区委区为轻微区委区为轻微的撒旦撒旦杀毒杀掉撒旦撒旦撒旦撒旦撒旦轻微区委区为轻微区委区为轻微区委区为轻微的撒旦撒旦杀毒杀掉撒旦撒旦撒旦撒旦撒旦轻微区委区为轻微区委区为轻微区委区为轻微的撒旦撒旦杀毒杀掉撒旦撒旦撒旦撒旦撒旦轻微区委区为轻微区委区为轻微区委区为轻微的撒旦撒旦杀毒杀掉撒旦撒旦撒旦撒旦撒旦轻微区委区为轻微区委区为轻微区委区为轻微的撒旦撒旦杀毒杀掉撒旦撒旦撒旦撒旦撒旦轻微区委区为轻微区委区为轻微区委区为轻微的撒旦撒旦杀毒杀掉撒旦撒旦撒旦撒旦撒旦轻微区委区为轻微区委区为轻微区委区为轻微的撒旦撒旦杀毒杀掉撒旦撒旦撒旦撒旦撒旦轻微区委区为轻微区委区为轻微区委区为轻微的撒旦撒旦杀毒杀掉撒旦撒旦撒旦撒旦撒旦轻微区委区为轻微区委区为轻微区委区为轻微的撒旦撒旦杀毒杀掉撒旦撒旦撒旦撒旦撒旦轻&lt;/p&gt;', '1460522471');
INSERT INTO `shenhe_info` VALUES ('280', null, '21', null, '341', null, '您的相册已审核通过：<image style=\"height:50px;width:50px;\" src=\"/klzx/Public/Uploads/message/2016-03-29/56fa5072293f1.jpg\"/> ', '1460524021');
INSERT INTO `shenhe_info` VALUES ('281', null, '21', null, '298', null, '您的相册已审核通过：<image style=\"height:50px;width:50px;\" src=\"/klzx/Public/Uploads/message/2016-03-21/56ef8e1e1ab3f.jpg\"/> ', '1460524264');
INSERT INTO `shenhe_info` VALUES ('282', null, '21', null, '120', null, '您的相册已审核通过：<image style=\"height:50px;width:50px;\" src=\"/klzx/Public/Uploads/images/2016-03-03/56d81b33b9693.jpg\"/> ', '1460524267');
INSERT INTO `shenhe_info` VALUES ('283', null, '21', null, '121', null, '您的相册已审核通过：<image style=\"height:50px;width:50px;\" src=\"/klzx/Public/Uploads/images/2016-03-03/56d81b3424f48.jpg\"/> ', '1460524267');
INSERT INTO `shenhe_info` VALUES ('285', null, '21', null, '124', null, '您的相册已审核通过：<image style=\"height:50px;width:50px;\" src=\"/klzx/Public/Uploads/images/2016-03-03/56d81b355845a.jpg\"/> ', '1460524270');
INSERT INTO `shenhe_info` VALUES ('286', null, '21', null, '123', null, '您的相册已审核通过：<image style=\"height:50px;width:50px;\" src=\"/klzx/Public/Uploads/images/2016-03-03/56d81b34de5ef.jpg\"/> ', '1460524271');
INSERT INTO `shenhe_info` VALUES ('287', null, '21', null, '149', null, '您的相册已审核通过：<image style=\"height:50px;width:50px;\" src=\"/klzx/Public/Uploads/message/2016-03-04/56d955ca7810b.jpg\"/> ', '1460524273');
INSERT INTO `shenhe_info` VALUES ('288', null, '21', null, '148', null, '您的相册已审核通过：<image style=\"height:50px;width:50px;\" src=\"/klzx/Public/Uploads/message/2016-03-04/56d955c711479.jpg\"/> ', '1460524274');
INSERT INTO `shenhe_info` VALUES ('289', null, '21', null, '150', null, '您的相册已审核通过：<image style=\"height:50px;width:50px;\" src=\"/klzx/Public/Uploads/message/2016-03-04/56d9569d493b5.jpg\"/> ', '1460524275');
INSERT INTO `shenhe_info` VALUES ('290', null, '37', null, '278', null, '您的图片已审核通过：<image style=\"height:50px;width:50px;\" src=\"/klzx/Public/Uploads/37/bf6deb2622be7cd3b918e2c3ff1cab01.jpg\"/> ', '1460525298');
INSERT INTO `shenhe_info` VALUES ('291', null, '37', null, '279', null, '您的图片已审核通过：<image style=\"height:50px;width:50px;\" src=\"/klzx/Public/Uploads/37/08c4844587f60b09a44314d89567ce1c.jpg\"/> ', '1460525298');
INSERT INTO `shenhe_info` VALUES ('292', null, '18', null, '294', null, '您的图片已审核通过：<image style=\"height:50px;width:50px;\" src=\"/klzx/Public/Uploads/18/c11ccbdb0120f7afb48bf30ee404367f.jpg\"/> ', '1460525298');
INSERT INTO `shenhe_info` VALUES ('293', null, '42', null, '295', null, '您的图片已审核通过：<image style=\"height:50px;width:50px;\" src=\"/klzx/Public/Uploads/42/0d25d6a783ded4804efe4271b15b08f7.jpg\"/> ', '1460525298');
INSERT INTO `shenhe_info` VALUES ('294', null, '44', null, '306', null, '您的图片已审核通过：<image style=\"height:50px;width:50px;\" src=\"/klzx/Public/Uploads/44/58e30aff7df11328c4d436c58a993f1b.jpg\"/> ', '1460525298');
INSERT INTO `shenhe_info` VALUES ('295', null, '45', null, '307', null, '您的图片已审核通过：<image style=\"height:50px;width:50px;\" src=\"/klzx/Public/Uploads/45/a6b1ef36c2be34da91a54f6534058452.png\"/> ', '1460525298');
INSERT INTO `shenhe_info` VALUES ('296', null, '37', null, '320', null, '您的图片已审核通过：<image style=\"height:50px;width:50px;\" src=\"/klzx/Public/Uploads/37/682d194488e1f38b33de65889c3f540d.jpg\"/> ', '1460525298');
INSERT INTO `shenhe_info` VALUES ('297', null, '37', null, '321', null, '您的图片已审核通过：<image style=\"height:50px;width:50px;\" src=\"/klzx/Public/Uploads/37/0ec679f1ce5a5ab10da329de10218a5e.jpg\"/> ', '1460525298');
INSERT INTO `shenhe_info` VALUES ('298', null, '37', null, '322', null, '您的图片已审核通过：<image style=\"height:50px;width:50px;\" src=\"/klzx/Public/Uploads/37/0a59bfb2f74affa81fe55c3192f7e9cd.jpg\"/> ', '1460525298');
INSERT INTO `shenhe_info` VALUES ('299', null, '44', null, '323', null, '您的图片已审核通过：<image style=\"height:50px;width:50px;\" src=\"/klzx/Public/Uploads/44/bf71f3ae08fcc3a1aaa81f4ed0e5d09f.jpg\"/> ', '1460525298');
INSERT INTO `shenhe_info` VALUES ('300', null, '38', null, null, '117', '您的说说已审核通过：发生的发生', '1460527533');
INSERT INTO `shenhe_info` VALUES ('301', null, '80', null, null, '119', '您的说说已审核通过：岁月是朵两生花岁月是朵两生花岁月是朵两生花岁月是朵两生花岁月是朵两生花岁月是朵两生花岁月是朵两生花岁月是朵两生花岁月是朵两生花', '1460527921');
INSERT INTO `shenhe_info` VALUES ('302', '133', '80', null, null, null, '您的评论已审核通过：啊哈哈', '1460527983');
INSERT INTO `shenhe_info` VALUES ('303', '134', '80', null, null, null, '您的评论已审核通过：11111111', '1460527983');
INSERT INTO `shenhe_info` VALUES ('304', '135', '80', null, null, null, '您的评论已审核通过：aaaaaaaa', '1460527983');
INSERT INTO `shenhe_info` VALUES ('305', '136', '80', null, null, null, '您的评论已审核通过：qqqqqqqq', '1460527983');
INSERT INTO `shenhe_info` VALUES ('306', '137', '80', null, null, null, '您的评论已审核通过：zzzzzzzzzzzzzzzzzzzzzzzzzzzz', '1460527983');
INSERT INTO `shenhe_info` VALUES ('307', '138', '80', null, null, null, '您的评论已审核通过：asadsadsadsadsadsad', '1460527983');
INSERT INTO `shenhe_info` VALUES ('308', '139', '44', null, null, null, '您的评论已审核通过：dfdsfsdfdsfsdf', '1460528077');
INSERT INTO `shenhe_info` VALUES ('309', '140', '44', null, null, null, '您的评论已审核通过：dfdfdsfsdf', '1460528077');
INSERT INTO `shenhe_info` VALUES ('310', null, '43', null, null, '120', '您的说说已审核通过：说些什么呢，我想看看评论', '1460528914');
INSERT INTO `shenhe_info` VALUES ('311', '141', '75', null, null, null, '您的评论已审核通过：鬼火鬼火鬼火鬼火', '1460529057');
INSERT INTO `shenhe_info` VALUES ('312', '142', '43', null, null, null, '您的评论已审核通过：看看评论恢复怎么养了', '1460529057');
INSERT INTO `shenhe_info` VALUES ('313', '143', '43', null, null, null, '您的评论已审核通过：打发打发', '1460529057');
INSERT INTO `shenhe_info` VALUES ('314', '144', '43', null, null, null, '您的评论已审核通过：司法所地方', '1460529057');
INSERT INTO `shenhe_info` VALUES ('315', '145', '43', null, null, null, '您的评论已审核通过：司法所地方斯蒂芬', '1460529057');
INSERT INTO `shenhe_info` VALUES ('316', '146', '43', null, null, null, '您的评论已审核通过：司法所地方斯蒂芬', '1460529057');
INSERT INTO `shenhe_info` VALUES ('317', '147', '43', null, null, null, '您的评论已审核通过：似懂非懂司法所地方', '1460529057');
INSERT INTO `shenhe_info` VALUES ('318', '148', '37', null, null, null, '您的评论已审核通过：aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '1460539806');
INSERT INTO `shenhe_info` VALUES ('319', '149', '37', null, null, null, '您的评论已审核通过：aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '1460540041');
INSERT INTO `shenhe_info` VALUES ('320', null, '95', null, null, '122', '您的说说已审核通过：刚刚充值啦，有钱啦', '1460616206');
INSERT INTO `shenhe_info` VALUES ('321', null, '95', null, '528', null, '您的图片已审核通过：<image style=\"height:50px;width:50px;\" src=\"/klzx/Public/Uploads/95/1cc3433e2cb0be05c06f335fda2c64fd.png\"/> ', '1460616327');
INSERT INTO `shenhe_info` VALUES ('322', null, '97', null, '530', null, '您的图片已审核通过：<image style=\"height:50px;width:50px;\" src=\"/klzx/Public/Uploads/97/1685595d3d3a3a3dff0a4ae13960c84c.jpg\"/> ', '1460616327');
INSERT INTO `shenhe_info` VALUES ('323', null, '98', null, '531', null, '您的图片已审核通过：<image style=\"height:50px;width:50px;\" src=\"/klzx/Public/Uploads/98/6b04a73e95c8b5d465d1c689c5b37d70.png\"/> ', '1460616327');
INSERT INTO `shenhe_info` VALUES ('324', null, '96', null, '538', null, '您的图片已审核通过：<image style=\"height:50px;width:50px;\" src=\"/klzx/Public/Uploads/96/3516567d7b62e822a6b06aa2612b001f.jpg\"/> ', '1460616327');
INSERT INTO `shenhe_info` VALUES ('325', null, '96', null, null, '124', '您的成功故事已审核通过：风趣的围巾风趣的围巾风趣的围巾风趣的围巾', '1460616455');
INSERT INTO `shenhe_info` VALUES ('326', '150', '98', null, null, null, '您的评论已审核通过：ksdjfklsdjfkljsdklfj', '1460616563');
INSERT INTO `shenhe_info` VALUES ('327', '151', '98', null, null, null, '您的评论已审核通过：哈哈唯品侃侃', '1460616563');
INSERT INTO `shenhe_info` VALUES ('328', '152', '95', null, null, null, '您的评论已审核通过：caicaicaiciaiijdsfjksd', '1460616563');
INSERT INTO `shenhe_info` VALUES ('329', '153', '95', null, null, null, '您的评论已审核通过：1111111111', '1460616563');
INSERT INTO `shenhe_info` VALUES ('330', '154', '95', null, null, null, '您的评论已审核通过：杨万里地喱哪里有嘿嘿田团团圆圆', '1460616563');
INSERT INTO `shenhe_info` VALUES ('331', '155', '98', null, null, null, '您的评论已审核通过：1aaaas', '1460616623');
INSERT INTO `shenhe_info` VALUES ('332', '156', '98', null, null, null, '您的评论已审核通过：ddddd', '1460616623');
INSERT INTO `shenhe_info` VALUES ('333', '157', '98', null, null, null, '您的评论已审核通过：qqqqq', '1460616623');
INSERT INTO `shenhe_info` VALUES ('334', '158', '98', null, null, null, '您的评论已审核通过：aaaaa', '1460616623');
INSERT INTO `shenhe_info` VALUES ('335', '159', '98', null, null, null, '您的评论已审核通过：dfsdfsdfsd', '1460616623');
INSERT INTO `shenhe_info` VALUES ('336', null, '96', null, null, '125', '您的说说已审核通过：piliangshenheyoumeiyouyongha....piliangshenheyoumeiyouyongha', '1460617449');
INSERT INTO `shenhe_info` VALUES ('337', null, '96', '58', null, null, '您的成功故事已审核通过：&lt;p&gt;sdsfsdfsdfdsfsdfsdfdsf&lt;/p&gt;', '1460704123');
INSERT INTO `shenhe_info` VALUES ('338', null, '44', '60', null, null, '您的成功故事已审核通过：&lt;p&gt;我是一个粉刷匠，粉刷本领强&lt;/p&gt;&lt;p&gt;我要把那新房子，刷得很漂亮&lt;/p&gt;&lt;p&gt;我是一个粉刷匠，粉刷本领强&lt;/p&gt;&lt;p&gt;我要把那新房子，刷得很漂亮&lt;/p&gt;&lt;p&gt;我是一个粉刷匠，粉刷本领强&lt;/p&gt;&lt;p&gt;我要把那新房子，刷得很漂亮&lt;/p&gt;&lt;p&gt;我是一个粉刷匠，粉刷本领强&lt;/p&gt;&lt;p&gt;我要把那新房子，刷得很漂亮&lt;/p&gt;&lt;p&gt;我是一个粉刷匠，粉刷本领强&lt;/p&gt;&lt;p&gt;我要把那新房子，刷得很漂亮&lt;/p&gt;', '1460707401');
INSERT INTO `shenhe_info` VALUES ('339', null, '38', '61', null, null, '您的成功故事已审核通过：&lt;p&gt;我是一个粉刷匠，粉刷本领强&lt;br/&gt;我要把那新房子，刷得很漂亮&lt;br/&gt;我是一个粉刷匠，粉刷本领强&lt;/p&gt;', '1460710623');
INSERT INTO `shenhe_info` VALUES ('340', null, '99', null, '559', null, '您的相册已审核通过：<image style=\"height:50px;width:50px;\" src=\"/klzx/Public/Uploads/99/14a40799a4da3d49d60dcbd1e3d258b1.jpg\"/> ', '1460712703');
INSERT INTO `shenhe_info` VALUES ('341', null, '102', null, '561', null, '您的相册已审核通过：<image style=\"height:50px;width:50px;\" src=\"/klzx/Public/Uploads/102/cef6d73e382f0bb3fbf49868d0899d66.jpg\"/> ', '1460780040');

-- ----------------------------
-- Table structure for tuijian
-- ----------------------------
DROP TABLE IF EXISTS `tuijian`;
CREATE TABLE `tuijian` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tuijian_code` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `h_status` tinyint(2) DEFAULT '0' COMMENT '一个会员充值奖励状态',
  `j_status` tinyint(2) DEFAULT '0' COMMENT '三个会员奖励充值状态',
  `time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tuijian
-- ----------------------------
INSERT INTO `tuijian` VALUES ('4', '17', '93', '1', '0', '1460384619');
INSERT INTO `tuijian` VALUES ('5', '37', '95', '1', '1', '1460540659');
INSERT INTO `tuijian` VALUES ('6', '37', '96', '1', '1', '1460598761');
INSERT INTO `tuijian` VALUES ('7', '37', '97', '1', '1', '1460601142');
INSERT INTO `tuijian` VALUES ('8', '37', '98', '1', '0', '1460601796');
INSERT INTO `tuijian` VALUES ('9', '37', '17', '1', '0', '146060188');
INSERT INTO `tuijian` VALUES ('10', '38', '99', '1', '1', '1460709966');
INSERT INTO `tuijian` VALUES ('11', '38', '100', '1', '1', '1460711223');
INSERT INTO `tuijian` VALUES ('12', '38', '101', '1', '1', '1460712753');
INSERT INTO `tuijian` VALUES ('13', '102', '105', '1', '1', '1460776587');
INSERT INTO `tuijian` VALUES ('14', '102', '106', '1', '1', '1460776787');
INSERT INTO `tuijian` VALUES ('15', '102', '107', '1', '1', '1460776900');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `register_time` varchar(40) DEFAULT NULL COMMENT '注册时间',
  `login_time` varchar(40) DEFAULT '0',
  `birthday` date DEFAULT NULL,
  `sex` tinyint(2) DEFAULT NULL COMMENT '1男2女',
  `nick_name` varchar(30) DEFAULT NULL,
  `head_img` varchar(100) DEFAULT NULL,
  `constellation` varchar(20) DEFAULT NULL COMMENT '星座',
  `age` varchar(10) DEFAULT NULL,
  `education` varchar(20) DEFAULT NULL,
  `hometowns` varchar(50) DEFAULT NULL,
  `telphone` varchar(15) DEFAULT NULL,
  `qq` int(13) unsigned DEFAULT NULL COMMENT 'qq',
  `wixin` varchar(100) DEFAULT NULL,
  `marriage` varchar(11) DEFAULT NULL COMMENT '1表示未婚 2表示已婚',
  `job` varchar(50) DEFAULT NULL,
  `mon_money` varchar(12) DEFAULT NULL COMMENT '月收入',
  `height` varchar(12) DEFAULT NULL COMMENT '身高',
  `weigth` varchar(12) DEFAULT NULL,
  `vip` tinyint(3) DEFAULT '1' COMMENT '1为普通 2会员 3高级会员',
  `money` int(11) DEFAULT '0' COMMENT '恋爱币',
  `vip_start` int(11) DEFAULT NULL COMMENT 'vip开始时间',
  `vip_end` int(11) DEFAULT NULL COMMENT 'vip结束时间',
  `province` varchar(50) DEFAULT '' COMMENT '省',
  `city` varchar(50) DEFAULT '' COMMENT '市',
  `shiyong_tuijian_id` int(11) DEFAULT '0' COMMENT '每个人的推荐码为自己的user_id  这是已使用的推荐码',
  `is_jinyong` tinyint(1) DEFAULT '0' COMMENT '是否禁用',
  PRIMARY KEY (`user_id`),
  KEY `phone` (`phone`)
) ENGINE=MyISAM AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('17', '15616945257', null, 'dad0756bbb8bb75b1324eae6fe467421', '2016-03-01', '1461050460', '2012-12-04', '2', '哈哈哈', '/Uploads/17/968b9522275b0e4a821f45b729e2cbf5.jpg', '处女座', '3', '高中', '', '', '0', '', '已婚', 'app', '55', '144', '', '2', '999900005', '1459681840', '1464358250', '安徽省', '阜阳市', '0', '0');
INSERT INTO `user` VALUES ('54', '15616945256', null, '14e1b600b1fd579f47433b88e8d85291', '1458738043', '1460517462', '2012-12-04', '1', '短发飘飘不及腰', '/Uploads/54/418db079041a5c0f08871267f38fc906.jpg', '', '3', '', null, null, null, '', '', '', '', null, null, '2', '555499', '1325433600', '1327680000', '', '', '0', '0');
INSERT INTO `user` VALUES ('43', '17751556218', null, '878df162077904897369df74c93d6379', '1458528051', '1461111508', '2012-12-04', '1', 'AAAAAA', '/Uploads/43/d94a3efb617a97c264708555d55a40e7.jpg', '处女座', '3', '高中', null, '', '0', '', '未婚', '', '', '', '', '2', '8561', '1460902112', '1596722879', '', '', '0', '0');
INSERT INTO `user` VALUES ('21', '18874968273', null, 'ceaf6aed5903cd04a67973b084d2e18f', '1458528051', '1461115695', '2012-11-15', '2', '我是你的男神', '/Uploads/21/3886766e571f03e16d109c624a551339.jpg', '', '3', '', '问问', '3327167', null, '27282828', '', 'PHP', '10000', '', '', '2', '32136', '1461057148', '1461397501', '湖南省', '长沙市', '0', '0');
INSERT INTO `user` VALUES ('44', '15116317831', null, '9db06bcff9248837f86d1a6bcf41c9e7', '1458610277', '1461115078', '1988-08-26', '2', '一个人', '/Uploads/44/58e30aff7df11328c4d436c58a993f1b.jpg', '双鱼座', '27', '本科', null, '731', null, 'yjf123456', '', '出纳', '5500', '156', '45', '2', '3463', '1460964447', '1492500447', '广东省', '广州市', '0', '0');
INSERT INTO `user` VALUES ('45', '15616945200', null, 'dad0756bbb8bb75b1324eae6fe467421', '1458614610', '1458635693', '2012-12-02', '2', 'Christmas丶幻镜', '/assets/images/nohead.jpg', null, '3', null, null, null, null, null, null, null, null, null, null, '1', '0', null, null, '', '', '0', '0');
INSERT INTO `user` VALUES ('33', '18711034930', null, '14e1b600b1fd579f47433b88e8d85291', '1458272136', '1460446666', '1989-12-03', '2', '爱漏油的瓶子', '/assets/images/nohead.jpg', '处女座', '26', '本科', null, '', '0', '', '未婚', 'aaa', '12345', 'aaa', 'aaa', '2', '9960', null, null, '湖南省', '长沙市', '0', '0');
INSERT INTO `user` VALUES ('36', '15616945222', null, 'dad0756bbb8bb75b1324eae6fe467421', '1458284536', '1458284542', '2012-11-25', '2', '爱情灼心', '/assets/images/nohead.jpg', null, '3', null, null, null, null, null, null, null, null, null, null, '1', '0', null, null, '', '', '0', '0');
INSERT INTO `user` VALUES ('27', '15616945211', null, '14e1b600b1fd579f47433b88e8d85291', '1457945474', '1457945482', '2011-06-08', '1', '呼呼', '/assets/images/nohead.jpg', '处女座', null, '高中', null, '0', null, '0', '2', '', '4000', '', '', '1', '0', null, null, '', '', '0', '0');
INSERT INTO `user` VALUES ('29', '15608454829', null, '14e1b600b1fd579f47433b88e8d85291', '1458031846', '1458031852', '2012-08-18', '2', '15sjdfkasj', '/assets/images/nohead.jpg', '处女座', '3', '高中', null, '0', null, '0', '2', '', '123456', '', '', '2', '0', null, null, '', '', '0', '0');
INSERT INTO `user` VALUES ('101', '15116341580', null, '14e1b600b1fd579f47433b88e8d85291', '1460712753', '1461127173', '2012-12-20', '1', '国民萌叔', '/assets/images/nohead.jpg', '', '3', '', null, null, null, '', '', '', '', '', '', '2', '4142', '1460713125', '1476524325', '', '', '38', '0');
INSERT INTO `user` VALUES ('38', '15084750628', null, '550e1bafe077ff0b0b67f4e32f29d751', '1458288642', '1461028606', '1990-12-20', '2', '逗逼勿扰', '/Uploads/38/91bdcb17ebcd1f99e1da46b07efa0d0e.jpg', '射手座', '25', '大专', null, '88105728', '0', '15084750628', '未婚', '会计', '3500', '158', '42', '2', '8644', '1460705913', '1508053113', '湖南省', '长沙市', '0', '0');
INSERT INTO `user` VALUES ('39', '15616945288', null, '14e1b600b1fd579f47433b88e8d85291', '1458304202', '1461070741', '2012-12-03', '2', '勿念心安i', '/assets/images/nohead.jpg', null, '3', null, null, null, null, null, null, null, null, null, null, '2', '741', '1460940391', '1485477995', '', '', '0', '0');
INSERT INTO `user` VALUES ('40', '15616945333', null, '14e1b600b1fd579f47433b88e8d85291', '1458304415', '1461070838', '2012-12-10', '2', '啤9与老友', '/assets/images/nohead.jpg', '', '3', '', null, null, null, '', '', '', '', null, null, '2', '655', '1460940391', '1485477995', '', '', '0', '0');
INSERT INTO `user` VALUES ('41', '15111455555', null, '14e1b600b1fd579f47433b88e8d85291', '1458370618', '1461028786', '2012-12-20', '2', '终身不替代', '/assets/images/nohead.jpg', null, '3', null, null, null, null, null, null, null, null, null, null, '2', '9902', '1460705913', '1508053113', '', '', '0', '0');
INSERT INTO `user` VALUES ('46', '18921896638', null, '46cc468df60c961d8da2326337c7aa58', '1458648296', '1461123250', '2012-12-11', '2', '薄荷', '/assets/images/nohead.jpg', '双鱼座', '3', '本科', null, '', '0', 'alkdfjdsl', '未婚', '', '', '', '', '2', '3764', '1460902186', '1589465390', '江苏省', '盐城市', '0', '0');
INSERT INTO `user` VALUES ('47', '15111455509', null, '14e1b600b1fd579f47433b88e8d85291', '1458725109', '1461119359', '2012-12-04', '1', '管理员', '/assets/images/nohead.jpg', null, '3', null, null, null, null, null, null, null, null, null, null, '2', '9505', '1460705913', '1508053113', '', '', '0', '0');
INSERT INTO `user` VALUES ('81', '', '2179773081@qq.com', '878df162077904897369df74c93d6379', '1460154446', '1461108929', '2012-12-19', '2', '1号', '/assets/images/nohead.jpg', '', '3', '', null, null, null, '', '未婚', '', '', null, null, '2', '742', '1461041916', '1462031900', '', '', '0', '0');
INSERT INTO `user` VALUES ('56', '', '783324d154@qq.com', '14e1b600b1fd579f47433b88e8d85291', '1459239176', '0', '2012-12-03', '1', '啤9与老友', '/assets/images/nohead.jpg', null, '3', null, null, null, null, null, null, null, null, null, null, '1', '0', null, null, '', '', '0', '0');
INSERT INTO `user` VALUES ('57', '', '7899@qq.com', '14e1b600b1fd579f47433b88e8d85291', '1459239359', '0', '2012-11-27', '2', '荧光般温柔?', '/assets/images/nohead.jpg', null, '3', null, null, null, null, null, null, null, null, null, null, '1', '0', null, null, '', '', '0', '0');
INSERT INTO `user` VALUES ('58', '18273251836', null, '14e1b600b1fd579f47433b88e8d85291', '1459239537', '0', '2012-12-02', '1', '烟花柳巷红尘客', '/assets/images/nohead.jpg', null, '3', null, null, null, null, null, null, null, null, null, null, '1', '0', null, null, '', '', '0', '0');
INSERT INTO `user` VALUES ('59', '', '783ddd324154@qq.com', '14e1b600b1fd579f47433b88e8d85291', '1459240848', '0', '2012-12-02', '1', '陈随意', '/assets/images/nohead.jpg', null, '3', null, null, null, null, null, null, null, null, null, null, '1', '0', null, null, '', '', '0', '0');
INSERT INTO `user` VALUES ('60', '', '78331@qq.com', '14e1b600b1fd579f47433b88e8d85291', '1459240976', '0', '2012-12-03', '2', '用旅行来遗忘爱', '/assets/images/nohead.jpg', null, '3', null, null, null, null, null, null, null, null, null, null, '1', '0', null, null, '', '', '0', '0');
INSERT INTO `user` VALUES ('61', '', '7833241@qq.com', '14e1b600b1fd579f47433b88e8d85291', '1459241049', '0', '2012-11-25', '2', '后来少了你', '/assets/images/nohead.jpg', null, '3', null, null, null, null, null, null, null, null, null, null, '1', '0', null, null, '', '', '0', '0');
INSERT INTO `user` VALUES ('62', '', '156x@qq.com', '14e1b600b1fd579f47433b88e8d85291', '1459241185', '0', '2012-11-25', '1', '我是你的男神', '/assets/images/nohead.jpg', null, '3', null, null, null, null, null, null, null, null, null, null, '1', '0', null, null, '', '', '0', '0');
INSERT INTO `user` VALUES ('63', '', '78332dd4154@qq.com', '14e1b600b1fd579f47433b88e8d85291', '1459241495', '0', '2012-11-26', '1', '别再继续五媚', '/assets/images/nohead.jpg', null, '3', null, null, null, null, null, null, null, null, null, null, '1', '0', null, null, '', '', '0', '0');
INSERT INTO `user` VALUES ('82', '', '3367969202@qq.com', '878df162077904897369df74c93d6379', '1460155577', '1461108291', '2012-12-19', '2', '2号', '/assets/images/nohead.jpg', '', '3', '', null, null, null, '', '未婚', '', '', null, null, '2', '782', '0', '1524131226', '', '', '0', '0');
INSERT INTO `user` VALUES ('65', '', 'sdfahs@qq.com', '14e1b600b1fd579f47433b88e8d85291', '1459242818', '0', '2012-12-03', '1', '爱人终究属于狗', '/assets/images/nohead.jpg', null, '3', null, null, null, null, null, null, null, null, null, null, '1', '0', null, null, '', '', '0', '0');
INSERT INTO `user` VALUES ('68', '', 'asdf@qq.com', '14e1b600b1fd579f47433b88e8d85291', '1459515702', '0', '2012-12-03', '1', '国民萌叔', '/assets/images/nohead.jpg', null, '3', null, null, null, null, null, null, null, null, null, null, '1', '0', null, null, '', '', '0', '0');
INSERT INTO `user` VALUES ('69', '', 'afasdjf@qq.com', '14e1b600b1fd579f47433b88e8d85291', '1459515795', '1460965814', '2012-02-04', '1', '别再继续五媚', '/assets/images/nohead.jpg', '', '4', '大专', null, null, null, '', '', 'sdfas', '', '165', '60', '2', '10001', '1460678400', '1463327999', '山西省', '朔州市', '0', '0');
INSERT INTO `user` VALUES ('70', null, '123456@qq.com', '14e1b600b1fd579f47433b88e8d85291', '1459517096', '1459517179', '2012-12-02', '1', '万刧╮不复', '/assets/images/nohead.jpg', null, '3', null, null, null, null, null, null, null, null, null, null, '1', '0', null, null, '', '', '0', '0');
INSERT INTO `user` VALUES ('98', '18163674116', null, '14e1b600b1fd579f47433b88e8d85291', '1460601796', '1460707432', '1990-01-01', '1', '青春旳不羁', '/assets/images/nohead.jpg', '魔羯座', '26', '硕士', null, null, null, '', '未婚', 'aa', '', '170', '55', '1', '450', '1460649600', '1460649600', '广东省', '广州市', '37', '0');
INSERT INTO `user` VALUES ('87', '15005111104', '', '74be16979710d4c4e7c6647856088456', null, '0', null, '1', '虾兵', null, '', '', '', null, null, null, '', '', '', '', null, null, '2', '10000', '0', '0', '', '', '0', '0');
INSERT INTO `user` VALUES ('88', null, '783324154@qq.com', '14e1b600b1fd579f47433b88e8d85291', '1460173301', '1460697951', '2012-11-26', '1', '笑的狠牵强', '/assets/images/nohead.jpg', '处女座', '3', '高中', null, null, null, '', '已婚', '', '', '160', '', '2', '950', '1459699200', '1586707200', '辽宁省', '抚顺市', '0', '0');
INSERT INTO `user` VALUES ('74', null, '123456@qq.com', '14e1b600b1fd579f47433b88e8d85291', '1460020695', '1460020695', '2012-12-02', '1', '毁梦少年', '/assets/images/nohead.jpg', '狮子座', '3', '本科', null, null, null, null, '未婚', '', null, '160', 'dsf', '1', '0', null, null, '', '', '55', '0');
INSERT INTO `user` VALUES ('75', null, '350700223@qq.com', '14e1b600b1fd579f47433b88e8d85291', '1460083605', '1461056525', '2012-12-20', '2', '该死的懦弱', '/assets/images/nohead.jpg', '处女座', '3', '高中', null, '', '0', '', '未婚', '', '', '160', '46', '2', '9416', '1460964283', '1476775483', '', '', '0', '0');
INSERT INTO `user` VALUES ('99', null, '602050873@qq.com', '14e1b600b1fd579f47433b88e8d85291', '1460709966', '1461054720', '1989-04-20', '1', '怪咖叔叔', '/Uploads/99/14a40799a4da3d49d60dcbd1e3d258b1.jpg', '双鱼座', '27', '硕士', null, null, null, null, '未婚', '1212', null, '180', '75', '2', '44', '1460710955', '1492246955', '湖北省', '武汉市', '38', '0');
INSERT INTO `user` VALUES ('78', '15700767384', null, '14e1b600b1fd579f47433b88e8d85291', '1460094091', '1460094091', '2012-12-03', '1', 'つ匿名的好友', '/assets/images/nohead.jpg', '', '3', '', null, null, null, null, '', '', null, '', '', '1', '0', null, null, '', '', '0', '0');
INSERT INTO `user` VALUES ('84', '17751556218', '778012829@qq.com', '74be16979710d4c4e7c6647856088456', null, '0', null, '2', '请问', null, '', '', '', null, null, null, '', '未婚', '', '', null, null, '2', '10000', '1460940555', '1484268559', '', '', '0', '0');
INSERT INTO `user` VALUES ('86', '', '17751556218', '74be16979710d4c4e7c6647856088456', null, '0', null, '1', '', null, '', '', '', null, null, null, '', '未婚', '', '', null, null, '2', '0', null, null, '', '', '0', '0');
INSERT INTO `user` VALUES ('89', null, '8325904@qq.com', '878df162077904897369df74c93d6379', '1460190475', '1461067936', '2012-12-04', '2', '柠檬草的味道、', '/assets/images/nohead.jpg', '', '3', '', null, null, null, '', '', '', '', null, null, '2', '821', '1460940605', '1484150400', '', '', '0', '0');
INSERT INTO `user` VALUES ('102', '17751556704', null, '878df162077904897369df74c93d6379', '1460774911', '1461108180', '1988-11-08', '2', '十年浮夸终成孤独患者', '/Uploads/102/cef6d73e382f0bb3fbf49868d0899d66.jpg', '', '27', '', null, null, null, '', '', '', '', null, null, '2', '14', '1460775955', '1494903955', '', '', '0', '0');
INSERT INTO `user` VALUES ('91', '13611740593', '', '14e1b600b1fd579f47433b88e8d85291', '1458725109', '1461127203', '2012-12-04', '2', '钟鸣测试', '/assets/images/nohead.jpg', '', '3', '', '', '', null, '', '', '', '', '', '', '2', '9504', '1460796719', '1492332719', '', '', '0', '0');
INSERT INTO `user` VALUES ('93', null, '1126005112@qq.com', '14e1b600b1fd579f47433b88e8d85291', '1460384619', '1460943961', '2012-12-02', '2', '薄荷加冰i', '/assets/images/nohead.jpg', null, '3', null, null, null, null, null, null, null, null, null, null, '2', '403', '1460708464', '1494836464', '', '', '33334444', '0');
INSERT INTO `user` VALUES ('100', null, '1225007899@qq.com', '14e1b600b1fd579f47433b88e8d85291', '1460711223', '1461050225', '1991-12-10', '1', '★悱、蓅憾﹌', '/assets/images/nohead.jpg', '', '24', '', null, null, null, '', '', '', '', null, null, '2', '4', '1459848501', '1462009800', '', '', '38', '0');
INSERT INTO `user` VALUES ('97', '18569076152', null, '14e1b600b1fd579f47433b88e8d85291', '1460601142', '1460987987', '1987-12-20', '1', '笑的狠牵强', '/assets/images/nohead.jpg', '', '28', '', null, null, null, null, '未婚', '', null, '', '', '2', '1000', '1460707854', '1492243854', '', '', '37', '0');
INSERT INTO `user` VALUES ('103', '13814312691', null, '878df162077904897369df74c93d6379', '1460775494', '1460775494', '1988-11-08', '2', '岁月在水湾里', '/assets/images/nohead.jpg', null, '27', null, null, null, null, null, null, null, null, null, null, '1', '0', null, null, '', '', '0', '0');
INSERT INTO `user` VALUES ('104', null, 'a51556218@163.com', '878df162077904897369df74c93d6379', '1460775630', '1461107972', '1988-11-08', '2', '迷失的麋鹿', '/assets/images/nohead.jpg', '', '27', '', null, null, null, '', '', '', '', null, null, '2', '563', '1460942095', '1483492498', '', '', '0', '0');
INSERT INTO `user` VALUES ('105', null, 'b51556218@163.com', '878df162077904897369df74c93d6379', '1460776587', '1461106288', '1990-12-26', '2', '带着爱意奔波四方', '/assets/images/nohead.jpg', '', '25', '', null, null, null, '', '', '', '', null, null, '2', '463', '1460776659', '1478834259', '', '', '102', '0');
INSERT INTO `user` VALUES ('106', null, 'c51556218@163.com', '878df162077904897369df74c93d6379', '1460776787', '1461110142', '2012-12-19', '1', '柠檬草的味道、', '/assets/images/nohead.jpg', '', '3', '', null, null, null, '', '', '', '', null, null, '2', '683', '1460776817', '1495077617', '', '', '102', '0');
INSERT INTO `user` VALUES ('107', null, 'd51556218@163.com', '878df162077904897369df74c93d6379', '1460776900', '1461110177', '2012-12-11', '1', '短发飘飘不及腰', '/assets/images/nohead.jpg', '', '3', '', null, null, null, '', '', '', '', null, null, '2', '701', '1460776928', '1463368928', '', '', '102', '0');
INSERT INTO `user` VALUES ('108', null, 'e51556218@163.com', '878df162077904897369df74c93d6379', '1461061693', '1461109565', '2012-12-20', '2', '风趣的围巾', '/assets/images/nohead.jpg', '', '3', '', null, null, null, '', '', '', '', null, null, '2', '782', '1461062040', '1492598044', '', '', '0', '0');
INSERT INTO `user` VALUES ('109', null, 'f51556218@163.com', '878df162077904897369df74c93d6379', '1461061773', '1461110374', '2012-12-20', '2', '夏日暖男', '/assets/images/nohead.jpg', '', '3', '', null, null, null, '', '', '', '', null, null, '2', '742', '1461062096', '1484130900', '', '', '0', '0');
INSERT INTO `user` VALUES ('110', null, 'm51556218@163.com', '878df162077904897369df74c93d6379', '1461061908', '0', '2012-12-20', '1', 'つ匿名的好友', '/assets/images/nohead.jpg', null, '3', null, null, null, null, null, null, null, null, null, null, '1', '0', null, null, '', '', '0', '0');

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) DEFAULT NULL,
  `is_boy` varchar(50) DEFAULT NULL COMMENT '是否要小孩',
  `is_address` varchar(50) DEFAULT NULL COMMENT '是否接受异地 1接受 2不接受',
  `is_sex` varchar(50) DEFAULT NULL COMMENT '是否接受性行为 1接受2不接受',
  `is_withparent` varchar(50) DEFAULT NULL COMMENT '是否父母同住 1接受 2不接受',
  `meili` varchar(100) DEFAULT '' COMMENT '魅力部位',
  `hobby` varchar(150) DEFAULT '' COMMENT '兴趣爱好',
  `personality` varchar(150) DEFAULT NULL COMMENT '个性',
  `dubai` varchar(500) DEFAULT '' COMMENT '独白',
  `images` varchar(500) DEFAULT '' COMMENT '图片',
  `is_renzheng` tinyint(3) DEFAULT '0' COMMENT '是否认证1为认证',
  `renzheng_info` varchar(100) DEFAULT NULL,
  `all_hobby` varchar(300) DEFAULT NULL,
  `all_personality` varchar(300) DEFAULT NULL,
  `renzheng_birthday` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pid_index` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('1', null, null, null, null, null, '', '', null, '', '', null, '这2行数据不可删除', '上网,汽车,宠物,摄影,电影,音乐,写作,购物,手艺,园艺,跳舞,展览,烹饪,读书,绘画,运动,游戏,旅游,其他', '孝顺,小资,善良,好强,冷落,温柔,好动,宅控,爱心,可爱,随和', null);
INSERT INTO `user_info` VALUES ('2', null, null, null, null, null, '', '', null, '', '', null, null, '上网,汽车,宠物,摄影,电影,音乐,写作,购物,手艺,园艺,跳舞,展览,烹饪,读书,绘画,运动,游戏,旅游,其他', '孝顺,小资,善良,好强,冷落,温柔,好动,宅控,爱心,可爱,随和', null);
INSERT INTO `user_info` VALUES ('3', '22', '', '接受', '', '', '眼睛', '摄影,写作,展览,烹饪,游戏', '善良,冷落', '失去的你无人可以替代', '', null, null, null, null, null);
INSERT INTO `user_info` VALUES ('5', '24', '不要', '', '能', '愿意', '胸部', '读书', '冷落', '撒旦范德萨范德萨', '', null, null, null, null, null);
INSERT INTO `user_info` VALUES ('4', '21', '要', '接受', '能', '愿意', '脸部', '汽车,宠物,摄影,电影,读书,绘画', '小资,善良,冷落,温柔,好动', '我的独白：哈哈哈', '', '1', '黄潇地址:湖南省常德市澧县', null, null, '1990-01-27');
INSERT INTO `user_info` VALUES ('6', '26', '', '', '', '', '', '宠物,摄影,烹饪,读书', '善良,好强', '', '', '0', null, null, null, null);
INSERT INTO `user_info` VALUES ('7', '17', '不要', '不接受', '能', '愿意', '脑袋', '宠物,摄影,电影,购物,烹饪,绘画,旅游', '善良,好强,温柔,好动,可爱,随和', '失去的你无人可以替代', '', '1', '', null, null, '1992-10-17');
INSERT INTO `user_info` VALUES ('8', '18', '', '', '', '', '', '上网,宠物,音乐,写作,烹饪,运动,游戏', '善良,好强,好动', '啥地方', '', '0', null, null, null, null);
INSERT INTO `user_info` VALUES ('9', '27', '', '', '', '', '', '汽车,读书', '好强', '', '', '1', '', null, null, '1992-10-17');
INSERT INTO `user_info` VALUES ('10', '29', '要', '接受', '能', '愿意', '胸部', '上网,汽车,宠物,电影,音乐,跳舞,展览,烹饪,绘画,运动', '孝顺,小资,善良,好强,冷落,温柔,好动', '', '', '0', null, null, null, null);
INSERT INTO `user_info` VALUES ('11', '28', '要', '接受', '能', '愿意', '眼睛', '摄影,电影,烹饪,运动', '孝顺,善良,随和', 'waiting for you', '', '1', '刘青地址:湖南省岳阳市市辖区', null, null, '1988-01-01');
INSERT INTO `user_info` VALUES ('12', '31', '要', '不接受', '不能', '愿意', '眼睛', '电影,读书,运动,旅游', '善良,爱心,随和', '人生最重要的并不是努力，而是方向。压力不是有人比你努力，而是比你牛叉几倍的人依然比你努力。即使看不到未来，即使看不到希望，也依然相信，自己错不了，自己选的人错不了，自己选的人生错不了...', '', '1', '彭莎地址:湖南省长沙市望城县', null, null, '1989-11-23');
INSERT INTO `user_info` VALUES ('13', '1', '', '', '', '', '', '汽车', '小资,善良,随和', '', '', '0', null, null, null, null);
INSERT INTO `user_info` VALUES ('14', '32', '要', '接受', '能', '愿意', '双腿', '摄影,绘画,运动,旅游', '小资,善良,爱心,随和', '', '', '1', '张妮妮地址:湖南省长沙市市辖区', null, null, '1986-06-10');
INSERT INTO `user_info` VALUES ('15', '36', '', '', '', '', '', '上网,汽车,宠物,跳舞,展览,烹饪', '孝顺,小资,善良,可爱,随和', '', '', '0', null, null, null, null);
INSERT INTO `user_info` VALUES ('16', '37', '要', '接受', '能', '愿意', '脸部', '电影,读书,运动,旅游', '孝顺,爱心,随和', '每个人有每个人的故事，每个人有每个人的悲喜，这是一个宽容的城市，所有悲哀最终都将消逝，遇见爱请不要掩饰，用真心去体会它的快乐真实！', '', '1', '李木子地址:湖南省岳阳市市辖区', null, null, '1990-01-01');
INSERT INTO `user_info` VALUES ('17', '38', '要', '接受', '能', '愿意', '脸部', '宠物,烹饪,运动,旅游', '温柔,爱心,随和', '感情是个永久的话题，那是因为受伤的人太多太多。我们说不完，忘不掉，希望遇到一个能够相爱的人！！！！世界上最难断的是感情，最难求的是爱情，最难还的人情，最难得的是友情，最难分的亲情，最难找的是真情，最想看的是你微笑的表情！', '', '1', '杜冰地址:湖南省岳阳市市辖区', null, null, '1990-01-01');
INSERT INTO `user_info` VALUES ('18', '42', '要', '接受', '能', '愿意', '脸部', '上网,烹饪,旅游', '孝顺,温柔,随和', '一首歌听了很久，也总是没听够，因为有情；一个人爱了很久，也舍不得放手，因为用心。不是每个相遇的人，都会天长地久；不是每份动心的情，都能相守白头。唱过的歌，只能在心底保留；离开的人，只能在回忆中聚首。要有多坚强，才能不泪流；要有多洒脱，才能不失落。听过的歌，情难舍；爱过的人，心难忘。', '', '1', '黄丫丫地址:广东省佛山市市辖区', null, null, '1990-01-01');
INSERT INTO `user_info` VALUES ('19', '44', '要', '不接受', '不能', '愿意', '脸部', '汽车,宠物,摄影,电影,音乐,写作,购物,手艺,展览,烹饪,读书,绘画,运动,游戏,旅游,其他', '孝顺,善良,冷落,爱心,随和', '走过的路长了，遇见的人多了，经历的事杂了。不经意间发现，人生最曼妙的风景是内心的淡定与从容，头脑的睿智与清醒。人生最奢侈的拥有是一颗不老的童心，一个生生不息的信念，一个健康的身体，一个永远牵手的爱人。一个自由的心态，一份喜欢的工作，一份安稳的睡眠，一份享受生活的美好心情。', '', '1', '杨杨地址:湖南省岳阳市市辖区', null, null, '1990-01-01');
INSERT INTO `user_info` VALUES ('20', '45', '', '', '', '', '', '汽车,展览', null, '', '', '0', null, null, null, null);
INSERT INTO `user_info` VALUES ('21', '54', '', '', '', '', '', '上网,跳舞', null, '', '', '0', null, null, null, null);
INSERT INTO `user_info` VALUES ('22', '72', null, null, null, null, '', '', null, '该用户注册时有填推荐码，后面用来 测试会员 充值', '', '0', null, null, null, null);
INSERT INTO `user_info` VALUES ('23', '43', '要', '', '能', '', '双腿', '上网,展览', '小资,好强', '的分身乏术放松放松的放松放松的放松放松', '', '1', '陈良地址:江苏省盐城市亭湖区', null, null, '1983-03-13');
INSERT INTO `user_info` VALUES ('24', '46', null, null, null, null, '', '', null, '', '', '1', '陈良地址:江苏省盐城市亭湖区', null, null, '1983-03-13');
INSERT INTO `user_info` VALUES ('25', '33', '', '', '', '', '', '购物,跳舞,烹饪,运动', '孝顺,善良,好强,爱心', '', '', '0', null, null, null, null);

-- ----------------------------
-- Table structure for visit_info
-- ----------------------------
DROP TABLE IF EXISTS `visit_info`;
CREATE TABLE `visit_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `visit_id` int(11) DEFAULT NULL,
  `bvisit_id` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0' COMMENT '是否被访问 访问了：1',
  PRIMARY KEY (`id`),
  KEY `visit_index` (`visit_id`,`bvisit_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=219 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of visit_info
-- ----------------------------
INSERT INTO `visit_info` VALUES ('9', '21', '22', '1');
INSERT INTO `visit_info` VALUES ('10', '22', '21', '1');
INSERT INTO `visit_info` VALUES ('11', '17', '21', '1');
INSERT INTO `visit_info` VALUES ('12', '21', '17', '1');
INSERT INTO `visit_info` VALUES ('13', '21', '21', '1');
INSERT INTO `visit_info` VALUES ('14', '18', '18', '1');
INSERT INTO `visit_info` VALUES ('15', '18', '21', '1');
INSERT INTO `visit_info` VALUES ('24', '18', '23', '1');
INSERT INTO `visit_info` VALUES ('25', '18', '17', '1');
INSERT INTO `visit_info` VALUES ('29', '27', '21', '1');
INSERT INTO `visit_info` VALUES ('30', '17', '26', '1');
INSERT INTO `visit_info` VALUES ('31', '17', '24', '1');
INSERT INTO `visit_info` VALUES ('42', '31', '28', '1');
INSERT INTO `visit_info` VALUES ('43', '1', '18', '1');
INSERT INTO `visit_info` VALUES ('44', '31', '32', '1');
INSERT INTO `visit_info` VALUES ('47', '31', '22', '1');
INSERT INTO `visit_info` VALUES ('48', '31', '20', '1');
INSERT INTO `visit_info` VALUES ('56', '31', '17', '1');
INSERT INTO `visit_info` VALUES ('60', '17', '32', '1');
INSERT INTO `visit_info` VALUES ('62', '32', '31', '1');
INSERT INTO `visit_info` VALUES ('66', '17', '31', '1');
INSERT INTO `visit_info` VALUES ('71', '28', '31', '1');
INSERT INTO `visit_info` VALUES ('72', '17', '28', '1');
INSERT INTO `visit_info` VALUES ('77', '17', '36', '1');
INSERT INTO `visit_info` VALUES ('80', '38', '37', '1');
INSERT INTO `visit_info` VALUES ('81', '37', '38', '1');
INSERT INTO `visit_info` VALUES ('84', '17', '18', '1');
INSERT INTO `visit_info` VALUES ('88', '41', '17', '1');
INSERT INTO `visit_info` VALUES ('98', '18', '41', '1');
INSERT INTO `visit_info` VALUES ('106', '43', '17', '1');
INSERT INTO `visit_info` VALUES ('107', '17', '42', '1');
INSERT INTO `visit_info` VALUES ('108', '43', '18', '1');
INSERT INTO `visit_info` VALUES ('111', '37', '44', '1');
INSERT INTO `visit_info` VALUES ('115', '18', '44', '1');
INSERT INTO `visit_info` VALUES ('120', '18', '38', '1');
INSERT INTO `visit_info` VALUES ('121', '38', '44', '1');
INSERT INTO `visit_info` VALUES ('122', '18', '43', '1');
INSERT INTO `visit_info` VALUES ('123', '17', '38', '1');
INSERT INTO `visit_info` VALUES ('124', '17', '44', '1');
INSERT INTO `visit_info` VALUES ('125', '17', '43', '1');
INSERT INTO `visit_info` VALUES ('126', '45', '18', '1');
INSERT INTO `visit_info` VALUES ('127', '45', '43', '1');
INSERT INTO `visit_info` VALUES ('128', '17', '45', '1');
INSERT INTO `visit_info` VALUES ('129', '45', '22', '1');
INSERT INTO `visit_info` VALUES ('130', '45', '37', '1');
INSERT INTO `visit_info` VALUES ('131', '45', '17', '1');
INSERT INTO `visit_info` VALUES ('132', '45', '38', '1');
INSERT INTO `visit_info` VALUES ('133', '45', '41', '1');
INSERT INTO `visit_info` VALUES ('134', '37', '45', '1');
INSERT INTO `visit_info` VALUES ('135', '17', '37', '1');
INSERT INTO `visit_info` VALUES ('141', '43', '44', '1');
INSERT INTO `visit_info` VALUES ('147', '44', '37', '1');
INSERT INTO `visit_info` VALUES ('148', '50', '44', '1');
INSERT INTO `visit_info` VALUES ('149', '54', '21', '1');
INSERT INTO `visit_info` VALUES ('152', '44', '38', '1');
INSERT INTO `visit_info` VALUES ('153', '37', '54', '1');
INSERT INTO `visit_info` VALUES ('154', '54', '43', '1');
INSERT INTO `visit_info` VALUES ('156', '54', '37', '1');
INSERT INTO `visit_info` VALUES ('157', '54', '17', '1');
INSERT INTO `visit_info` VALUES ('159', '54', '22', '1');
INSERT INTO `visit_info` VALUES ('171', '47', '45', '1');
INSERT INTO `visit_info` VALUES ('172', '64', '47', '1');
INSERT INTO `visit_info` VALUES ('173', '21', '37', '1');
INSERT INTO `visit_info` VALUES ('174', '21', '44', '1');
INSERT INTO `visit_info` VALUES ('175', '37', '21', '1');
INSERT INTO `visit_info` VALUES ('176', '37', '17', '1');
INSERT INTO `visit_info` VALUES ('177', '46', '21', '1');
INSERT INTO `visit_info` VALUES ('178', '46', '22', '1');
INSERT INTO `visit_info` VALUES ('179', '43', '57', '1');
INSERT INTO `visit_info` VALUES ('180', '38', '17', '1');
INSERT INTO `visit_info` VALUES ('181', '47', '78', '1');
INSERT INTO `visit_info` VALUES ('182', '79', '47', '1');
INSERT INTO `visit_info` VALUES ('183', '79', '37', '1');
INSERT INTO `visit_info` VALUES ('184', '43', '54', '1');
INSERT INTO `visit_info` VALUES ('185', '82', '27', '1');
INSERT INTO `visit_info` VALUES ('186', '43', '82', '1');
INSERT INTO `visit_info` VALUES ('187', '43', '46', '1');
INSERT INTO `visit_info` VALUES ('188', '46', '43', '1');
INSERT INTO `visit_info` VALUES ('189', '46', '17', '1');
INSERT INTO `visit_info` VALUES ('190', '88', '89', '1');
INSERT INTO `visit_info` VALUES ('191', '88', '41', '1');
INSERT INTO `visit_info` VALUES ('192', '40', '54', '1');
INSERT INTO `visit_info` VALUES ('193', '54', '40', '1');
INSERT INTO `visit_info` VALUES ('194', '40', '43', '1');
INSERT INTO `visit_info` VALUES ('195', '54', '44', '1');
INSERT INTO `visit_info` VALUES ('196', '80', '37', '1');
INSERT INTO `visit_info` VALUES ('197', '37', '75', '1');
INSERT INTO `visit_info` VALUES ('198', '33', '38', '1');
INSERT INTO `visit_info` VALUES ('199', '21', '33', '1');
INSERT INTO `visit_info` VALUES ('200', '47', '64', '1');
INSERT INTO `visit_info` VALUES ('201', '38', '75', '1');
INSERT INTO `visit_info` VALUES ('202', '75', '38', '1');
INSERT INTO `visit_info` VALUES ('203', '38', '33', '1');
INSERT INTO `visit_info` VALUES ('204', '38', '46', '1');
INSERT INTO `visit_info` VALUES ('205', '43', '21', '1');
INSERT INTO `visit_info` VALUES ('206', '43', '38', '1');
INSERT INTO `visit_info` VALUES ('207', '43', '40', '1');
INSERT INTO `visit_info` VALUES ('208', '43', '93', '1');
INSERT INTO `visit_info` VALUES ('209', '43', '86', '1');
INSERT INTO `visit_info` VALUES ('210', '80', '43', '1');
INSERT INTO `visit_info` VALUES ('211', '98', '37', '1');
INSERT INTO `visit_info` VALUES ('212', '95', '96', '1');
INSERT INTO `visit_info` VALUES ('213', '21', '96', '1');
INSERT INTO `visit_info` VALUES ('214', '88', '47', '1');
INSERT INTO `visit_info` VALUES ('215', '102', '43', '1');
INSERT INTO `visit_info` VALUES ('216', '21', '102', '1');
INSERT INTO `visit_info` VALUES ('217', '17', '46', '1');
INSERT INTO `visit_info` VALUES ('218', '47', '102', '1');

-- ----------------------------
-- Table structure for youxiu_img
-- ----------------------------
DROP TABLE IF EXISTS `youxiu_img`;
CREATE TABLE `youxiu_img` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `xingxi` varchar(100) DEFAULT '' COMMENT '信息',
  `position` tinyint(3) unsigned DEFAULT '0' COMMENT '推荐位',
  `img` varchar(150) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `uid_index` (`xingxi`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of youxiu_img
-- ----------------------------
INSERT INTO `youxiu_img` VALUES ('4', '发哥 26岁 湖南常德', '1', '/Uploads/tuijian/2016-04-11/570b206d9550d.png');
INSERT INTO `youxiu_img` VALUES ('5', '章子怡 20 湖南株洲', '3', '/Uploads/tuijian/2016-04-11/570b3813686ec.png');
INSERT INTO `youxiu_img` VALUES ('6', '刘德华 24岁 湖南长沙', '2', '/Uploads/tuijian/2016-04-11/570b2086808fb.png');
INSERT INTO `youxiu_img` VALUES ('7', '张学友 23岁 湖南澧县', '4', '/Uploads/tuijian/2016-04-08/5707297f9b72e.jpg');
INSERT INTO `youxiu_img` VALUES ('10', 'Yangyang', '5', '/Uploads/tuijian/2016-04-12/570c68ec7c330.jpg');
INSERT INTO `youxiu_img` VALUES ('11', 'HHH', '6', '/Uploads/tuijian/2016-04-12/570c69195f2d7.jpg');
INSERT INTO `youxiu_img` VALUES ('12', 'sss', '7', '/Uploads/tuijian/2016-04-09/5708a0d355d4a.png');
INSERT INTO `youxiu_img` VALUES ('13', '不变的承诺', '8', '/Uploads/tuijian/2016-04-09/5708a0efd3b73.png');
INSERT INTO `youxiu_img` VALUES ('14', 'ssss', '9', '/Uploads/tuijian/2016-04-09/57089db9c9f0c.jpg');
INSERT INTO `youxiu_img` VALUES ('15', 'ssss', '10', '/Uploads/tuijian/2016-04-09/57089dc5b34a7.jpg');
INSERT INTO `youxiu_img` VALUES ('16', 'ssssss', '11', '/Uploads/tuijian/2016-04-09/57089dcf446d1.jpg');
INSERT INTO `youxiu_img` VALUES ('17', '朵拉 22岁 湖南怀化', '12', '/Uploads/tuijian/2016-04-12/570c637824d34.jpg');
INSERT INTO `youxiu_img` VALUES ('18', 'sssss', '13', '/Uploads/tuijian/2016-04-09/57089ded47868.jpg');
INSERT INTO `youxiu_img` VALUES ('19', 'sssss', '14', '/Uploads/tuijian/2016-04-09/57089df6527e2.jpg');
INSERT INTO `youxiu_img` VALUES ('21', 'sssss', '16', '/Uploads/tuijian/2016-04-09/57089e092f71f.jpg');
INSERT INTO `youxiu_img` VALUES ('22', 'ssss', '17', '/Uploads/tuijian/2016-04-09/57089e16066ff.jpg');
INSERT INTO `youxiu_img` VALUES ('23', 'ssss', '18', '/Uploads/tuijian/2016-04-09/57089e1fbc1cb.jpg');
INSERT INTO `youxiu_img` VALUES ('24', 'ssss', '19', '/Uploads/tuijian/2016-04-09/57089e2853724.jpg');
INSERT INTO `youxiu_img` VALUES ('25', 'sssss', '20', '/Uploads/tuijian/2016-04-09/57089e3165ce0.jpg');
INSERT INTO `youxiu_img` VALUES ('26', '太阳女神  24岁  湖南常德', '15', '/Uploads/tuijian/2016-04-12/570c68aa57364.jpg');
