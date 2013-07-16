function casper_library_bus_init()

	warning off Simulink:Engine:MdlFileShadowing;
	mdl = new_system('casper_library_bus', 'Library');
	blk = get(mdl,'Name');
	warning on Simulink:Engine:MdlFileShadowing;

	add_block('built-in/SubSystem', [blk,'/bus_addsub']);
	bus_addsub_gen([blk,'/bus_addsub']);
	set_param([blk,'/bus_addsub'], ...
		'opmode', sprintf('0'), ...
		'n_bits_a', sprintf('0'), ...
		'bin_pt_a', sprintf('3'), ...
		'type_a', sprintf('1'), ...
		'n_bits_b', sprintf('4'), ...
		'bin_pt_b', sprintf('3'), ...
		'type_b', sprintf('1'), ...
		'cmplx', sprintf('on'), ...
		'misc', sprintf('on'), ...
		'n_bits_out', sprintf('8'), ...
		'bin_pt_out', sprintf('3'), ...
		'type_out', sprintf('1'), ...
		'quantization', sprintf('0'), ...
		'overflow', sprintf('1'), ...
		'latency', sprintf('1'), ...
		'Position', sprintf('[20 17 95 93]'));

	add_block('built-in/SubSystem', [blk,'/bus_register']);
	bus_register_gen([blk,'/bus_register']);
	set_param([blk,'/bus_register'], ...
		'reset', sprintf('on'), ...
		'enable', sprintf('on'), ...
		'cmplx', sprintf('on'), ...
		'n_bits', sprintf('[]'), ...
		'misc', sprintf('on'), ...
		'Position', sprintf('[120 17 195 93]'));

	add_block('built-in/SubSystem', [blk,'/bus_mux']);
	bus_mux_gen([blk,'/bus_mux']);
	set_param([blk,'/bus_mux'], ...
		'n_bits', sprintf('[]'), ...
		'mux_latency', sprintf('1'), ...
		'cmplx', sprintf('on'), ...
		'misc', sprintf('on'), ...
		'Position', sprintf('[20 134 95 210]'));

	add_block('built-in/SubSystem', [blk,'/bus_mult']);
	bus_mult_gen([blk,'/bus_mult']);
	set_param([blk,'/bus_mult'], ...
		'n_bits_a', sprintf('0'), ...
		'bin_pt_a', sprintf('4'), ...
		'type_a', sprintf('1'), ...
		'cmplx_a', sprintf('on'), ...
		'n_bits_b', sprintf('4'), ...
		'bin_pt_b', sprintf('3'), ...
		'type_b', sprintf('1'), ...
		'cmplx_b', sprintf('on'), ...
		'n_bits_out', sprintf('12'), ...
		'bin_pt_out', sprintf('7'), ...
		'type_out', sprintf('1'), ...
		'quantization', sprintf('0'), ...
		'overflow', sprintf('0'), ...
		'mult_latency', sprintf('3'), ...
		'add_latency', sprintf('1'), ...
		'conv_latency', sprintf('1'), ...
		'max_fanout', sprintf('2'), ...
		'fan_latency', sprintf('0'), ...
		'misc', sprintf('on'), ...
		'Position', sprintf('[120 132 195 208]'));

	add_block('built-in/SubSystem', [blk,'/bus_replicate']);
	bus_replicate_gen([blk,'/bus_replicate']);
	set_param([blk,'/bus_replicate'], ...
		'replication', sprintf('0'), ...
		'latency', sprintf('0'), ...
		'misc', sprintf('on'), ...
		'Position', sprintf('[220 17 295 93]'));

	add_block('built-in/SubSystem', [blk,'/bus_logical']);
	bus_logical_gen([blk,'/bus_logical']);
	set_param([blk,'/bus_logical'], ...
		'logical_function', sprintf('AND'), ...
		'align_bp', sprintf('on'), ...
		'latency', sprintf('1'), ...
		'n_bits_a', sprintf('[]'), ...
		'bin_pt_a', sprintf('3'), ...
		'type_a', sprintf('1'), ...
		'n_bits_b', sprintf('4'), ...
		'bin_pt_b', sprintf('3'), ...
		'type_b', sprintf('1'), ...
		'cmplx', sprintf('on'), ...
		'en', sprintf('on'), ...
		'misc', sprintf('on'), ...
		'n_bits_out', sprintf('8'), ...
		'bin_pt_out', sprintf('3'), ...
		'type_out', sprintf('1'), ...
		'Position', sprintf('[20 252 95 328]'));

	add_block('built-in/SubSystem', [blk,'/bus_convert']);
	bus_convert_gen([blk,'/bus_convert']);
	set_param([blk,'/bus_convert'], ...
		'n_bits_in', sprintf('[]'), ...
		'bin_pt_in', sprintf('8'), ...
		'cmplx', sprintf('off'), ...
		'n_bits_out', sprintf('8'), ...
		'bin_pt_out', sprintf('4'), ...
		'quantization', sprintf('1'), ...
		'overflow', sprintf('1'), ...
		'latency', sprintf('2'), ...
		'of', sprintf('on'), ...
		'misc', sprintf('on'), ...
		'Position', sprintf('[220 132 295 208]'));

	add_block('built-in/SubSystem', [blk,'/bus_negate']);
	bus_negate_gen([blk,'/bus_negate']);
	set_param([blk,'/bus_negate'], ...
		'n_bits_in', sprintf('0'), ...
		'bin_pt_in', sprintf('8'), ...
		'cmplx', sprintf('off'), ...
		'overflow', sprintf('1'), ...
		'latency', sprintf('2'), ...
		'misc', sprintf('off'), ...
		'Position', sprintf('[120 252 195 328]'));

	add_block('built-in/SubSystem', [blk,'/bus_accumulator']);
	bus_accumulator_gen([blk,'/bus_accumulator']);
	set_param([blk,'/bus_accumulator'], ...
		'reset', sprintf('on'), ...
		'enable', sprintf('on'), ...
		'n_bits_in', sprintf('[]'), ...
		'bin_pt_in', sprintf('3'), ...
		'type_in', sprintf('1'), ...
		'cmplx', sprintf('on'), ...
		'n_bits_out', sprintf('16'), ...
		'overflow', sprintf('1'), ...
		'misc', sprintf('on'), ...
		'Position', sprintf('[320 17 395 93]'));

	add_block('built-in/SubSystem', [blk,'/bus_scale']);
	bus_scale_gen([blk,'/bus_scale']);
	set_param([blk,'/bus_scale'], ...
		'n_bits_in', sprintf('[]'), ...
		'bin_pt_in', sprintf('8'), ...
		'type_in', sprintf('1'), ...
		'cmplx', sprintf('off'), ...
		'scale_factor', sprintf('2'), ...
		'misc', sprintf('on'), ...
		'Position', sprintf('[320 132 395 208]'));

	set_param(blk, ...
		'Name', sprintf('casper_library_bus'), ...
		'LibraryType', sprintf('BlockLibrary'), ...
		'Lock', sprintf('off'), ...
		'PreSaveFcn', sprintf('mdl2m(gcs, ''library'', ''on'');'), ...
		'SolverName', sprintf('ode45'), ...
		'SolverMode', sprintf('Auto'), ...
		'StartTime', sprintf('0.0'), ...
		'StopTime', sprintf('10.0'));
	save_system(mdl,[getenv('MLIB_DEVEL_PATH'), '/casper_library/', 'casper_library_bus']);
end % casper_library_bus_init

function bus_addsub_gen(blk)

	bus_addsub_mask(blk);
	bus_addsub_init(blk);
	set_param(blk, ...
		'MaskInitialization', sprintf('bus_addsub_init(gcb, ...\n    ''opmode'', opmode, ...\n    ''n_bits_a'', n_bits_a, ...\n    ''bin_pt_a'', bin_pt_a, ...\n    ''type_a'', type_a, ...\n    ''n_bits_b'', n_bits_b, ...\n    ''bin_pt_b'', bin_pt_b, ...\n    ''type_b'', type_b, ...\n    ''n_bits_out'', n_bits_out, ...\n    ''bin_pt_out'', bin_pt_out, ...\n    ''type_out'', type_out, ...\n    ''overflow'', overflow, ...        \n    ''quantization'', quantization, ...\n    ''latency'', latency, ...\n    ''cmplx'', cmplx, ...\n    ''misc'', misc);'));

end % bus_addsub_gen

function bus_addsub_mask(blk)

	set_param(blk, ...
		'Mask', sprintf('on'), ...
		'MaskSelfModifiable', sprintf('on'), ...
		'MaskType', sprintf('bus_addsub'), ...
		'MaskDescription', sprintf('Add/subtract components of two busses'), ...
		'MaskPromptString', sprintf('mode (Addition=0, Subtraction=1)|a input bit widths|a input binary points |a input type (Unsigned=0, Signed=1)|b input bit widths|b input binary points|b input type (Unsigned=0, Signed=1)|complex|misc support|output bit widths|output binary points|output type (Unsigned=0, Signed=1)|quantization strategy (Truncate=0, Round  (unbiased: +/- Inf)=1)|overflow strategy (Wrap=0, Saturate=1, Flag as error=2)|latency'), ...
		'MaskStyleString', sprintf('edit,edit,edit,edit,edit,edit,edit,checkbox,checkbox,edit,edit,edit,edit,edit,edit'), ...
		'MaskTabNameString', sprintf('input,input,input,input,input,input,input,input,input,output,output,output,output,output,latency'), ...
		'MaskCallbackString', sprintf('||||||||||||||'), ...
		'MaskEnableString', sprintf('on,on,on,on,on,on,on,on,on,on,on,on,on,on,on'), ...
		'MaskVisibilityString', sprintf('on,on,on,on,on,on,on,on,on,on,on,on,on,on,on'), ...
		'MaskToolTipString', sprintf('on,on,on,on,on,on,on,on,on,on,on,on,on,on,on'), ...
		'MaskVariables', sprintf('opmode=@1;n_bits_a=@2;bin_pt_a=@3;type_a=@4;n_bits_b=@5;bin_pt_b=@6;type_b=@7;cmplx=&8;misc=&9;n_bits_out=@10;bin_pt_out=@11;type_out=@12;quantization=@13;overflow=@14;latency=@15;'), ...
		'MaskValueString', sprintf('0|0|3|1|4|3|1|on|on|8|3|1|0|1|1'), ...
		'BackgroundColor', sprintf('[0.501961, 1.000000, 0.501961]'));

end % bus_addsub_mask

function bus_addsub_init(blk)

end % bus_addsub_init

function bus_register_gen(blk)

	bus_register_mask(blk);
	bus_register_init(blk);
	set_param(blk, ...
		'MaskInitialization', sprintf('bus_register_init(gcb, ...\n    ''reset'', reset, ...\n    ''enable'', enable, ...\n    ''cmplx'', cmplx, ...\n    ''n_bits'', n_bits, ...\n    ''misc'', misc);'));

end % bus_register_gen

function bus_register_mask(blk)

	set_param(blk, ...
		'Mask', sprintf('on'), ...
		'MaskSelfModifiable', sprintf('on'), ...
		'MaskType', sprintf('bus_register'), ...
		'MaskDescription', sprintf('Register components of bus'), ...
		'MaskPromptString', sprintf('reset port|enable port|complex data|input bit widths|misc support'), ...
		'MaskStyleString', sprintf('checkbox,checkbox,checkbox,edit,checkbox'), ...
		'MaskCallbackString', sprintf('||||'), ...
		'MaskEnableString', sprintf('on,on,on,on,on'), ...
		'MaskVisibilityString', sprintf('on,on,on,on,on'), ...
		'MaskToolTipString', sprintf('on,on,on,on,on'), ...
		'MaskVariables', sprintf('reset=&1;enable=&2;cmplx=&3;n_bits=@4;misc=&5;'), ...
		'MaskValueString', sprintf('on|on|on|[]|on'), ...
		'BackgroundColor', sprintf('[0.501961, 1.000000, 0.501961]'));

end % bus_register_mask

function bus_register_init(blk)

end % bus_register_init

function bus_mux_gen(blk)

	bus_mux_mask(blk);
	bus_mux_init(blk);
	set_param(blk, ...
		'MaskInitialization', sprintf('bus_mux_init(gcb, ...\n    ''n_bits'', n_bits, ...\n    ''cmplx'', cmplx, ...\n    ''misc'', misc, ...\n    ''mux_latency'', mux_latency);'));

end % bus_mux_gen

function bus_mux_mask(blk)

	set_param(blk, ...
		'Mask', sprintf('on'), ...
		'MaskSelfModifiable', sprintf('on'), ...
		'MaskType', sprintf('bus_mux'), ...
		'MaskDescription', sprintf('Mux components of bus'), ...
		'MaskPromptString', sprintf('input bit widths|mux latency|complex data|misc support'), ...
		'MaskStyleString', sprintf('edit,edit,checkbox,checkbox'), ...
		'MaskTabNameString', sprintf('input,latency,input,input'), ...
		'MaskCallbackString', sprintf('|||'), ...
		'MaskEnableString', sprintf('on,on,on,on'), ...
		'MaskVisibilityString', sprintf('on,on,on,on'), ...
		'MaskToolTipString', sprintf('on,on,on,on'), ...
		'MaskVariables', sprintf('n_bits=@1;mux_latency=@2;cmplx=&3;misc=&4;'), ...
		'MaskValueString', sprintf('[]|1|on|on'), ...
		'BackgroundColor', sprintf('[0.501961, 1.000000, 0.501961]'));

end % bus_mux_mask

function bus_mux_init(blk)

end % bus_mux_init

function bus_mult_gen(blk)

	bus_mult_mask(blk);
	bus_mult_init(blk);
	set_param(blk, ...
		'MaskInitialization', sprintf('bus_mult_init(gcb, ...\n    ''n_bits_a'', n_bits_a, ...\n    ''bin_pt_a'', bin_pt_a, ...\n    ''type_a'', type_a, ...\n    ''cmplx_a'', cmplx_a, ...\n    ''n_bits_b'', n_bits_b, ...\n    ''bin_pt_b'', bin_pt_b, ...\n    ''type_b'', type_b, ...\n    ''cmplx_b'', cmplx_b, ...\n    ''n_bits_out'', n_bits_out, ...\n    ''bin_pt_out'', bin_pt_out, ...\n    ''type_out'', type_out, ...\n    ''quantization'', quantization, ...\n    ''overflow'', overflow, ...\n    ''mult_latency'', mult_latency, ...\n    ''add_latency'', add_latency, ...\n    ''conv_latency'', conv_latency, ...\n    ''max_fanout'', max_fanout, ...\n    ''fan_latency'', fan_latency, ...\n    ''misc'', misc);'));

end % bus_mult_gen

function bus_mult_mask(blk)

	set_param(blk, ...
		'Mask', sprintf('on'), ...
		'MaskSelfModifiable', sprintf('on'), ...
		'MaskType', sprintf('bus_mult'), ...
		'MaskDescription', sprintf('Multiply components of two busses'), ...
		'MaskPromptString', sprintf('a input bit widths|a input binary points |a input type (Unsigned=0, Signed=1)|a input complex|b input bit widths|b input binary points|b input type (Unsigned=0, Signed=1)|b input complex|output bit widths|output binary points|output type (Unsigned=0, Signed=1)|quantization strategy (Truncate=0, Round  (unbiased: +/- Inf)=1)|overflow strategy (Wrap=0, Saturate=1, Flag as error=2)|multiplier latency|adder latency|convert latency|limit fanout to ?|fanout register latency|misc support'), ...
		'MaskStyleString', sprintf('edit,edit,edit,checkbox,edit,edit,edit,checkbox,edit,edit,edit,edit,edit,edit,edit,edit,edit,edit,checkbox'), ...
		'MaskTabNameString', sprintf('input,input,input,input,input,input,input,input,output,output,output,output,output,operation,operation,operation,operation,operation,input'), ...
		'MaskCallbackString', sprintf('||||||||||||||||||'), ...
		'MaskEnableString', sprintf('on,on,on,on,on,on,on,on,on,on,on,on,on,on,on,on,on,on,on'), ...
		'MaskVisibilityString', sprintf('on,on,on,on,on,on,on,on,on,on,on,on,on,on,on,on,on,on,on'), ...
		'MaskToolTipString', sprintf('on,on,on,on,on,on,on,on,on,on,on,on,on,on,on,on,on,on,on'), ...
		'MaskVariables', sprintf('n_bits_a=@1;bin_pt_a=@2;type_a=@3;cmplx_a=&4;n_bits_b=@5;bin_pt_b=@6;type_b=@7;cmplx_b=&8;n_bits_out=@9;bin_pt_out=@10;type_out=@11;quantization=@12;overflow=@13;mult_latency=@14;add_latency=@15;conv_latency=@16;max_fanout=@17;fan_latency=@18;misc=&19;'), ...
		'MaskValueString', sprintf('0|4|1|on|4|3|1|on|12|7|1|0|0|3|1|1|2|0|on'), ...
		'BackgroundColor', sprintf('[0.501961, 1.000000, 0.501961]'));

end % bus_mult_mask

function bus_mult_init(blk)

end % bus_mult_init

function bus_replicate_gen(blk)

	bus_replicate_mask(blk);
	bus_replicate_init(blk);
	set_param(blk, ...
		'MaskInitialization', sprintf('bus_replicate_init(gcb, ...\n    ''replication'', replication, ...\n    ''latency'', latency, ...\n    ''misc'', misc);'));

end % bus_replicate_gen

function bus_replicate_mask(blk)

	set_param(blk, ...
		'Mask', sprintf('on'), ...
		'MaskSelfModifiable', sprintf('on'), ...
		'MaskType', sprintf('bus_replicate'), ...
		'MaskDescription', sprintf('Output bus formed by replicating input bus a number of times'), ...
		'MaskPromptString', sprintf('replication factor|latency|misc support'), ...
		'MaskStyleString', sprintf('edit,edit,checkbox'), ...
		'MaskCallbackString', sprintf('||'), ...
		'MaskEnableString', sprintf('on,on,on'), ...
		'MaskVisibilityString', sprintf('on,on,on'), ...
		'MaskToolTipString', sprintf('on,on,on'), ...
		'MaskVariables', sprintf('replication=@1;latency=@2;misc=&3;'), ...
		'MaskValueString', sprintf('0|0|on'), ...
		'BackgroundColor', sprintf('[0.501961, 1.000000, 0.501961]'));

end % bus_replicate_mask

function bus_replicate_init(blk)

end % bus_replicate_init

function bus_logical_gen(blk)

	bus_logical_mask(blk);
	bus_logical_init(blk);
	set_param(blk, ...
		'MaskInitialization', sprintf('bus_logical_init(gcb, ...\n    ''logical_function'', logical_function, ...\n    ''en'', en, ...\n    ''n_bits_a'', n_bits_a, ...\n    ''bin_pt_a'', bin_pt_a, ...\n    ''type_a'', type_a, ...\n    ''n_bits_b'', n_bits_b, ...\n    ''bin_pt_b'', bin_pt_b, ...\n    ''type_b'', type_b, ...\n    ''n_bits_out'', n_bits_out, ...\n    ''bin_pt_out'', bin_pt_out, ...\n    ''type_out'', type_out, ...\n    ''latency'', latency, ...\n    ''cmplx'', cmplx, ...\n    ''align_bp'', align_bp, ...\n    ''misc'', misc);'));

end % bus_logical_gen

function bus_logical_mask(blk)

	set_param(blk, ...
		'Mask', sprintf('on'), ...
		'MaskSelfModifiable', sprintf('on'), ...
		'MaskType', sprintf('bus_logical'), ...
		'MaskDescription', sprintf('Form the logical product of two busses'), ...
		'MaskPromptString', sprintf('logical function|align binary point|latency|a input bit widths|a input binary points |a input type (Unsigned=0, Signed=1)|b input bit widths|b input binary points|b input type (Unsigned=0, Signed=1)|complex|en port|misc support|output bit widths|output binary points|output type (Unsigned=0, Signed=1)'), ...
		'MaskStyleString', sprintf('popup(AND|NAND|OR|NOR|XOR|XNOR),checkbox,edit,edit,edit,edit,edit,edit,edit,checkbox,checkbox,checkbox,edit,edit,edit'), ...
		'MaskTabNameString', sprintf('operation,operation,operation,input,input,input,input,input,input,input,input,input,output,output,output'), ...
		'MaskCallbackString', sprintf('||||||||||||||'), ...
		'MaskEnableString', sprintf('on,on,on,on,on,on,on,on,on,on,on,on,on,on,on'), ...
		'MaskVisibilityString', sprintf('on,on,on,on,on,on,on,on,on,on,on,on,on,on,on'), ...
		'MaskToolTipString', sprintf('on,on,on,on,on,on,on,on,on,on,on,on,on,on,on'), ...
		'MaskVariables', sprintf('logical_function=&1;align_bp=&2;latency=@3;n_bits_a=@4;bin_pt_a=@5;type_a=@6;n_bits_b=@7;bin_pt_b=@8;type_b=@9;cmplx=&10;en=&11;misc=&12;n_bits_out=@13;bin_pt_out=@14;type_out=@15;'), ...
		'MaskValueString', sprintf('AND|on|1|[]|3|1|4|3|1|on|on|on|8|3|1'), ...
		'BackgroundColor', sprintf('[0.501961, 1.000000, 0.501961]'));

end % bus_logical_mask

function bus_logical_init(blk)

end % bus_logical_init

function bus_convert_gen(blk)

	bus_convert_mask(blk);
	bus_convert_init(blk);
	set_param(blk, ...
		'MaskInitialization', sprintf('bus_convert_init(gcb, ...\n    ''n_bits_in'', n_bits_in, ...\n    ''bin_pt_in'', bin_pt_in, ...\n    ''cmplx'', cmplx, ...\n    ''n_bits_out'', n_bits_out, ...\n    ''bin_pt_out'', bin_pt_out, ...\n    ''quantization'', quantization, ...\n    ''overflow'', overflow, ...\n    ''latency'', latency, ...\n    ''misc'', misc, ...\n    ''of'', of);'));

end % bus_convert_gen

function bus_convert_mask(blk)

	set_param(blk, ...
		'Mask', sprintf('on'), ...
		'MaskSelfModifiable', sprintf('on'), ...
		'MaskType', sprintf('bus_convert'), ...
		'MaskDescription', sprintf('Convert components of busses'), ...
		'MaskPromptString', sprintf('input bit widths|input binary points |input complex|output bit widths|output binary points|quantization strategy (Truncate=0, Round  (unbiased: +/- Inf)=1, Round (unbiased: Even Values)=2)|overflow strategy (Wrap=0, Saturate=1, Flag as error=2)|latency|overflow indication|misc support'), ...
		'MaskStyleString', sprintf('edit,edit,checkbox,edit,edit,edit,edit,edit,checkbox,checkbox'), ...
		'MaskTabNameString', sprintf('input,input,input,output,output,output,output,operation,operation,input'), ...
		'MaskCallbackString', sprintf('|||||||||'), ...
		'MaskEnableString', sprintf('on,on,on,on,on,on,on,on,on,on'), ...
		'MaskVisibilityString', sprintf('on,on,on,on,on,on,on,on,on,on'), ...
		'MaskToolTipString', sprintf('on,on,on,on,on,on,on,on,on,on'), ...
		'MaskVariables', sprintf('n_bits_in=@1;bin_pt_in=@2;cmplx=&3;n_bits_out=@4;bin_pt_out=@5;quantization=@6;overflow=@7;latency=@8;of=&9;misc=&10;'), ...
		'MaskValueString', sprintf('[]|8|off|8|4|1|1|2|on|on'), ...
		'BackgroundColor', sprintf('[0.501961, 1.000000, 0.501961]'));

end % bus_convert_mask

function bus_convert_init(blk)

end % bus_convert_init

function bus_negate_gen(blk)

	bus_negate_mask(blk);
	bus_negate_init(blk);
	set_param(blk, ...
		'MaskInitialization', sprintf('bus_negate_init(gcb, ...\n    ''n_bits_in'', n_bits_in, ...\n    ''bin_pt_in'', bin_pt_in, ...\n    ''cmplx'', cmplx, ...\n    ''overflow'', overflow, ...\n    ''latency'', latency, ...\n    ''misc'', misc);'));

end % bus_negate_gen

function bus_negate_mask(blk)

	set_param(blk, ...
		'Mask', sprintf('on'), ...
		'MaskSelfModifiable', sprintf('on'), ...
		'MaskType', sprintf('bus_negate'), ...
		'MaskDescription', sprintf('Negate components of busses'), ...
		'MaskPromptString', sprintf('input bit widths|input binary points |input complex|overflow strategy (Wrap=0, Saturate=1, Flag as error=2)|latency|misc support'), ...
		'MaskStyleString', sprintf('edit,edit,checkbox,edit,edit,checkbox'), ...
		'MaskTabNameString', sprintf('input,input,input,operation,operation,input'), ...
		'MaskCallbackString', sprintf('|||||'), ...
		'MaskEnableString', sprintf('on,on,on,on,on,on'), ...
		'MaskVisibilityString', sprintf('on,on,on,on,on,on'), ...
		'MaskToolTipString', sprintf('on,on,on,on,on,on'), ...
		'MaskVariables', sprintf('n_bits_in=@1;bin_pt_in=@2;cmplx=&3;overflow=@4;latency=@5;misc=&6;'), ...
		'MaskValueString', sprintf('0|8|off|1|2|off'), ...
		'BackgroundColor', sprintf('[0.501961, 1.000000, 0.501961]'));

end % bus_negate_mask

function bus_negate_init(blk)

end % bus_negate_init

function bus_accumulator_gen(blk)

	bus_accumulator_mask(blk);
	bus_accumulator_init(blk);
	set_param(blk, ...
		'MaskInitialization', sprintf('bus_accumulator_init(gcb, ...\n    ''reset'', reset, ...\n    ''enable'', enable, ...\n    ''n_bits_in'', n_bits_in, ...\n    ''bin_pt_in'', bin_pt_in, ...\n    ''type_in'', type_in, ...\n    ''cmplx'', cmplx, ...\n    ''n_bits_out'', n_bits_out, ...\n    ''overflow'', overflow, ...\n    ''misc'', misc);'));

end % bus_accumulator_gen

function bus_accumulator_mask(blk)

	set_param(blk, ...
		'Mask', sprintf('on'), ...
		'MaskSelfModifiable', sprintf('on'), ...
		'MaskType', sprintf('bus_accumulator'), ...
		'MaskDescription', sprintf('Accumulate components of bus'), ...
		'MaskPromptString', sprintf('reset port|enable port|input bit widths|input binary points|input types (Unsigned=0, Signed=1)|complex inputs|output bit widths|overflow strategy (Wrap=0, Saturate=1, Flag as error=2)|misc support'), ...
		'MaskStyleString', sprintf('checkbox,checkbox,edit,edit,edit,checkbox,edit,edit,checkbox'), ...
		'MaskCallbackString', sprintf('||||||||'), ...
		'MaskEnableString', sprintf('on,on,on,on,on,on,on,on,on'), ...
		'MaskVisibilityString', sprintf('on,on,on,on,on,on,on,on,on'), ...
		'MaskToolTipString', sprintf('on,on,on,on,on,on,on,on,on'), ...
		'MaskVariables', sprintf('reset=&1;enable=&2;n_bits_in=@3;bin_pt_in=@4;type_in=@5;cmplx=&6;n_bits_out=@7;overflow=@8;misc=&9;'), ...
		'MaskValueString', sprintf('on|on|[]|3|1|on|16|1|on'), ...
		'BackgroundColor', sprintf('[0.501961, 1.000000, 0.501961]'));

end % bus_accumulator_mask

function bus_accumulator_init(blk)

end % bus_accumulator_init

function bus_scale_gen(blk)

	bus_scale_mask(blk);
	bus_scale_init(blk);
	set_param(blk, ...
		'MaskInitialization', sprintf('bus_scale_init(gcb, ...\n    ''n_bits_in'', n_bits_in, ...\n    ''bin_pt_in'', bin_pt_in, ...\n    ''type_in'', type_in, ...\n    ''cmplx'', cmplx, ...\n    ''scale_factor'', scale_factor, ...\n    ''misc'', misc);'));

end % bus_scale_gen

function bus_scale_mask(blk)

	set_param(blk, ...
		'Mask', sprintf('on'), ...
		'MaskSelfModifiable', sprintf('on'), ...
		'MaskType', sprintf('bus_scale'), ...
		'MaskDescription', sprintf('Convert components of busses'), ...
		'MaskPromptString', sprintf('input bit widths|input binary points |input types|input complex|scale factor (2^?)|misc support'), ...
		'MaskStyleString', sprintf('edit,edit,edit,checkbox,edit,checkbox'), ...
		'MaskTabNameString', sprintf('input,input,input,input,output,input'), ...
		'MaskCallbackString', sprintf('|||||'), ...
		'MaskEnableString', sprintf('on,on,on,on,on,on'), ...
		'MaskVisibilityString', sprintf('on,on,on,on,on,on'), ...
		'MaskToolTipString', sprintf('on,on,on,on,on,on'), ...
		'MaskVariables', sprintf('n_bits_in=@1;bin_pt_in=@2;type_in=@3;cmplx=&4;scale_factor=@5;misc=&6;'), ...
		'MaskValueString', sprintf('[]|8|1|off|2|on'), ...
		'BackgroundColor', sprintf('[0.501961, 1.000000, 0.501961]'));

end % bus_scale_mask

function bus_scale_init(blk)

end % bus_scale_init
