import 'package:code_assets/code_assets.dart';
import 'package:hooks/hooks.dart';
import 'package:native_toolchain_rust/native_toolchain_rust.dart';

void main(List<String> args) async {
  await build(args, (BuildInput input, BuildOutputBuilder output) async {
    if (input.config.buildCodeAssets) {
      final rustBuilder = RustBuilder(
        assetName: 'src/rust/frb_generated.io.dart',
        cratePath: 'rust',
        buildMode:
            input.config.linkingEnabled ? BuildMode.release : BuildMode.debug,
      );
      await rustBuilder.run(input: input, output: output);
    }
  });
}
