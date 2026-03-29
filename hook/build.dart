import 'package:hooks/hooks.dart';
import 'package:native_toolchain_rust/native_toolchain_rust.dart';

void main(List<String> args) async {
  await build(args, (BuildInput input, BuildOutputBuilder output) async {
    const rustBuilder = RustBuilder(
      assetName: 'src/rust/frb_generated.io.dart',
      cratePath: 'rust',
    );
    await rustBuilder.run(input: input, output: output);
  });
}
