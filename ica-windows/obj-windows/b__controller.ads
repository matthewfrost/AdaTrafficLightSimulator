pragma Ada_95;
pragma Warnings (Off);
with System;
package ada_main is

   gnat_argc : Integer;
   gnat_argv : System.Address;
   gnat_envp : System.Address;

   pragma Import (C, gnat_argc);
   pragma Import (C, gnat_argv);
   pragma Import (C, gnat_envp);

   gnat_exit_status : Integer;
   pragma Import (C, gnat_exit_status);

   GNAT_Version : constant String :=
                    "GNAT Version: GPL 2016 (20160515-49)" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_controller" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure adafinal;
   pragma Export (C, adafinal, "adafinal");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer;
   pragma Export (C, main, "main");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#2b35f547#;
   pragma Export (C, u00001, "controllerB");
   u00002 : constant Version_32 := 16#b6df930e#;
   pragma Export (C, u00002, "system__standard_libraryB");
   u00003 : constant Version_32 := 16#ddf3267e#;
   pragma Export (C, u00003, "system__standard_libraryS");
   u00004 : constant Version_32 := 16#3ffc8e18#;
   pragma Export (C, u00004, "adaS");
   u00005 : constant Version_32 := 16#c5dcd3d2#;
   pragma Export (C, u00005, "ada__calendarB");
   u00006 : constant Version_32 := 16#12a38fcc#;
   pragma Export (C, u00006, "ada__calendarS");
   u00007 : constant Version_32 := 16#da4d2671#;
   pragma Export (C, u00007, "ada__exceptionsB");
   u00008 : constant Version_32 := 16#4c8cceba#;
   pragma Export (C, u00008, "ada__exceptionsS");
   u00009 : constant Version_32 := 16#e947e6a9#;
   pragma Export (C, u00009, "ada__exceptions__last_chance_handlerB");
   u00010 : constant Version_32 := 16#41e5552e#;
   pragma Export (C, u00010, "ada__exceptions__last_chance_handlerS");
   u00011 : constant Version_32 := 16#2da59038#;
   pragma Export (C, u00011, "systemS");
   u00012 : constant Version_32 := 16#5f84b5ab#;
   pragma Export (C, u00012, "system__soft_linksB");
   u00013 : constant Version_32 := 16#b321486d#;
   pragma Export (C, u00013, "system__soft_linksS");
   u00014 : constant Version_32 := 16#b01dad17#;
   pragma Export (C, u00014, "system__parametersB");
   u00015 : constant Version_32 := 16#538f9d47#;
   pragma Export (C, u00015, "system__parametersS");
   u00016 : constant Version_32 := 16#0f0cb66d#;
   pragma Export (C, u00016, "system__secondary_stackB");
   u00017 : constant Version_32 := 16#86c45f51#;
   pragma Export (C, u00017, "system__secondary_stackS");
   u00018 : constant Version_32 := 16#39a03df9#;
   pragma Export (C, u00018, "system__storage_elementsB");
   u00019 : constant Version_32 := 16#0066da3c#;
   pragma Export (C, u00019, "system__storage_elementsS");
   u00020 : constant Version_32 := 16#41837d1e#;
   pragma Export (C, u00020, "system__stack_checkingB");
   u00021 : constant Version_32 := 16#a31afbd0#;
   pragma Export (C, u00021, "system__stack_checkingS");
   u00022 : constant Version_32 := 16#87a448ff#;
   pragma Export (C, u00022, "system__exception_tableB");
   u00023 : constant Version_32 := 16#700bf97a#;
   pragma Export (C, u00023, "system__exception_tableS");
   u00024 : constant Version_32 := 16#ce4af020#;
   pragma Export (C, u00024, "system__exceptionsB");
   u00025 : constant Version_32 := 16#45c6fdce#;
   pragma Export (C, u00025, "system__exceptionsS");
   u00026 : constant Version_32 := 16#4c9e814d#;
   pragma Export (C, u00026, "system__exceptions__machineS");
   u00027 : constant Version_32 := 16#aa0563fc#;
   pragma Export (C, u00027, "system__exceptions_debugB");
   u00028 : constant Version_32 := 16#532f69fc#;
   pragma Export (C, u00028, "system__exceptions_debugS");
   u00029 : constant Version_32 := 16#6c2f8802#;
   pragma Export (C, u00029, "system__img_intB");
   u00030 : constant Version_32 := 16#2f7e70fa#;
   pragma Export (C, u00030, "system__img_intS");
   u00031 : constant Version_32 := 16#39df8c17#;
   pragma Export (C, u00031, "system__tracebackB");
   u00032 : constant Version_32 := 16#73874efc#;
   pragma Export (C, u00032, "system__tracebackS");
   u00033 : constant Version_32 := 16#9ed49525#;
   pragma Export (C, u00033, "system__traceback_entriesB");
   u00034 : constant Version_32 := 16#2dfe6648#;
   pragma Export (C, u00034, "system__traceback_entriesS");
   u00035 : constant Version_32 := 16#d2b6296c#;
   pragma Export (C, u00035, "system__traceback__symbolicB");
   u00036 : constant Version_32 := 16#dd19f67a#;
   pragma Export (C, u00036, "system__traceback__symbolicS");
   u00037 : constant Version_32 := 16#701f9d88#;
   pragma Export (C, u00037, "ada__exceptions__tracebackB");
   u00038 : constant Version_32 := 16#20245e75#;
   pragma Export (C, u00038, "ada__exceptions__tracebackS");
   u00039 : constant Version_32 := 16#5d344636#;
   pragma Export (C, u00039, "system__crtlS");
   u00040 : constant Version_32 := 16#b6a35849#;
   pragma Export (C, u00040, "system__dwarf_linesB");
   u00041 : constant Version_32 := 16#44249c75#;
   pragma Export (C, u00041, "system__dwarf_linesS");
   u00042 : constant Version_32 := 16#12c24a43#;
   pragma Export (C, u00042, "ada__charactersS");
   u00043 : constant Version_32 := 16#8f637df8#;
   pragma Export (C, u00043, "ada__characters__handlingB");
   u00044 : constant Version_32 := 16#3b3f6154#;
   pragma Export (C, u00044, "ada__characters__handlingS");
   u00045 : constant Version_32 := 16#4b7bb96a#;
   pragma Export (C, u00045, "ada__characters__latin_1S");
   u00046 : constant Version_32 := 16#af50e98f#;
   pragma Export (C, u00046, "ada__stringsS");
   u00047 : constant Version_32 := 16#e2ea8656#;
   pragma Export (C, u00047, "ada__strings__mapsB");
   u00048 : constant Version_32 := 16#1e526bec#;
   pragma Export (C, u00048, "ada__strings__mapsS");
   u00049 : constant Version_32 := 16#4a6f6ca4#;
   pragma Export (C, u00049, "system__bit_opsB");
   u00050 : constant Version_32 := 16#0765e3a3#;
   pragma Export (C, u00050, "system__bit_opsS");
   u00051 : constant Version_32 := 16#1923ecbb#;
   pragma Export (C, u00051, "system__unsigned_typesS");
   u00052 : constant Version_32 := 16#92f05f13#;
   pragma Export (C, u00052, "ada__strings__maps__constantsS");
   u00053 : constant Version_32 := 16#5ab55268#;
   pragma Export (C, u00053, "interfacesS");
   u00054 : constant Version_32 := 16#57a37a42#;
   pragma Export (C, u00054, "system__address_imageB");
   u00055 : constant Version_32 := 16#8c490d02#;
   pragma Export (C, u00055, "system__address_imageS");
   u00056 : constant Version_32 := 16#ec78c2bf#;
   pragma Export (C, u00056, "system__img_unsB");
   u00057 : constant Version_32 := 16#86d7d04c#;
   pragma Export (C, u00057, "system__img_unsS");
   u00058 : constant Version_32 := 16#d7aac20c#;
   pragma Export (C, u00058, "system__ioB");
   u00059 : constant Version_32 := 16#b3e76777#;
   pragma Export (C, u00059, "system__ioS");
   u00060 : constant Version_32 := 16#cf909744#;
   pragma Export (C, u00060, "system__object_readerB");
   u00061 : constant Version_32 := 16#6942daaf#;
   pragma Export (C, u00061, "system__object_readerS");
   u00062 : constant Version_32 := 16#769e25e6#;
   pragma Export (C, u00062, "interfaces__cB");
   u00063 : constant Version_32 := 16#70be4e8c#;
   pragma Export (C, u00063, "interfaces__cS");
   u00064 : constant Version_32 := 16#1a74a354#;
   pragma Export (C, u00064, "system__val_lliB");
   u00065 : constant Version_32 := 16#b7817698#;
   pragma Export (C, u00065, "system__val_lliS");
   u00066 : constant Version_32 := 16#afdbf393#;
   pragma Export (C, u00066, "system__val_lluB");
   u00067 : constant Version_32 := 16#63d1bbc9#;
   pragma Export (C, u00067, "system__val_lluS");
   u00068 : constant Version_32 := 16#27b600b2#;
   pragma Export (C, u00068, "system__val_utilB");
   u00069 : constant Version_32 := 16#810526c6#;
   pragma Export (C, u00069, "system__val_utilS");
   u00070 : constant Version_32 := 16#d1060688#;
   pragma Export (C, u00070, "system__case_utilB");
   u00071 : constant Version_32 := 16#09acf9ef#;
   pragma Export (C, u00071, "system__case_utilS");
   u00072 : constant Version_32 := 16#84a27f0d#;
   pragma Export (C, u00072, "interfaces__c_streamsB");
   u00073 : constant Version_32 := 16#b1330297#;
   pragma Export (C, u00073, "interfaces__c_streamsS");
   u00074 : constant Version_32 := 16#931ff6be#;
   pragma Export (C, u00074, "system__exception_tracesB");
   u00075 : constant Version_32 := 16#097ab0a2#;
   pragma Export (C, u00075, "system__exception_tracesS");
   u00076 : constant Version_32 := 16#ce7de326#;
   pragma Export (C, u00076, "system__win32S");
   u00077 : constant Version_32 := 16#8c33a517#;
   pragma Export (C, u00077, "system__wch_conB");
   u00078 : constant Version_32 := 16#36d8b2ea#;
   pragma Export (C, u00078, "system__wch_conS");
   u00079 : constant Version_32 := 16#9721e840#;
   pragma Export (C, u00079, "system__wch_stwB");
   u00080 : constant Version_32 := 16#1bc99eeb#;
   pragma Export (C, u00080, "system__wch_stwS");
   u00081 : constant Version_32 := 16#a831679c#;
   pragma Export (C, u00081, "system__wch_cnvB");
   u00082 : constant Version_32 := 16#396f0819#;
   pragma Export (C, u00082, "system__wch_cnvS");
   u00083 : constant Version_32 := 16#ece6fdb6#;
   pragma Export (C, u00083, "system__wch_jisB");
   u00084 : constant Version_32 := 16#b91f1138#;
   pragma Export (C, u00084, "system__wch_jisS");
   u00085 : constant Version_32 := 16#a99e1d66#;
   pragma Export (C, u00085, "system__os_primitivesB");
   u00086 : constant Version_32 := 16#a72a814e#;
   pragma Export (C, u00086, "system__os_primitivesS");
   u00087 : constant Version_32 := 16#b6166bc6#;
   pragma Export (C, u00087, "system__task_lockB");
   u00088 : constant Version_32 := 16#4c2fa756#;
   pragma Export (C, u00088, "system__task_lockS");
   u00089 : constant Version_32 := 16#1a9147da#;
   pragma Export (C, u00089, "system__win32__extS");
   u00090 : constant Version_32 := 16#87cd2ab9#;
   pragma Export (C, u00090, "ada__calendar__delaysB");
   u00091 : constant Version_32 := 16#b27fb9e9#;
   pragma Export (C, u00091, "ada__calendar__delaysS");
   u00092 : constant Version_32 := 16#ee80728a#;
   pragma Export (C, u00092, "system__tracesB");
   u00093 : constant Version_32 := 16#dfb8f892#;
   pragma Export (C, u00093, "system__tracesS");
   u00094 : constant Version_32 := 16#3fc3ca96#;
   pragma Export (C, u00094, "hwifS");
   u00095 : constant Version_32 := 16#50bf8285#;
   pragma Export (C, u00095, "hwif_typesS");
   u00096 : constant Version_32 := 16#995438e1#;
   pragma Export (C, u00096, "mmapB");
   u00097 : constant Version_32 := 16#fbb9863f#;
   pragma Export (C, u00097, "mmapS");
   u00098 : constant Version_32 := 16#ab966715#;
   pragma Export (C, u00098, "ada__command_lineB");
   u00099 : constant Version_32 := 16#d59e21a4#;
   pragma Export (C, u00099, "ada__command_lineS");
   u00100 : constant Version_32 := 16#920eada5#;
   pragma Export (C, u00100, "ada__tagsB");
   u00101 : constant Version_32 := 16#13ca27f3#;
   pragma Export (C, u00101, "ada__tagsS");
   u00102 : constant Version_32 := 16#c3335bfd#;
   pragma Export (C, u00102, "system__htableB");
   u00103 : constant Version_32 := 16#a96723d2#;
   pragma Export (C, u00103, "system__htableS");
   u00104 : constant Version_32 := 16#089f5cd0#;
   pragma Export (C, u00104, "system__string_hashB");
   u00105 : constant Version_32 := 16#0b3948ac#;
   pragma Export (C, u00105, "system__string_hashS");
   u00106 : constant Version_32 := 16#1d9142a4#;
   pragma Export (C, u00106, "system__val_unsB");
   u00107 : constant Version_32 := 16#098b0180#;
   pragma Export (C, u00107, "system__val_unsS");
   u00108 : constant Version_32 := 16#d5bfa9f3#;
   pragma Export (C, u00108, "ada__text_ioB");
   u00109 : constant Version_32 := 16#c3f01c15#;
   pragma Export (C, u00109, "ada__text_ioS");
   u00110 : constant Version_32 := 16#10558b11#;
   pragma Export (C, u00110, "ada__streamsB");
   u00111 : constant Version_32 := 16#2e6701ab#;
   pragma Export (C, u00111, "ada__streamsS");
   u00112 : constant Version_32 := 16#db5c917c#;
   pragma Export (C, u00112, "ada__io_exceptionsS");
   u00113 : constant Version_32 := 16#b29d05bd#;
   pragma Export (C, u00113, "system__file_ioB");
   u00114 : constant Version_32 := 16#8ad4715d#;
   pragma Export (C, u00114, "system__file_ioS");
   u00115 : constant Version_32 := 16#cf417de3#;
   pragma Export (C, u00115, "ada__finalizationS");
   u00116 : constant Version_32 := 16#95817ed8#;
   pragma Export (C, u00116, "system__finalization_rootB");
   u00117 : constant Version_32 := 16#6257e3a8#;
   pragma Export (C, u00117, "system__finalization_rootS");
   u00118 : constant Version_32 := 16#9dd55695#;
   pragma Export (C, u00118, "system__os_libB");
   u00119 : constant Version_32 := 16#bf5ce13f#;
   pragma Export (C, u00119, "system__os_libS");
   u00120 : constant Version_32 := 16#1a817b8e#;
   pragma Export (C, u00120, "system__stringsB");
   u00121 : constant Version_32 := 16#531a815e#;
   pragma Export (C, u00121, "system__stringsS");
   u00122 : constant Version_32 := 16#d03a0a90#;
   pragma Export (C, u00122, "system__file_control_blockS");
   u00123 : constant Version_32 := 16#f5163a3e#;
   pragma Export (C, u00123, "interfaces__c__stringsB");
   u00124 : constant Version_32 := 16#603c1c44#;
   pragma Export (C, u00124, "interfaces__c__stringsS");
   u00125 : constant Version_32 := 16#60d5829f#;
   pragma Export (C, u00125, "misc2B");
   u00126 : constant Version_32 := 16#69af67a8#;
   pragma Export (C, u00126, "misc2S");
   u00127 : constant Version_32 := 16#ee101ba4#;
   pragma Export (C, u00127, "system__memoryB");
   u00128 : constant Version_32 := 16#74d8f60c#;
   pragma Export (C, u00128, "system__memoryS");
   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  ada.characters%s
   --  ada.characters.handling%s
   --  ada.characters.latin_1%s
   --  ada.command_line%s
   --  interfaces%s
   --  system%s
   --  system.case_util%s
   --  system.case_util%b
   --  system.htable%s
   --  system.img_int%s
   --  system.img_int%b
   --  system.io%s
   --  system.io%b
   --  system.os_primitives%s
   --  system.parameters%s
   --  system.parameters%b
   --  system.crtl%s
   --  interfaces.c_streams%s
   --  interfaces.c_streams%b
   --  system.standard_library%s
   --  system.exceptions_debug%s
   --  system.exceptions_debug%b
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  system.stack_checking%s
   --  system.stack_checking%b
   --  system.string_hash%s
   --  system.string_hash%b
   --  system.htable%b
   --  system.strings%s
   --  system.strings%b
   --  system.os_lib%s
   --  system.task_lock%s
   --  system.traceback_entries%s
   --  system.traceback_entries%b
   --  ada.exceptions%s
   --  system.soft_links%s
   --  system.task_lock%b
   --  system.traces%s
   --  system.traces%b
   --  system.unsigned_types%s
   --  system.img_uns%s
   --  system.img_uns%b
   --  system.val_lli%s
   --  system.val_llu%s
   --  system.val_uns%s
   --  system.val_util%s
   --  system.val_util%b
   --  system.val_uns%b
   --  system.val_llu%b
   --  system.val_lli%b
   --  system.wch_con%s
   --  system.wch_con%b
   --  system.wch_cnv%s
   --  system.wch_jis%s
   --  system.wch_jis%b
   --  system.wch_cnv%b
   --  system.wch_stw%s
   --  system.wch_stw%b
   --  ada.exceptions.last_chance_handler%s
   --  ada.exceptions.last_chance_handler%b
   --  ada.exceptions.traceback%s
   --  system.address_image%s
   --  system.bit_ops%s
   --  system.bit_ops%b
   --  system.exception_table%s
   --  system.exception_table%b
   --  ada.io_exceptions%s
   --  ada.strings%s
   --  ada.strings.maps%s
   --  ada.strings.maps.constants%s
   --  ada.tags%s
   --  ada.streams%s
   --  ada.streams%b
   --  interfaces.c%s
   --  interfaces.c.strings%s
   --  system.exceptions%s
   --  system.exceptions%b
   --  system.exceptions.machine%s
   --  system.file_control_block%s
   --  system.file_io%s
   --  system.finalization_root%s
   --  system.finalization_root%b
   --  ada.finalization%s
   --  system.win32%s
   --  system.win32.ext%s
   --  system.os_primitives%b
   --  ada.calendar%s
   --  ada.calendar%b
   --  ada.calendar.delays%s
   --  ada.calendar.delays%b
   --  system.exception_traces%s
   --  system.exception_traces%b
   --  system.memory%s
   --  system.memory%b
   --  system.standard_library%b
   --  system.object_reader%s
   --  system.dwarf_lines%s
   --  system.secondary_stack%s
   --  system.file_io%b
   --  interfaces.c.strings%b
   --  interfaces.c%b
   --  ada.tags%b
   --  ada.strings.maps%b
   --  system.soft_links%b
   --  system.os_lib%b
   --  ada.command_line%b
   --  ada.characters.handling%b
   --  system.secondary_stack%b
   --  system.dwarf_lines%b
   --  system.object_reader%b
   --  system.address_image%b
   --  ada.exceptions.traceback%b
   --  system.traceback%s
   --  system.traceback%b
   --  system.traceback.symbolic%s
   --  system.traceback.symbolic%b
   --  ada.exceptions%b
   --  ada.text_io%s
   --  ada.text_io%b
   --  hwif_types%s
   --  misc2%s
   --  misc2%b
   --  mmap%s
   --  mmap%b
   --  hwif%s
   --  controller%b
   --  END ELABORATION ORDER


end ada_main;
