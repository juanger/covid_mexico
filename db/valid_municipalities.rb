require 'set'

VALID_MUNICIPALITIES = [
  1001,
  1002,
  1003,
  1004,
  1005,
  1006,
  1007,
  1008,
  1009,
  1010,
  1011,
  1999,
  2001,
  2002,
  2003,
  2004,
  2005,
  2999,
  3001,
  3002,
  3003,
  3008,
  3009,
  3999,
  4001,
  4002,
  4003,
  4004,
  4005,
  4006,
  4007,
  4008,
  4009,
  4010,
  4011,
  4999,
  5001,
  5002,
  5003,
  5004,
  5005,
  5006,
  5007,
  5008,
  5009,
  5010,
  5011,
  5012,
  5013,
  5014,
  5015,
  5016,
  5017,
  5018,
  5019,
  5020,
  5021,
  5022,
  5023,
  5024,
  5025,
  5026,
  5027,
  5028,
  5029,
  5030,
  5031,
  5032,
  5033,
  5034,
  5035,
  5036,
  5037,
  5038,
  5999,
  6001,
  6002,
  6003,
  6004,
  6005,
  6006,
  6007,
  6008,
  6009,
  6010,
  6999,
  7001,
  7002,
  7003,
  7004,
  7005,
  7006,
  7007,
  7008,
  7009,
  7010,
  7011,
  7012,
  7013,
  7014,
  7015,
  7016,
  7017,
  7018,
  7019,
  7020,
  7021,
  7022,
  7023,
  7024,
  7025,
  7026,
  7027,
  7028,
  7029,
  7030,
  7031,
  7032,
  7033,
  7034,
  7035,
  7036,
  7037,
  7038,
  7039,
  7040,
  7041,
  7042,
  7043,
  7044,
  7045,
  7046,
  7047,
  7048,
  7049,
  7050,
  7051,
  7052,
  7053,
  7054,
  7055,
  7056,
  7057,
  7058,
  7059,
  7060,
  7061,
  7062,
  7063,
  7064,
  7065,
  7066,
  7067,
  7068,
  7069,
  7070,
  7071,
  7072,
  7073,
  7074,
  7075,
  7076,
  7077,
  7078,
  7079,
  7080,
  7081,
  7082,
  7083,
  7084,
  7085,
  7086,
  7087,
  7088,
  7089,
  7090,
  7091,
  7092,
  7093,
  7094,
  7096,
  7097,
  7098,
  7099,
  7100,
  7101,
  7102,
  7103,
  7104,
  7105,
  7106,
  7107,
  7108,
  7109,
  7110,
  7111,
  7112,
  7113,
  7114,
  7115,
  7116,
  7117,
  7118,
  7119,
  7120,
  7121,
  7122,
  7123,
  7124,
  7999,
  8001,
  8002,
  8003,
  8004,
  8005,
  8006,
  8007,
  8008,
  8009,
  8010,
  8011,
  8012,
  8013,
  8014,
  8015,
  8016,
  8017,
  8018,
  8019,
  8020,
  8021,
  8022,
  8023,
  8024,
  8025,
  8026,
  8027,
  8028,
  8029,
  8030,
  8031,
  8032,
  8033,
  8034,
  8035,
  8036,
  8037,
  8038,
  8039,
  8040,
  8041,
  8042,
  8043,
  8044,
  8045,
  8046,
  8047,
  8048,
  8049,
  8050,
  8051,
  8052,
  8053,
  8054,
  8055,
  8056,
  8057,
  8058,
  8059,
  8060,
  8061,
  8062,
  8063,
  8064,
  8065,
  8066,
  8067,
  8999,
  9002,
  9003,
  9004,
  9005,
  9006,
  9007,
  9008,
  9009,
  9010,
  9011,
  9012,
  9013,
  9014,
  9015,
  9016,
  9017,
  9999,
  10001,
  10002,
  10003,
  10004,
  10005,
  10006,
  10007,
  10008,
  10009,
  10010,
  10011,
  10012,
  10013,
  10014,
  10015,
  10016,
  10017,
  10018,
  10019,
  10020,
  10021,
  10022,
  10023,
  10024,
  10025,
  10026,
  10027,
  10028,
  10029,
  10030,
  10031,
  10032,
  10033,
  10034,
  10035,
  10036,
  10037,
  10038,
  10039,
  10999,
  11001,
  11002,
  11003,
  11004,
  11005,
  11006,
  11007,
  11008,
  11009,
  11010,
  11011,
  11012,
  11013,
  11014,
  11015,
  11016,
  11017,
  11018,
  11019,
  11020,
  11021,
  11022,
  11023,
  11024,
  11025,
  11026,
  11027,
  11028,
  11029,
  11030,
  11031,
  11032,
  11033,
  11034,
  11035,
  11036,
  11037,
  11038,
  11039,
  11040,
  11041,
  11042,
  11043,
  11044,
  11045,
  11046,
  11999,
  12001,
  12002,
  12003,
  12004,
  12005,
  12006,
  12007,
  12008,
  12009,
  12010,
  12011,
  12012,
  12013,
  12014,
  12015,
  12016,
  12017,
  12018,
  12019,
  12020,
  12021,
  12022,
  12023,
  12024,
  12025,
  12026,
  12027,
  12028,
  12029,
  12030,
  12031,
  12032,
  12033,
  12034,
  12035,
  12036,
  12037,
  12038,
  12039,
  12040,
  12041,
  12042,
  12043,
  12044,
  12045,
  12046,
  12047,
  12048,
  12049,
  12050,
  12051,
  12052,
  12053,
  12054,
  12055,
  12056,
  12057,
  12058,
  12059,
  12060,
  12061,
  12062,
  12063,
  12064,
  12065,
  12066,
  12067,
  12068,
  12069,
  12070,
  12071,
  12072,
  12073,
  12074,
  12075,
  12076,
  12077,
  12078,
  12079,
  12080,
  12081,
  12999,
  13001,
  13002,
  13003,
  13004,
  13005,
  13006,
  13007,
  13008,
  13009,
  13010,
  13011,
  13012,
  13013,
  13014,
  13015,
  13016,
  13017,
  13018,
  13019,
  13020,
  13021,
  13022,
  13023,
  13024,
  13025,
  13026,
  13027,
  13028,
  13029,
  13030,
  13031,
  13032,
  13033,
  13034,
  13035,
  13036,
  13037,
  13038,
  13039,
  13040,
  13041,
  13042,
  13043,
  13044,
  13045,
  13046,
  13047,
  13048,
  13049,
  13050,
  13051,
  13052,
  13053,
  13054,
  13055,
  13056,
  13057,
  13058,
  13059,
  13060,
  13061,
  13062,
  13063,
  13064,
  13065,
  13066,
  13067,
  13068,
  13069,
  13070,
  13071,
  13072,
  13073,
  13074,
  13075,
  13076,
  13077,
  13078,
  13079,
  13080,
  13081,
  13082,
  13083,
  13084,
  13999,
  14001,
  14002,
  14003,
  14004,
  14005,
  14006,
  14007,
  14008,
  14009,
  14010,
  14011,
  14012,
  14013,
  14014,
  14015,
  14016,
  14017,
  14018,
  14019,
  14020,
  14021,
  14022,
  14023,
  14024,
  14025,
  14026,
  14027,
  14028,
  14029,
  14030,
  14031,
  14032,
  14033,
  14034,
  14035,
  14036,
  14037,
  14038,
  14039,
  14040,
  14041,
  14042,
  14043,
  14044,
  14045,
  14046,
  14047,
  14048,
  14049,
  14050,
  14051,
  14052,
  14053,
  14054,
  14055,
  14056,
  14057,
  14058,
  14059,
  14060,
  14061,
  14062,
  14063,
  14064,
  14065,
  14066,
  14067,
  14068,
  14069,
  14070,
  14071,
  14072,
  14073,
  14074,
  14075,
  14076,
  14077,
  14078,
  14079,
  14080,
  14081,
  14082,
  14083,
  14084,
  14085,
  14086,
  14087,
  14088,
  14089,
  14090,
  14091,
  14092,
  14093,
  14094,
  14095,
  14096,
  14097,
  14098,
  14099,
  14100,
  14101,
  14102,
  14103,
  14104,
  14105,
  14106,
  14107,
  14108,
  14109,
  14110,
  14111,
  14112,
  14113,
  14114,
  14115,
  14116,
  14117,
  14118,
  14119,
  14120,
  14121,
  14122,
  14123,
  14124,
  14125,
  14999,
  15001,
  15002,
  15003,
  15004,
  15005,
  15006,
  15007,
  15008,
  15009,
  15010,
  15011,
  15012,
  15013,
  15014,
  15015,
  15016,
  15017,
  15018,
  15019,
  15020,
  15021,
  15022,
  15023,
  15024,
  15025,
  15026,
  15027,
  15028,
  15029,
  15030,
  15031,
  15032,
  15033,
  15034,
  15035,
  15036,
  15037,
  15038,
  15039,
  15040,
  15041,
  15042,
  15043,
  15044,
  15045,
  15046,
  15047,
  15048,
  15049,
  15050,
  15051,
  15052,
  15053,
  15054,
  15055,
  15056,
  15057,
  15058,
  15059,
  15060,
  15061,
  15062,
  15063,
  15064,
  15065,
  15066,
  15067,
  15068,
  15069,
  15070,
  15071,
  15072,
  15073,
  15074,
  15075,
  15076,
  15077,
  15078,
  15079,
  15080,
  15081,
  15082,
  15083,
  15084,
  15085,
  15086,
  15087,
  15088,
  15089,
  15090,
  15091,
  15092,
  15093,
  15094,
  15095,
  15096,
  15097,
  15098,
  15099,
  15100,
  15101,
  15102,
  15103,
  15104,
  15105,
  15106,
  15107,
  15108,
  15109,
  15110,
  15111,
  15112,
  15113,
  15114,
  15115,
  15116,
  15117,
  15118,
  15119,
  15120,
  15121,
  15122,
  15123,
  15124,
  15125,
  15999,
  16001,
  16002,
  16003,
  16004,
  16005,
  16006,
  16007,
  16008,
  16009,
  16010,
  16011,
  16012,
  16013,
  16014,
  16015,
  16016,
  16017,
  16018,
  16019,
  16020,
  16021,
  16022,
  16023,
  16024,
  16025,
  16026,
  16027,
  16028,
  16029,
  16030,
  16031,
  16032,
  16033,
  16034,
  16035,
  16036,
  16037,
  16038,
  16039,
  16040,
  16041,
  16042,
  16043,
  16044,
  16045,
  16046,
  16047,
  16048,
  16049,
  16050,
  16051,
  16052,
  16053,
  16054,
  16055,
  16056,
  16057,
  16058,
  16059,
  16060,
  16061,
  16062,
  16063,
  16064,
  16065,
  16066,
  16067,
  16068,
  16069,
  16070,
  16071,
  16072,
  16073,
  16074,
  16075,
  16076,
  16077,
  16078,
  16079,
  16080,
  16081,
  16082,
  16083,
  16084,
  16085,
  16086,
  16087,
  16088,
  16089,
  16090,
  16091,
  16092,
  16093,
  16094,
  16095,
  16096,
  16097,
  16098,
  16099,
  16100,
  16101,
  16102,
  16103,
  16104,
  16105,
  16106,
  16107,
  16108,
  16109,
  16110,
  16111,
  16112,
  16113,
  16999,
  17001,
  17002,
  17003,
  17004,
  17005,
  17006,
  17007,
  17008,
  17009,
  17010,
  17011,
  17012,
  17013,
  17014,
  17015,
  17016,
  17017,
  17018,
  17019,
  17020,
  17021,
  17022,
  17023,
  17024,
  17025,
  17026,
  17027,
  17028,
  17029,
  17030,
  17031,
  17032,
  17033,
  17034,
  17035,
  17999,
  18001,
  18002,
  18003,
  18004,
  18005,
  18006,
  18007,
  18008,
  18009,
  18010,
  18011,
  18012,
  18013,
  18014,
  18015,
  18016,
  18017,
  18018,
  18019,
  18020,
  18999,
  19001,
  19002,
  19003,
  19004,
  19005,
  19006,
  19007,
  19008,
  19009,
  19010,
  19011,
  19012,
  19013,
  19014,
  19015,
  19016,
  19017,
  19018,
  19019,
  19020,
  19021,
  19022,
  19023,
  19024,
  19025,
  19026,
  19027,
  19028,
  19029,
  19030,
  19031,
  19032,
  19033,
  19034,
  19035,
  19036,
  19037,
  19038,
  19039,
  19040,
  19041,
  19042,
  19043,
  19044,
  19045,
  19046,
  19047,
  19048,
  19049,
  19050,
  19051,
  19999,
  20001,
  20002,
  20003,
  20004,
  20005,
  20006,
  20007,
  20008,
  20009,
  20010,
  20011,
  20012,
  20013,
  20014,
  20015,
  20016,
  20017,
  20018,
  20019,
  20020,
  20021,
  20022,
  20023,
  20024,
  20025,
  20026,
  20027,
  20028,
  20029,
  20030,
  20031,
  20032,
  20033,
  20034,
  20035,
  20036,
  20037,
  20038,
  20039,
  20040,
  20041,
  20042,
  20043,
  20044,
  20045,
  20046,
  20047,
  20048,
  20049,
  20050,
  20051,
  20052,
  20053,
  20054,
  20055,
  20056,
  20057,
  20058,
  20059,
  20060,
  20061,
  20062,
  20063,
  20064,
  20065,
  20066,
  20067,
  20068,
  20069,
  20070,
  20071,
  20072,
  20073,
  20074,
  20075,
  20076,
  20077,
  20078,
  20079,
  20080,
  20081,
  20082,
  20083,
  20084,
  20085,
  20086,
  20087,
  20088,
  20089,
  20090,
  20091,
  20092,
  20093,
  20094,
  20095,
  20096,
  20097,
  20098,
  20099,
  20100,
  20101,
  20102,
  20103,
  20104,
  20105,
  20106,
  20107,
  20108,
  20109,
  20110,
  20111,
  20112,
  20113,
  20114,
  20115,
  20116,
  20117,
  20118,
  20119,
  20120,
  20121,
  20122,
  20123,
  20124,
  20125,
  20126,
  20127,
  20128,
  20129,
  20130,
  20131,
  20132,
  20133,
  20134,
  20135,
  20136,
  20137,
  20138,
  20139,
  20140,
  20141,
  20142,
  20143,
  20144,
  20145,
  20146,
  20147,
  20148,
  20149,
  20150,
  20151,
  20152,
  20153,
  20154,
  20155,
  20156,
  20157,
  20158,
  20159,
  20160,
  20161,
  20162,
  20163,
  20164,
  20165,
  20166,
  20167,
  20168,
  20169,
  20170,
  20171,
  20172,
  20173,
  20174,
  20175,
  20176,
  20177,
  20178,
  20179,
  20180,
  20181,
  20182,
  20183,
  20184,
  20185,
  20186,
  20187,
  20188,
  20189,
  20190,
  20191,
  20192,
  20193,
  20194,
  20195,
  20196,
  20197,
  20198,
  20199,
  20200,
  20201,
  20202,
  20203,
  20204,
  20205,
  20206,
  20207,
  20208,
  20209,
  20210,
  20211,
  20212,
  20213,
  20214,
  20215,
  20216,
  20217,
  20218,
  20219,
  20220,
  20221,
  20222,
  20223,
  20224,
  20225,
  20226,
  20227,
  20228,
  20229,
  20230,
  20231,
  20232,
  20233,
  20234,
  20235,
  20236,
  20237,
  20238,
  20239,
  20240,
  20241,
  20242,
  20243,
  20244,
  20245,
  20246,
  20247,
  20248,
  20249,
  20250,
  20251,
  20252,
  20253,
  20254,
  20255,
  20256,
  20257,
  20258,
  20259,
  20260,
  20261,
  20262,
  20263,
  20264,
  20265,
  20266,
  20267,
  20268,
  20269,
  20270,
  20271,
  20272,
  20273,
  20274,
  20275,
  20276,
  20277,
  20278,
  20279,
  20280,
  20281,
  20282,
  20283,
  20284,
  20285,
  20286,
  20287,
  20288,
  20289,
  20290,
  20291,
  20292,
  20293,
  20294,
  20295,
  20296,
  20297,
  20298,
  20299,
  20300,
  20301,
  20302,
  20303,
  20304,
  20305,
  20306,
  20307,
  20308,
  20309,
  20310,
  20311,
  20312,
  20313,
  20314,
  20315,
  20316,
  20317,
  20318,
  20319,
  20320,
  20321,
  20322,
  20323,
  20324,
  20325,
  20326,
  20327,
  20328,
  20329,
  20330,
  20331,
  20332,
  20333,
  20334,
  20335,
  20336,
  20337,
  20338,
  20339,
  20340,
  20341,
  20342,
  20343,
  20344,
  20345,
  20346,
  20347,
  20348,
  20349,
  20350,
  20351,
  20352,
  20353,
  20354,
  20355,
  20356,
  20357,
  20358,
  20359,
  20360,
  20361,
  20362,
  20363,
  20364,
  20365,
  20366,
  20367,
  20368,
  20369,
  20370,
  20371,
  20372,
  20373,
  20374,
  20375,
  20376,
  20377,
  20378,
  20379,
  20380,
  20381,
  20382,
  20383,
  20384,
  20385,
  20386,
  20387,
  20388,
  20389,
  20390,
  20391,
  20392,
  20393,
  20394,
  20395,
  20396,
  20397,
  20398,
  20399,
  20400,
  20401,
  20402,
  20403,
  20404,
  20405,
  20406,
  20407,
  20408,
  20409,
  20410,
  20411,
  20412,
  20413,
  20414,
  20415,
  20416,
  20417,
  20418,
  20419,
  20420,
  20421,
  20422,
  20423,
  20424,
  20425,
  20426,
  20427,
  20428,
  20429,
  20430,
  20431,
  20432,
  20433,
  20434,
  20435,
  20436,
  20437,
  20438,
  20439,
  20440,
  20441,
  20442,
  20443,
  20444,
  20445,
  20446,
  20447,
  20448,
  20449,
  20450,
  20451,
  20452,
  20453,
  20454,
  20455,
  20456,
  20457,
  20458,
  20459,
  20460,
  20461,
  20462,
  20463,
  20464,
  20465,
  20466,
  20467,
  20468,
  20469,
  20470,
  20471,
  20472,
  20473,
  20474,
  20475,
  20476,
  20477,
  20478,
  20479,
  20480,
  20481,
  20482,
  20483,
  20484,
  20485,
  20486,
  20487,
  20488,
  20489,
  20490,
  20491,
  20492,
  20493,
  20494,
  20495,
  20496,
  20497,
  20498,
  20499,
  20500,
  20501,
  20502,
  20503,
  20504,
  20505,
  20506,
  20507,
  20508,
  20509,
  20510,
  20511,
  20512,
  20513,
  20514,
  20515,
  20516,
  20517,
  20518,
  20519,
  20520,
  20521,
  20522,
  20523,
  20524,
  20525,
  20526,
  20527,
  20528,
  20529,
  20530,
  20531,
  20532,
  20533,
  20534,
  20535,
  20536,
  20537,
  20538,
  20539,
  20540,
  20541,
  20542,
  20543,
  20544,
  20545,
  20546,
  20547,
  20548,
  20549,
  20550,
  20551,
  20552,
  20553,
  20554,
  20555,
  20556,
  20557,
  20558,
  20559,
  20560,
  20561,
  20562,
  20563,
  20564,
  20565,
  20566,
  20567,
  20568,
  20569,
  20570,
  20999,
  21001,
  21002,
  21003,
  21004,
  21005,
  21006,
  21007,
  21008,
  21009,
  21010,
  21011,
  21012,
  21013,
  21014,
  21015,
  21016,
  21017,
  21018,
  21019,
  21020,
  21021,
  21022,
  21023,
  21024,
  21025,
  21026,
  21027,
  21028,
  21029,
  21030,
  21031,
  21032,
  21033,
  21034,
  21035,
  21036,
  21037,
  21038,
  21039,
  21040,
  21041,
  21042,
  21043,
  21044,
  21045,
  21046,
  21047,
  21048,
  21049,
  21050,
  21051,
  21052,
  21053,
  21054,
  21055,
  21056,
  21057,
  21058,
  21059,
  21060,
  21061,
  21062,
  21063,
  21064,
  21065,
  21066,
  21067,
  21068,
  21069,
  21070,
  21071,
  21072,
  21073,
  21074,
  21075,
  21076,
  21077,
  21078,
  21079,
  21080,
  21081,
  21082,
  21083,
  21084,
  21085,
  21086,
  21087,
  21088,
  21089,
  21090,
  21091,
  21092,
  21093,
  21094,
  21095,
  21096,
  21097,
  21098,
  21099,
  21100,
  21101,
  21102,
  21103,
  21104,
  21105,
  21106,
  21107,
  21108,
  21109,
  21110,
  21111,
  21112,
  21113,
  21114,
  21115,
  21116,
  21117,
  21118,
  21119,
  21120,
  21121,
  21122,
  21123,
  21124,
  21125,
  21126,
  21127,
  21128,
  21129,
  21130,
  21131,
  21132,
  21133,
  21134,
  21135,
  21136,
  21137,
  21138,
  21139,
  21140,
  21141,
  21142,
  21143,
  21144,
  21145,
  21146,
  21147,
  21148,
  21149,
  21150,
  21151,
  21152,
  21153,
  21154,
  21155,
  21156,
  21157,
  21158,
  21159,
  21160,
  21161,
  21162,
  21163,
  21164,
  21165,
  21166,
  21167,
  21168,
  21169,
  21170,
  21171,
  21172,
  21173,
  21174,
  21175,
  21176,
  21177,
  21178,
  21179,
  21180,
  21181,
  21182,
  21183,
  21184,
  21185,
  21186,
  21187,
  21188,
  21189,
  21190,
  21191,
  21192,
  21193,
  21194,
  21195,
  21196,
  21197,
  21198,
  21199,
  21200,
  21201,
  21202,
  21203,
  21204,
  21205,
  21206,
  21207,
  21208,
  21209,
  21210,
  21211,
  21212,
  21213,
  21214,
  21215,
  21216,
  21217,
  21999,
  22001,
  22002,
  22003,
  22004,
  22005,
  22006,
  22007,
  22008,
  22009,
  22010,
  22011,
  22012,
  22013,
  22014,
  22015,
  22016,
  22017,
  22018,
  22999,
  23001,
  23002,
  23003,
  23004,
  23005,
  23006,
  23007,
  23008,
  23009,
  23010,
  23011,
  23999,
  24001,
  24002,
  24003,
  24004,
  24005,
  24006,
  24007,
  24008,
  24009,
  24010,
  24011,
  24012,
  24013,
  24014,
  24015,
  24016,
  24017,
  24018,
  24019,
  24020,
  24021,
  24022,
  24023,
  24024,
  24025,
  24026,
  24027,
  24028,
  24029,
  24030,
  24031,
  24032,
  24033,
  24034,
  24035,
  24036,
  24037,
  24038,
  24039,
  24040,
  24041,
  24042,
  24043,
  24044,
  24045,
  24046,
  24047,
  24048,
  24049,
  24050,
  24051,
  24052,
  24053,
  24054,
  24055,
  24056,
  24057,
  24058,
  24999,
  25001,
  25002,
  25003,
  25004,
  25005,
  25006,
  25007,
  25008,
  25009,
  25010,
  25011,
  25012,
  25013,
  25014,
  25015,
  25016,
  25017,
  25018,
  25999,
  26001,
  26002,
  26003,
  26004,
  26005,
  26006,
  26007,
  26008,
  26009,
  26010,
  26011,
  26012,
  26013,
  26014,
  26015,
  26016,
  26017,
  26018,
  26019,
  26020,
  26021,
  26022,
  26023,
  26024,
  26025,
  26026,
  26027,
  26028,
  26029,
  26030,
  26031,
  26032,
  26033,
  26034,
  26035,
  26036,
  26037,
  26038,
  26039,
  26040,
  26041,
  26042,
  26043,
  26044,
  26045,
  26046,
  26047,
  26048,
  26049,
  26050,
  26051,
  26052,
  26053,
  26054,
  26055,
  26056,
  26057,
  26058,
  26059,
  26060,
  26061,
  26062,
  26063,
  26064,
  26065,
  26066,
  26067,
  26068,
  26069,
  26070,
  26071,
  26072,
  26999,
  27001,
  27002,
  27003,
  27004,
  27005,
  27006,
  27007,
  27008,
  27009,
  27010,
  27011,
  27012,
  27013,
  27014,
  27015,
  27016,
  27017,
  27999,
  28001,
  28002,
  28003,
  28004,
  28005,
  28006,
  28007,
  28008,
  28009,
  28010,
  28011,
  28012,
  28013,
  28014,
  28015,
  28016,
  28017,
  28018,
  28019,
  28020,
  28021,
  28022,
  28023,
  28024,
  28025,
  28026,
  28027,
  28028,
  28029,
  28030,
  28031,
  28032,
  28033,
  28034,
  28035,
  28036,
  28037,
  28038,
  28039,
  28040,
  28041,
  28042,
  28043,
  28999,
  29001,
  29002,
  29003,
  29004,
  29005,
  29006,
  29007,
  29008,
  29009,
  29010,
  29011,
  29012,
  29013,
  29014,
  29015,
  29016,
  29017,
  29018,
  29019,
  29020,
  29021,
  29022,
  29023,
  29024,
  29025,
  29026,
  29027,
  29028,
  29029,
  29030,
  29031,
  29032,
  29033,
  29034,
  29035,
  29036,
  29037,
  29038,
  29039,
  29040,
  29041,
  29042,
  29043,
  29044,
  29045,
  29046,
  29047,
  29048,
  29049,
  29050,
  29051,
  29052,
  29053,
  29054,
  29055,
  29056,
  29057,
  29058,
  29059,
  29060,
  29999,
  30001,
  30002,
  30003,
  30004,
  30005,
  30006,
  30007,
  30008,
  30009,
  30010,
  30011,
  30012,
  30013,
  30014,
  30015,
  30016,
  30017,
  30018,
  30019,
  30020,
  30021,
  30022,
  30023,
  30024,
  30025,
  30026,
  30027,
  30028,
  30029,
  30030,
  30031,
  30032,
  30033,
  30034,
  30035,
  30036,
  30037,
  30038,
  30039,
  30040,
  30041,
  30042,
  30043,
  30044,
  30045,
  30046,
  30047,
  30048,
  30049,
  30050,
  30051,
  30052,
  30053,
  30054,
  30055,
  30056,
  30057,
  30058,
  30059,
  30060,
  30061,
  30062,
  30063,
  30064,
  30065,
  30066,
  30067,
  30068,
  30069,
  30070,
  30071,
  30072,
  30073,
  30074,
  30075,
  30076,
  30077,
  30078,
  30079,
  30080,
  30081,
  30082,
  30083,
  30084,
  30085,
  30086,
  30087,
  30088,
  30089,
  30090,
  30091,
  30092,
  30093,
  30094,
  30095,
  30096,
  30097,
  30098,
  30099,
  30100,
  30101,
  30102,
  30103,
  30104,
  30105,
  30106,
  30107,
  30108,
  30109,
  30110,
  30111,
  30112,
  30113,
  30114,
  30115,
  30116,
  30117,
  30118,
  30119,
  30120,
  30121,
  30122,
  30123,
  30124,
  30125,
  30126,
  30127,
  30128,
  30129,
  30130,
  30131,
  30132,
  30133,
  30134,
  30135,
  30136,
  30137,
  30138,
  30139,
  30140,
  30141,
  30142,
  30143,
  30144,
  30145,
  30146,
  30147,
  30148,
  30149,
  30150,
  30151,
  30152,
  30153,
  30154,
  30155,
  30156,
  30157,
  30158,
  30159,
  30160,
  30161,
  30162,
  30163,
  30164,
  30165,
  30166,
  30167,
  30168,
  30169,
  30170,
  30171,
  30172,
  30173,
  30174,
  30175,
  30176,
  30177,
  30178,
  30179,
  30180,
  30181,
  30182,
  30183,
  30184,
  30185,
  30186,
  30187,
  30188,
  30189,
  30190,
  30191,
  30192,
  30193,
  30194,
  30195,
  30196,
  30197,
  30198,
  30199,
  30200,
  30201,
  30202,
  30203,
  30204,
  30205,
  30206,
  30207,
  30208,
  30209,
  30210,
  30211,
  30212,
  30999,
  31001,
  31002,
  31003,
  31004,
  31005,
  31006,
  31007,
  31008,
  31009,
  31010,
  31011,
  31012,
  31013,
  31014,
  31015,
  31016,
  31017,
  31018,
  31019,
  31020,
  31021,
  31022,
  31023,
  31024,
  31025,
  31026,
  31027,
  31028,
  31029,
  31030,
  31031,
  31032,
  31033,
  31034,
  31035,
  31036,
  31037,
  31038,
  31039,
  31040,
  31041,
  31042,
  31043,
  31044,
  31045,
  31046,
  31047,
  31048,
  31049,
  31050,
  31051,
  31052,
  31053,
  31054,
  31055,
  31056,
  31057,
  31058,
  31059,
  31060,
  31061,
  31062,
  31063,
  31064,
  31065,
  31066,
  31067,
  31068,
  31069,
  31070,
  31071,
  31072,
  31073,
  31074,
  31075,
  31076,
  31077,
  31078,
  31079,
  31080,
  31081,
  31082,
  31083,
  31084,
  31085,
  31086,
  31087,
  31088,
  31089,
  31090,
  31091,
  31092,
  31093,
  31094,
  31095,
  31096,
  31097,
  31098,
  31099,
  31100,
  31101,
  31102,
  31103,
  31104,
  31105,
  31106,
  31999,
  32001,
  32002,
  32003,
  32004,
  32005,
  32006,
  32007,
  32008,
  32009,
  32010,
  32011,
  32012,
  32013,
  32014,
  32015,
  32016,
  32017,
  32018,
  32019,
  32020,
  32021,
  32022,
  32023,
  32024,
  32025,
  32026,
  32027,
  32028,
  32029,
  32030,
  32031,
  32032,
  32033,
  32034,
  32035,
  32036,
  32037,
  32038,
  32039,
  32040,
  32041,
  32042,
  32043,
  32044,
  32045,
  32046,
  32047,
  32048,
  32049,
  32050,
  32051,
  32052,
  32053,
  32054,
  32055,
  32056,
  32057,
  32058,
  32999,
  36999,
  97997,
  98998,
  99999
].to_set