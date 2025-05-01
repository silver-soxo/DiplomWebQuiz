; ModuleID = 'marshal_methods.armeabi-v7a.ll'
source_filename = "marshal_methods.armeabi-v7a.ll"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [360 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [714 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 68
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 67
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 108
	i32 32687329, ; 3: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 275
	i32 34715100, ; 4: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 309
	i32 34839235, ; 5: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 48
	i32 39485524, ; 6: System.Net.WebSockets.dll => 0x25a8054 => 80
	i32 42639949, ; 7: System.Threading.Thread => 0x28aa24d => 145
	i32 65960268, ; 8: Microsoft.Win32.SystemEvents.dll => 0x3ee794c => 224
	i32 66541672, ; 9: System.Diagnostics.StackTrace => 0x3f75868 => 30
	i32 67008169, ; 10: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 350
	i32 68219467, ; 11: System.Security.Cryptography.Primitives => 0x410f24b => 124
	i32 72070932, ; 12: Microsoft.Maui.Graphics.dll => 0x44bb714 => 222
	i32 82292897, ; 13: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 102
	i32 101534019, ; 14: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 293
	i32 117431740, ; 15: System.Runtime.InteropServices => 0x6ffddbc => 107
	i32 120558881, ; 16: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 293
	i32 122350210, ; 17: System.Threading.Channels.dll => 0x74aea82 => 139
	i32 134690465, ; 18: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 313
	i32 142721839, ; 19: System.Net.WebHeaderCollection => 0x881c32f => 77
	i32 149972175, ; 20: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 124
	i32 159306688, ; 21: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 165246403, ; 22: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 249
	i32 176265551, ; 23: System.ServiceProcess => 0xa81994f => 132
	i32 182336117, ; 24: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 295
	i32 184328833, ; 25: System.ValueTuple.dll => 0xafca281 => 151
	i32 195452805, ; 26: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 347
	i32 199333315, ; 27: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 348
	i32 205061960, ; 28: System.ComponentModel => 0xc38ff48 => 18
	i32 209399409, ; 29: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 247
	i32 220171995, ; 30: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 230216969, ; 31: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 269
	i32 230752869, ; 32: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 231409092, ; 33: System.Linq.Parallel => 0xdcb05c4 => 59
	i32 231814094, ; 34: System.Globalization => 0xdd133ce => 42
	i32 246610117, ; 35: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 91
	i32 254259026, ; 36: Microsoft.AspNetCore.Components.dll => 0xf27af52 => 177
	i32 261689757, ; 37: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 252
	i32 276479776, ; 38: System.Threading.Timer.dll => 0x107abf20 => 147
	i32 278686392, ; 39: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 271
	i32 280482487, ; 40: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 268
	i32 280992041, ; 41: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 319
	i32 291076382, ; 42: System.IO.Pipes.AccessControl.dll => 0x1159791e => 54
	i32 298918909, ; 43: System.Net.Ping.dll => 0x11d123fd => 69
	i32 317674968, ; 44: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 347
	i32 318968648, ; 45: Xamarin.AndroidX.Activity.dll => 0x13031348 => 238
	i32 321597661, ; 46: System.Numerics => 0x132b30dd => 83
	i32 330147069, ; 47: Microsoft.SqlServer.Server => 0x13ada4fd => 223
	i32 336156722, ; 48: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 332
	i32 342366114, ; 49: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 270
	i32 356389973, ; 50: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 331
	i32 360082299, ; 51: System.ServiceModel.Web => 0x15766b7b => 131
	i32 367780167, ; 52: System.IO.Pipes => 0x15ebe147 => 55
	i32 374914964, ; 53: System.Transactions.Local => 0x1658bf94 => 149
	i32 375677976, ; 54: System.Net.ServicePoint.dll => 0x16646418 => 74
	i32 379916513, ; 55: System.Threading.Thread.dll => 0x16a510e1 => 145
	i32 385762202, ; 56: System.Memory.dll => 0x16fe439a => 62
	i32 392610295, ; 57: System.Threading.ThreadPool.dll => 0x1766c1f7 => 146
	i32 395744057, ; 58: _Microsoft.Android.Resource.Designer => 0x17969339 => 356
	i32 403441872, ; 59: WindowsBase => 0x180c08d0 => 165
	i32 435591531, ; 60: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 343
	i32 441335492, ; 61: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 253
	i32 442565967, ; 62: System.Collections => 0x1a61054f => 12
	i32 450948140, ; 63: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 266
	i32 451504562, ; 64: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 125
	i32 456227837, ; 65: System.Web.HttpUtility.dll => 0x1b317bfd => 152
	i32 459347974, ; 66: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 113
	i32 465846621, ; 67: mscorlib => 0x1bc4415d => 166
	i32 469710990, ; 68: System.dll => 0x1bff388e => 164
	i32 476646585, ; 69: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 268
	i32 485463106, ; 70: Microsoft.IdentityModel.Abstractions => 0x1cef9442 => 210
	i32 486930444, ; 71: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 281
	i32 498788369, ; 72: System.ObjectModel => 0x1dbae811 => 84
	i32 500358224, ; 73: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 330
	i32 503918385, ; 74: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 324
	i32 513247710, ; 75: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 207
	i32 526420162, ; 76: System.Transactions.dll => 0x1f6088c2 => 150
	i32 527452488, ; 77: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 313
	i32 530272170, ; 78: System.Linq.Queryable => 0x1f9b4faa => 60
	i32 539058512, ; 79: Microsoft.Extensions.Logging => 0x20216150 => 203
	i32 540030774, ; 80: System.IO.FileSystem.dll => 0x20303736 => 51
	i32 545304856, ; 81: System.Runtime.Extensions => 0x2080b118 => 103
	i32 546455878, ; 82: System.Runtime.Serialization.Xml => 0x20924146 => 114
	i32 548916678, ; 83: Microsoft.Bcl.AsyncInterfaces => 0x20b7cdc6 => 183
	i32 549171840, ; 84: System.Globalization.Calendars => 0x20bbb280 => 40
	i32 557405415, ; 85: Jsr305Binding => 0x213954e7 => 306
	i32 569601784, ; 86: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 304
	i32 571435654, ; 87: Microsoft.Extensions.FileProviders.Embedded.dll => 0x220f6a86 => 200
	i32 577335427, ; 88: System.Security.Cryptography.Cng => 0x22697083 => 120
	i32 592146354, ; 89: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 338
	i32 601371474, ; 90: System.IO.IsolatedStorage.dll => 0x23d83352 => 52
	i32 605376203, ; 91: System.IO.Compression.FileSystem => 0x24154ecb => 44
	i32 613668793, ; 92: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 119
	i32 627609679, ; 93: Xamarin.AndroidX.CustomView => 0x2568904f => 258
	i32 627931235, ; 94: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 336
	i32 639843206, ; 95: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 264
	i32 643868501, ; 96: System.Net => 0x2660a755 => 81
	i32 662205335, ; 97: System.Text.Encodings.Web.dll => 0x27787397 => 136
	i32 663517072, ; 98: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 300
	i32 666292255, ; 99: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 245
	i32 672442732, ; 100: System.Collections.Concurrent => 0x2814a96c => 8
	i32 683518922, ; 101: System.Net.Security => 0x28bdabca => 73
	i32 688181140, ; 102: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 318
	i32 690569205, ; 103: System.Xml.Linq.dll => 0x29293ff5 => 155
	i32 691348768, ; 104: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 315
	i32 693804605, ; 105: System.Windows => 0x295a9e3d => 154
	i32 699345723, ; 106: System.Reflection.Emit => 0x29af2b3b => 92
	i32 700284507, ; 107: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 310
	i32 700358131, ; 108: System.IO.Compression.ZipFile => 0x29be9df3 => 45
	i32 706645707, ; 109: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 333
	i32 709557578, ; 110: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 321
	i32 720511267, ; 111: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 314
	i32 722857257, ; 112: System.Runtime.Loader.dll => 0x2b15ed29 => 109
	i32 735137430, ; 113: System.Security.SecureString.dll => 0x2bd14e96 => 129
	i32 752232764, ; 114: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 755313932, ; 115: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 235
	i32 759454413, ; 116: System.Net.Requests => 0x2d445acd => 72
	i32 762598435, ; 117: System.IO.Pipes.dll => 0x2d745423 => 55
	i32 775507847, ; 118: System.IO.Compression => 0x2e394f87 => 46
	i32 777317022, ; 119: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 342
	i32 789151979, ; 120: Microsoft.Extensions.Options => 0x2f0980eb => 206
	i32 790371945, ; 121: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 259
	i32 804008546, ; 122: Microsoft.AspNetCore.Components.WebView.Maui => 0x2fec3262 => 181
	i32 804715423, ; 123: System.Data.Common => 0x2ff6fb9f => 22
	i32 807930345, ; 124: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 273
	i32 809851609, ; 125: System.Drawing.Common.dll => 0x30455ad9 => 226
	i32 823281589, ; 126: System.Private.Uri.dll => 0x311247b5 => 86
	i32 830298997, ; 127: System.IO.Compression.Brotli => 0x317d5b75 => 43
	i32 832635846, ; 128: System.Xml.XPath.dll => 0x31a103c6 => 160
	i32 834051424, ; 129: System.Net.Quic => 0x31b69d60 => 71
	i32 843511501, ; 130: Xamarin.AndroidX.Print => 0x3246f6cd => 286
	i32 873119928, ; 131: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 877678880, ; 132: System.Globalization.dll => 0x34505120 => 42
	i32 878954865, ; 133: System.Net.Http.Json => 0x3463c971 => 63
	i32 904024072, ; 134: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 911108515, ; 135: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 53
	i32 926902833, ; 136: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 345
	i32 928116545, ; 137: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 309
	i32 952186615, ; 138: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 105
	i32 956575887, ; 139: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 314
	i32 966729478, ; 140: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 307
	i32 967690846, ; 141: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 270
	i32 975236339, ; 142: System.Diagnostics.Tracing => 0x3a20ecf3 => 34
	i32 975874589, ; 143: System.Xml.XDocument => 0x3a2aaa1d => 158
	i32 986514023, ; 144: System.Private.DataContractSerialization.dll => 0x3acd0267 => 85
	i32 987214855, ; 145: System.Diagnostics.Tools => 0x3ad7b407 => 32
	i32 992768348, ; 146: System.Collections.dll => 0x3b2c715c => 12
	i32 994442037, ; 147: System.IO.FileSystem => 0x3b45fb35 => 51
	i32 999186168, ; 148: Microsoft.Extensions.FileSystemGlobbing.dll => 0x3b8e5ef8 => 202
	i32 1001831731, ; 149: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 56
	i32 1012816738, ; 150: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 290
	i32 1019214401, ; 151: System.Drawing => 0x3cbffa41 => 36
	i32 1028951442, ; 152: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 197
	i32 1029334545, ; 153: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 320
	i32 1031528504, ; 154: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 308
	i32 1035644815, ; 155: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 243
	i32 1036536393, ; 156: System.Drawing.Primitives.dll => 0x3dc84a49 => 35
	i32 1044663988, ; 157: System.Linq.Expressions.dll => 0x3e444eb4 => 58
	i32 1052210849, ; 158: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 277
	i32 1055776046, ; 159: BlazingQuiz.Shared => 0x3eeddd2e => 352
	i32 1062017875, ; 160: Microsoft.Identity.Client.Extensions.Msal => 0x3f4d1b53 => 209
	i32 1067306892, ; 161: GoogleGson => 0x3f9dcf8c => 175
	i32 1082857460, ; 162: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1084122840, ; 163: Xamarin.Kotlin.StdLib => 0x409e66d8 => 311
	i32 1098259244, ; 164: System => 0x41761b2c => 164
	i32 1106973742, ; 165: Microsoft.Extensions.Configuration.FileExtensions.dll => 0x41fb142e => 194
	i32 1118262833, ; 166: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 333
	i32 1121599056, ; 167: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 276
	i32 1127624469, ; 168: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 205
	i32 1138436374, ; 169: Microsoft.Data.SqlClient.dll => 0x43db2916 => 184
	i32 1145483052, ; 170: System.Windows.Extensions.dll => 0x4446af2c => 233
	i32 1149092582, ; 171: Xamarin.AndroidX.Window => 0x447dc2e6 => 303
	i32 1157931901, ; 172: Microsoft.EntityFrameworkCore.Abstractions => 0x4504a37d => 186
	i32 1168523401, ; 173: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 339
	i32 1170634674, ; 174: System.Web.dll => 0x45c677b2 => 153
	i32 1173126369, ; 175: Microsoft.Extensions.FileProviders.Abstractions.dll => 0x45ec7ce1 => 198
	i32 1175144683, ; 176: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 299
	i32 1178241025, ; 177: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 284
	i32 1202000627, ; 178: Microsoft.EntityFrameworkCore.Abstractions.dll => 0x47a512f3 => 186
	i32 1203215381, ; 179: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 337
	i32 1204270330, ; 180: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 245
	i32 1204575371, ; 181: Microsoft.Extensions.Caching.Memory.dll => 0x47cc5c8b => 190
	i32 1208641965, ; 182: System.Diagnostics.Process => 0x480a69ad => 29
	i32 1219128291, ; 183: System.IO.IsolatedStorage => 0x48aa6be3 => 52
	i32 1230118953, ; 184: BlazingQuiz.Mobile => 0x49522029 => 0
	i32 1234928153, ; 185: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 335
	i32 1243150071, ; 186: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 304
	i32 1253011324, ; 187: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1260983243, ; 188: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 319
	i32 1263254573, ; 189: BlazingQuiz.Shared.dll => 0x4b4bbc2d => 352
	i32 1264511973, ; 190: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 294
	i32 1267360935, ; 191: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 298
	i32 1273260888, ; 192: Xamarin.AndroidX.Collection.Ktx => 0x4be46b58 => 250
	i32 1275534314, ; 193: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 315
	i32 1278448581, ; 194: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 242
	i32 1293217323, ; 195: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 261
	i32 1309188875, ; 196: System.Private.DataContractSerialization => 0x4e08a30b => 85
	i32 1322716291, ; 197: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 303
	i32 1324164729, ; 198: System.Linq => 0x4eed2679 => 61
	i32 1335329327, ; 199: System.Runtime.Serialization.Json.dll => 0x4f97822f => 112
	i32 1364015309, ; 200: System.IO => 0x514d38cd => 57
	i32 1373134921, ; 201: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 349
	i32 1376866003, ; 202: Xamarin.AndroidX.SavedState => 0x52114ed3 => 290
	i32 1379779777, ; 203: System.Resources.ResourceManager => 0x523dc4c1 => 99
	i32 1402170036, ; 204: System.Configuration.dll => 0x53936ab4 => 19
	i32 1406073936, ; 205: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 254
	i32 1408764838, ; 206: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 111
	i32 1411638395, ; 207: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 101
	i32 1422545099, ; 208: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 102
	i32 1430672901, ; 209: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 317
	i32 1434145427, ; 210: System.Runtime.Handles => 0x557b5293 => 104
	i32 1435222561, ; 211: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 307
	i32 1439761251, ; 212: System.Net.Quic.dll => 0x55d10363 => 71
	i32 1452070440, ; 213: System.Formats.Asn1.dll => 0x568cd628 => 38
	i32 1453312822, ; 214: System.Diagnostics.Tools.dll => 0x569fcb36 => 32
	i32 1454105418, ; 215: Microsoft.Extensions.FileProviders.Composite => 0x56abe34a => 199
	i32 1457743152, ; 216: System.Runtime.Extensions.dll => 0x56e36530 => 103
	i32 1458022317, ; 217: System.Net.Security.dll => 0x56e7a7ad => 73
	i32 1460893475, ; 218: System.IdentityModel.Tokens.Jwt => 0x57137723 => 227
	i32 1461004990, ; 219: es\Microsoft.Maui.Controls.resources => 0x57152abe => 323
	i32 1461234159, ; 220: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 221: System.Security.Cryptography.OpenSsl => 0x57201017 => 123
	i32 1462112819, ; 222: System.IO.Compression.dll => 0x57261233 => 46
	i32 1469204771, ; 223: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 244
	i32 1470490898, ; 224: Microsoft.Extensions.Primitives => 0x57a5e912 => 207
	i32 1479771757, ; 225: System.Collections.Immutable => 0x5833866d => 9
	i32 1480492111, ; 226: System.IO.Compression.Brotli.dll => 0x583e844f => 43
	i32 1487239319, ; 227: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1490025113, ; 228: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 291
	i32 1493001747, ; 229: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 327
	i32 1498168481, ; 230: Microsoft.IdentityModel.JsonWebTokens.dll => 0x594c3ca1 => 211
	i32 1514721132, ; 231: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 322
	i32 1521091094, ; 232: Microsoft.Extensions.FileSystemGlobbing => 0x5aaa0216 => 202
	i32 1536373174, ; 233: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 31
	i32 1543031311, ; 234: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 138
	i32 1543355203, ; 235: System.Reflection.Emit.dll => 0x5bfdbb43 => 92
	i32 1546581739, ; 236: Microsoft.AspNetCore.Components.WebView.Maui.dll => 0x5c2ef6eb => 181
	i32 1550322496, ; 237: System.Reflection.Extensions.dll => 0x5c680b40 => 93
	i32 1551623176, ; 238: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 342
	i32 1565310744, ; 239: System.Runtime.Caching => 0x5d4cbf18 => 230
	i32 1565862583, ; 240: System.IO.FileSystem.Primitives => 0x5d552ab7 => 49
	i32 1566207040, ; 241: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 141
	i32 1573704789, ; 242: System.Runtime.Serialization.Json => 0x5dccd455 => 112
	i32 1580037396, ; 243: System.Threading.Overlapped => 0x5e2d7514 => 140
	i32 1582305585, ; 244: Azure.Identity => 0x5e501131 => 174
	i32 1582372066, ; 245: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 260
	i32 1592978981, ; 246: System.Runtime.Serialization.dll => 0x5ef2ee25 => 115
	i32 1597949149, ; 247: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 308
	i32 1601112923, ; 248: System.Xml.Serialization => 0x5f6f0b5b => 157
	i32 1603525486, ; 249: Microsoft.Maui.Controls.HotReload.Forms.dll => 0x5f93db6e => 353
	i32 1604827217, ; 250: System.Net.WebClient => 0x5fa7b851 => 76
	i32 1618516317, ; 251: System.Net.WebSockets.Client.dll => 0x6078995d => 79
	i32 1622152042, ; 252: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 280
	i32 1622358360, ; 253: System.Dynamic.Runtime => 0x60b33958 => 37
	i32 1624863272, ; 254: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 302
	i32 1628113371, ; 255: Microsoft.IdentityModel.Protocols.OpenIdConnect => 0x610b09db => 214
	i32 1632842087, ; 256: Microsoft.Extensions.Configuration.Json => 0x61533167 => 195
	i32 1635184631, ; 257: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 264
	i32 1636350590, ; 258: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 257
	i32 1639515021, ; 259: System.Net.Http.dll => 0x61b9038d => 64
	i32 1639986890, ; 260: System.Text.RegularExpressions => 0x61c036ca => 138
	i32 1641389582, ; 261: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1654881142, ; 262: Microsoft.AspNetCore.Components.WebView => 0x62a37b76 => 180
	i32 1657153582, ; 263: System.Runtime => 0x62c6282e => 116
	i32 1658241508, ; 264: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 296
	i32 1658251792, ; 265: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 305
	i32 1670060433, ; 266: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 252
	i32 1675553242, ; 267: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 48
	i32 1677501392, ; 268: System.Net.Primitives.dll => 0x63fca3d0 => 70
	i32 1678508291, ; 269: System.Net.WebSockets => 0x640c0103 => 80
	i32 1679769178, ; 270: System.Security.Cryptography => 0x641f3e5a => 126
	i32 1689493916, ; 271: Microsoft.EntityFrameworkCore.dll => 0x64b3a19c => 185
	i32 1691477237, ; 272: System.Reflection.Metadata => 0x64d1e4f5 => 94
	i32 1696967625, ; 273: System.Security.Cryptography.Csp => 0x6525abc9 => 121
	i32 1698840827, ; 274: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 312
	i32 1701541528, ; 275: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1720223769, ; 276: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 273
	i32 1726116996, ; 277: System.Reflection.dll => 0x66e27484 => 97
	i32 1728033016, ; 278: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 28
	i32 1729485958, ; 279: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 248
	i32 1736233607, ; 280: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 340
	i32 1743415430, ; 281: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 318
	i32 1744735666, ; 282: System.Transactions.Local.dll => 0x67fe8db2 => 149
	i32 1746115085, ; 283: System.IO.Pipelines.dll => 0x68139a0d => 228
	i32 1746316138, ; 284: Mono.Android.Export => 0x6816ab6a => 169
	i32 1750313021, ; 285: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1758240030, ; 286: System.Resources.Reader.dll => 0x68cc9d1e => 98
	i32 1760259689, ; 287: Microsoft.AspNetCore.Components.Web.dll => 0x68eb6e69 => 179
	i32 1763938596, ; 288: System.Diagnostics.TraceSource.dll => 0x69239124 => 33
	i32 1765942094, ; 289: System.Reflection.Extensions => 0x6942234e => 93
	i32 1766324549, ; 290: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 295
	i32 1770582343, ; 291: Microsoft.Extensions.Logging.dll => 0x6988f147 => 203
	i32 1776026572, ; 292: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 293: System.Globalization.Extensions.dll => 0x69ec0683 => 41
	i32 1780572499, ; 294: Mono.Android.Runtime.dll => 0x6a216153 => 170
	i32 1782862114, ; 295: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 334
	i32 1788241197, ; 296: Xamarin.AndroidX.Fragment => 0x6a96652d => 266
	i32 1793755602, ; 297: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 326
	i32 1794500907, ; 298: Microsoft.Identity.Client.dll => 0x6af5e92b => 208
	i32 1796167890, ; 299: Microsoft.Bcl.AsyncInterfaces.dll => 0x6b0f58d2 => 183
	i32 1808609942, ; 300: Xamarin.AndroidX.Loader => 0x6bcd3296 => 280
	i32 1813058853, ; 301: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 311
	i32 1813201214, ; 302: Xamarin.Google.Android.Material => 0x6c13413e => 305
	i32 1818569960, ; 303: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 285
	i32 1818787751, ; 304: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1824175904, ; 305: System.Text.Encoding.Extensions => 0x6cbab720 => 134
	i32 1824722060, ; 306: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 111
	i32 1827303595, ; 307: Microsoft.VisualStudio.DesignTools.TapContract => 0x6cea70ab => 355
	i32 1828688058, ; 308: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 204
	i32 1829150748, ; 309: System.Windows.Extensions => 0x6d06a01c => 233
	i32 1842015223, ; 310: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 346
	i32 1847515442, ; 311: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 235
	i32 1853025655, ; 312: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 343
	i32 1858542181, ; 313: System.Linq.Expressions => 0x6ec71a65 => 58
	i32 1870277092, ; 314: System.Reflection.Primitives => 0x6f7a29e4 => 95
	i32 1871986876, ; 315: Microsoft.IdentityModel.Protocols.OpenIdConnect.dll => 0x6f9440bc => 214
	i32 1875935024, ; 316: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 325
	i32 1879696579, ; 317: System.Formats.Tar.dll => 0x7009e4c3 => 39
	i32 1885316902, ; 318: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 246
	i32 1885918049, ; 319: Microsoft.VisualStudio.DesignTools.TapContract.dll => 0x7068d361 => 355
	i32 1888955245, ; 320: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 321: System.Reflection.Metadata.dll => 0x70a66bdd => 94
	i32 1898237753, ; 322: System.Reflection.DispatchProxy => 0x7124cf39 => 89
	i32 1900610850, ; 323: System.Resources.ResourceManager.dll => 0x71490522 => 99
	i32 1910275211, ; 324: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1939592360, ; 325: System.Private.Xml.Linq => 0x739bd4a8 => 87
	i32 1956758971, ; 326: System.Resources.Writer => 0x74a1c5bb => 100
	i32 1961813231, ; 327: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 292
	i32 1968388702, ; 328: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 191
	i32 1983156543, ; 329: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 312
	i32 1985761444, ; 330: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 237
	i32 1986222447, ; 331: Microsoft.IdentityModel.Tokens.dll => 0x7663596f => 215
	i32 2003115576, ; 332: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 322
	i32 2011961780, ; 333: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2019465201, ; 334: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 277
	i32 2025202353, ; 335: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 317
	i32 2031763787, ; 336: Xamarin.Android.Glide => 0x791a414b => 234
	i32 2040764568, ; 337: Microsoft.Identity.Client.Extensions.Msal.dll => 0x79a39898 => 209
	i32 2045470958, ; 338: System.Private.Xml => 0x79eb68ee => 88
	i32 2048278909, ; 339: Microsoft.Extensions.Configuration.Binder.dll => 0x7a16417d => 193
	i32 2055257422, ; 340: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 272
	i32 2060060697, ; 341: System.Windows.dll => 0x7aca0819 => 154
	i32 2066184531, ; 342: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 321
	i32 2070888862, ; 343: System.Diagnostics.TraceSource => 0x7b6f419e => 33
	i32 2072397586, ; 344: Microsoft.Extensions.FileProviders.Physical => 0x7b864712 => 201
	i32 2079903147, ; 345: System.Runtime.dll => 0x7bf8cdab => 116
	i32 2090596640, ; 346: System.Numerics.Vectors => 0x7c9bf920 => 82
	i32 2127167465, ; 347: System.Console => 0x7ec9ffe9 => 20
	i32 2142473426, ; 348: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143790110, ; 349: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 162
	i32 2146852085, ; 350: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2159891885, ; 351: Microsoft.Maui => 0x80bd55ad => 220
	i32 2169148018, ; 352: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 329
	i32 2181898931, ; 353: Microsoft.Extensions.Options.dll => 0x820d22b3 => 206
	i32 2192057212, ; 354: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 204
	i32 2193016926, ; 355: System.ObjectModel.dll => 0x82b6c85e => 84
	i32 2201107256, ; 356: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 316
	i32 2201231467, ; 357: System.Net.Http => 0x8334206b => 64
	i32 2207618523, ; 358: it\Microsoft.Maui.Controls.resources => 0x839595db => 331
	i32 2217644978, ; 359: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 299
	i32 2222056684, ; 360: System.Threading.Tasks.Parallel => 0x8471e4ec => 143
	i32 2244775296, ; 361: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 281
	i32 2252106437, ; 362: System.Xml.Serialization.dll => 0x863c6ac5 => 157
	i32 2252897993, ; 363: Microsoft.EntityFrameworkCore => 0x86487ec9 => 185
	i32 2253551641, ; 364: Microsoft.IdentityModel.Protocols => 0x86527819 => 213
	i32 2256313426, ; 365: System.Globalization.Extensions => 0x867c9c52 => 41
	i32 2265110946, ; 366: System.Security.AccessControl.dll => 0x8702d9a2 => 117
	i32 2266799131, ; 367: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 192
	i32 2267999099, ; 368: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 236
	i32 2270573516, ; 369: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 325
	i32 2279755925, ; 370: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 288
	i32 2293034957, ; 371: System.ServiceModel.Web.dll => 0x88acefcd => 131
	i32 2295906218, ; 372: System.Net.Sockets => 0x88d8bfaa => 75
	i32 2298471582, ; 373: System.Net.Mail => 0x88ffe49e => 66
	i32 2303942373, ; 374: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 335
	i32 2305521784, ; 375: System.Private.CoreLib.dll => 0x896b7878 => 172
	i32 2315684594, ; 376: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 240
	i32 2320631194, ; 377: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 143
	i32 2340441535, ; 378: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 106
	i32 2344264397, ; 379: System.ValueTuple => 0x8bbaa2cd => 151
	i32 2353062107, ; 380: System.Net.Primitives => 0x8c40e0db => 70
	i32 2368005991, ; 381: System.Xml.ReaderWriter.dll => 0x8d24e767 => 156
	i32 2369706906, ; 382: Microsoft.IdentityModel.Logging => 0x8d3edb9a => 212
	i32 2371007202, ; 383: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 191
	i32 2378619854, ; 384: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 121
	i32 2383496789, ; 385: System.Security.Principal.Windows.dll => 0x8e114655 => 127
	i32 2395872292, ; 386: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 330
	i32 2401565422, ; 387: System.Web.HttpUtility => 0x8f24faee => 152
	i32 2403452196, ; 388: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 263
	i32 2409983638, ; 389: Microsoft.VisualStudio.DesignTools.MobileTapContracts.dll => 0x8fa56e96 => 354
	i32 2411328690, ; 390: Microsoft.AspNetCore.Components => 0x8fb9f4b2 => 177
	i32 2421380589, ; 391: System.Threading.Tasks.Dataflow => 0x905355ed => 141
	i32 2423080555, ; 392: Xamarin.AndroidX.Collection.Ktx.dll => 0x906d466b => 250
	i32 2427813419, ; 393: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 327
	i32 2435356389, ; 394: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 395: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2442556106, ; 396: Microsoft.JSInterop.dll => 0x919672ca => 216
	i32 2454642406, ; 397: System.Text.Encoding.dll => 0x924edee6 => 135
	i32 2458678730, ; 398: System.Net.Sockets.dll => 0x928c75ca => 75
	i32 2459001652, ; 399: System.Linq.Parallel.dll => 0x92916334 => 59
	i32 2465532216, ; 400: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 253
	i32 2471841756, ; 401: netstandard.dll => 0x93554fdc => 167
	i32 2475788418, ; 402: Java.Interop.dll => 0x93918882 => 168
	i32 2480646305, ; 403: Microsoft.Maui.Controls => 0x93dba8a1 => 218
	i32 2483903535, ; 404: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 405: System.Net.ServicePoint => 0x94147f61 => 74
	i32 2490993605, ; 406: System.AppContext.dll => 0x94798bc5 => 6
	i32 2501346920, ; 407: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2505896520, ; 408: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 275
	i32 2522472828, ; 409: Xamarin.Android.Glide.dll => 0x9659e17c => 234
	i32 2537015816, ; 410: Microsoft.AspNetCore.Authorization => 0x9737ca08 => 176
	i32 2538310050, ; 411: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 91
	i32 2550873716, ; 412: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 328
	i32 2562349572, ; 413: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2570120770, ; 414: System.Text.Encodings.Web => 0x9930ee42 => 136
	i32 2581783588, ; 415: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 276
	i32 2581819634, ; 416: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 298
	i32 2585220780, ; 417: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 134
	i32 2585805581, ; 418: System.Net.Ping => 0x9a20430d => 69
	i32 2585813321, ; 419: Microsoft.AspNetCore.Components.Forms => 0x9a206149 => 178
	i32 2589602615, ; 420: System.Threading.ThreadPool => 0x9a5a3337 => 146
	i32 2592341985, ; 421: Microsoft.Extensions.FileProviders.Abstractions => 0x9a83ffe1 => 198
	i32 2593496499, ; 422: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 337
	i32 2605712449, ; 423: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 316
	i32 2615233544, ; 424: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 267
	i32 2616218305, ; 425: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 205
	i32 2617129537, ; 426: System.Private.Xml.dll => 0x9bfe3a41 => 88
	i32 2618712057, ; 427: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 96
	i32 2620871830, ; 428: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 257
	i32 2624644809, ; 429: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 262
	i32 2626831493, ; 430: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 332
	i32 2627185994, ; 431: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 31
	i32 2628210652, ; 432: System.Memory.Data => 0x9ca74fdc => 229
	i32 2629843544, ; 433: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 45
	i32 2633051222, ; 434: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 271
	i32 2634653062, ; 435: Microsoft.EntityFrameworkCore.Relational.dll => 0x9d099d86 => 187
	i32 2640290731, ; 436: Microsoft.IdentityModel.Logging.dll => 0x9d5fa3ab => 212
	i32 2640706905, ; 437: Azure.Core => 0x9d65fd59 => 173
	i32 2660759594, ; 438: System.Security.Cryptography.ProtectedData.dll => 0x9e97f82a => 231
	i32 2663391936, ; 439: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 236
	i32 2663698177, ; 440: System.Runtime.Loader => 0x9ec4cf01 => 109
	i32 2664396074, ; 441: System.Xml.XDocument.dll => 0x9ecf752a => 158
	i32 2665622720, ; 442: System.Drawing.Primitives => 0x9ee22cc0 => 35
	i32 2676780864, ; 443: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2677098746, ; 444: Azure.Identity.dll => 0x9f9148fa => 174
	i32 2686887180, ; 445: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 114
	i32 2692077919, ; 446: Microsoft.AspNetCore.Components.WebView.dll => 0xa075d95f => 180
	i32 2693849962, ; 447: System.IO.dll => 0xa090e36a => 57
	i32 2701096212, ; 448: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 296
	i32 2715334215, ; 449: System.Threading.Tasks.dll => 0xa1d8b647 => 144
	i32 2717744543, ; 450: System.Security.Claims => 0xa1fd7d9f => 118
	i32 2719963679, ; 451: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 120
	i32 2724373263, ; 452: System.Runtime.Numerics.dll => 0xa262a30f => 110
	i32 2732626843, ; 453: Xamarin.AndroidX.Activity => 0xa2e0939b => 238
	i32 2735172069, ; 454: System.Threading.Channels => 0xa30769e5 => 139
	i32 2735631878, ; 455: Microsoft.AspNetCore.Authorization.dll => 0xa30e6e06 => 176
	i32 2737747696, ; 456: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 244
	i32 2740051746, ; 457: Microsoft.Identity.Client => 0xa351df22 => 208
	i32 2740948882, ; 458: System.IO.Pipes.AccessControl => 0xa35f8f92 => 54
	i32 2748088231, ; 459: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 105
	i32 2752995522, ; 460: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 338
	i32 2755098380, ; 461: Microsoft.SqlServer.Server.dll => 0xa437770c => 223
	i32 2755643133, ; 462: Microsoft.EntityFrameworkCore.SqlServer => 0xa43fc6fd => 188
	i32 2758225723, ; 463: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 219
	i32 2764765095, ; 464: Microsoft.Maui.dll => 0xa4caf7a7 => 220
	i32 2765824710, ; 465: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 133
	i32 2770495804, ; 466: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 310
	i32 2778768386, ; 467: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 301
	i32 2779977773, ; 468: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 289
	i32 2785988530, ; 469: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 344
	i32 2788224221, ; 470: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 267
	i32 2795666278, ; 471: Microsoft.Win32.SystemEvents => 0xa6a27b66 => 224
	i32 2801831435, ; 472: Microsoft.Maui.Graphics => 0xa7008e0b => 222
	i32 2803228030, ; 473: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 159
	i32 2806116107, ; 474: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 323
	i32 2810250172, ; 475: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 254
	i32 2819470561, ; 476: System.Xml.dll => 0xa80db4e1 => 163
	i32 2821205001, ; 477: System.ServiceProcess.dll => 0xa8282c09 => 132
	i32 2821294376, ; 478: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 289
	i32 2824502124, ; 479: System.Xml.XmlDocument => 0xa85a7b6c => 161
	i32 2831556043, ; 480: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 336
	i32 2833784645, ; 481: Microsoft.AspNetCore.Metadata => 0xa8e81f45 => 182
	i32 2838993487, ; 482: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 278
	i32 2841355853, ; 483: System.Security.Permissions => 0xa95ba64d => 232
	i32 2847789619, ; 484: Microsoft.EntityFrameworkCore.Relational => 0xa9bdd233 => 187
	i32 2849599387, ; 485: System.Threading.Overlapped.dll => 0xa9d96f9b => 140
	i32 2853208004, ; 486: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 301
	i32 2855708567, ; 487: Xamarin.AndroidX.Transition => 0xaa36a797 => 297
	i32 2861098320, ; 488: Mono.Android.Export.dll => 0xaa88e550 => 169
	i32 2861189240, ; 489: Microsoft.Maui.Essentials => 0xaa8a4878 => 221
	i32 2867946736, ; 490: System.Security.Cryptography.ProtectedData => 0xaaf164f0 => 231
	i32 2870099610, ; 491: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 239
	i32 2875164099, ; 492: Jsr305Binding.dll => 0xab5f85c3 => 306
	i32 2875220617, ; 493: System.Globalization.Calendars.dll => 0xab606289 => 40
	i32 2884993177, ; 494: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 265
	i32 2887636118, ; 495: System.Net.dll => 0xac1dd496 => 81
	i32 2892341533, ; 496: Microsoft.AspNetCore.Components.Web => 0xac65a11d => 179
	i32 2899753641, ; 497: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 56
	i32 2900621748, ; 498: System.Dynamic.Runtime.dll => 0xace3f9b4 => 37
	i32 2901442782, ; 499: System.Reflection => 0xacf080de => 97
	i32 2905242038, ; 500: mscorlib.dll => 0xad2a79b6 => 166
	i32 2909740682, ; 501: System.Private.CoreLib => 0xad6f1e8a => 172
	i32 2911054922, ; 502: Microsoft.Extensions.FileProviders.Physical.dll => 0xad832c4a => 201
	i32 2916838712, ; 503: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 302
	i32 2919462931, ; 504: System.Numerics.Vectors.dll => 0xae037813 => 82
	i32 2921128767, ; 505: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 241
	i32 2936416060, ; 506: System.Resources.Reader => 0xaf06273c => 98
	i32 2940926066, ; 507: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 30
	i32 2942453041, ; 508: System.Xml.XPath.XDocument => 0xaf624531 => 159
	i32 2944313911, ; 509: System.Configuration.ConfigurationManager.dll => 0xaf7eaa37 => 225
	i32 2959614098, ; 510: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2968338931, ; 511: System.Security.Principal.Windows => 0xb0ed41f3 => 127
	i32 2972252294, ; 512: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 119
	i32 2978675010, ; 513: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 261
	i32 2987532451, ; 514: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 292
	i32 2996846495, ; 515: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 274
	i32 3012788804, ; 516: System.Configuration.ConfigurationManager => 0xb3938244 => 225
	i32 3016983068, ; 517: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 294
	i32 3023353419, ; 518: WindowsBase.dll => 0xb434b64b => 165
	i32 3024354802, ; 519: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 269
	i32 3033605958, ; 520: System.Memory.Data.dll => 0xb4d12746 => 229
	i32 3038032645, ; 521: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 356
	i32 3039935662, ; 522: BlazingQuiz.Shared.Components => 0xb531bcae => 351
	i32 3056245963, ; 523: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 291
	i32 3057625584, ; 524: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 282
	i32 3059408633, ; 525: Mono.Android.Runtime => 0xb65adef9 => 170
	i32 3059793426, ; 526: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3069363400, ; 527: Microsoft.Extensions.Caching.Abstractions.dll => 0xb6f2c4c8 => 189
	i32 3075834255, ; 528: System.Threading.Tasks => 0xb755818f => 144
	i32 3077302341, ; 529: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 329
	i32 3084678329, ; 530: Microsoft.IdentityModel.Tokens => 0xb7dc74b9 => 215
	i32 3090735792, ; 531: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 125
	i32 3099732863, ; 532: System.Security.Claims.dll => 0xb8c22b7f => 118
	i32 3103600923, ; 533: System.Formats.Asn1 => 0xb8fd311b => 38
	i32 3111772706, ; 534: System.Runtime.Serialization => 0xb979e222 => 115
	i32 3121463068, ; 535: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 47
	i32 3124832203, ; 536: System.Threading.Tasks.Extensions => 0xba4127cb => 142
	i32 3132293585, ; 537: System.Security.AccessControl => 0xbab301d1 => 117
	i32 3147165239, ; 538: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 34
	i32 3148237826, ; 539: GoogleGson.dll => 0xbba64c02 => 175
	i32 3159123045, ; 540: System.Reflection.Primitives.dll => 0xbc4c6465 => 95
	i32 3160747431, ; 541: System.IO.MemoryMappedFiles => 0xbc652da7 => 53
	i32 3178803400, ; 542: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 283
	i32 3192346100, ; 543: System.Security.SecureString => 0xbe4755f4 => 129
	i32 3193515020, ; 544: System.Web => 0xbe592c0c => 153
	i32 3195844289, ; 545: Microsoft.Extensions.Caching.Abstractions => 0xbe7cb6c1 => 189
	i32 3204380047, ; 546: System.Data.dll => 0xbefef58f => 24
	i32 3209718065, ; 547: System.Xml.XmlDocument.dll => 0xbf506931 => 161
	i32 3211777861, ; 548: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 260
	i32 3213246214, ; 549: System.Security.Permissions.dll => 0xbf863f06 => 232
	i32 3220365878, ; 550: System.Threading => 0xbff2e236 => 148
	i32 3226221578, ; 551: System.Runtime.Handles.dll => 0xc04c3c0a => 104
	i32 3251039220, ; 552: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 89
	i32 3258312781, ; 553: Xamarin.AndroidX.CardView => 0xc235e84d => 248
	i32 3265493905, ; 554: System.Linq.Queryable.dll => 0xc2a37b91 => 60
	i32 3265893370, ; 555: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 142
	i32 3277815716, ; 556: System.Resources.Writer.dll => 0xc35f7fa4 => 100
	i32 3279906254, ; 557: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 558: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3290767353, ; 559: System.Security.Cryptography.Encoding => 0xc4251ff9 => 122
	i32 3299363146, ; 560: System.Text.Encoding => 0xc4a8494a => 135
	i32 3303498502, ; 561: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 28
	i32 3305363605, ; 562: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 324
	i32 3312457198, ; 563: Microsoft.IdentityModel.JsonWebTokens => 0xc57015ee => 211
	i32 3316684772, ; 564: System.Net.Requests.dll => 0xc5b097e4 => 72
	i32 3317135071, ; 565: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 258
	i32 3317144872, ; 566: System.Data => 0xc5b79d28 => 24
	i32 3331034946, ; 567: BlazingQuiz.Shared.Components.dll => 0xc68b8f42 => 351
	i32 3340431453, ; 568: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 246
	i32 3345895724, ; 569: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 287
	i32 3346324047, ; 570: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 284
	i32 3357674450, ; 571: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 341
	i32 3358260929, ; 572: System.Text.Json => 0xc82afec1 => 137
	i32 3362336904, ; 573: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 239
	i32 3362522851, ; 574: Xamarin.AndroidX.Core => 0xc86c06e3 => 255
	i32 3366347497, ; 575: Java.Interop => 0xc8a662e9 => 168
	i32 3374879918, ; 576: Microsoft.IdentityModel.Protocols.dll => 0xc92894ae => 213
	i32 3374999561, ; 577: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 288
	i32 3381016424, ; 578: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 320
	i32 3395150330, ; 579: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 101
	i32 3403906625, ; 580: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 123
	i32 3405233483, ; 581: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 259
	i32 3406629867, ; 582: Microsoft.Extensions.FileProviders.Composite.dll => 0xcb0d0beb => 199
	i32 3421170118, ; 583: Microsoft.Extensions.Configuration.Binder => 0xcbeae9c6 => 193
	i32 3428513518, ; 584: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 196
	i32 3429136800, ; 585: System.Xml => 0xcc6479a0 => 163
	i32 3430777524, ; 586: netstandard => 0xcc7d82b4 => 167
	i32 3441283291, ; 587: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 262
	i32 3445260447, ; 588: System.Formats.Tar => 0xcd5a809f => 39
	i32 3452344032, ; 589: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 217
	i32 3463511458, ; 590: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 328
	i32 3464190856, ; 591: Microsoft.AspNetCore.Components.Forms.dll => 0xce7b5b88 => 178
	i32 3471940407, ; 592: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3476120550, ; 593: Mono.Android => 0xcf3163e6 => 171
	i32 3479461027, ; 594: BlazingQuiz.Mobile.dll => 0xcf645ca3 => 0
	i32 3479583265, ; 595: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 341
	i32 3484440000, ; 596: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 340
	i32 3485117614, ; 597: System.Text.Json.dll => 0xcfbaacae => 137
	i32 3486566296, ; 598: System.Transactions => 0xcfd0c798 => 150
	i32 3493954962, ; 599: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 251
	i32 3500000672, ; 600: Microsoft.JSInterop => 0xd09dc5a0 => 216
	i32 3509114376, ; 601: System.Xml.Linq => 0xd128d608 => 155
	i32 3515174580, ; 602: System.Security.dll => 0xd1854eb4 => 130
	i32 3530912306, ; 603: System.Configuration => 0xd2757232 => 19
	i32 3539954161, ; 604: System.Net.HttpListener => 0xd2ff69f1 => 65
	i32 3545306353, ; 605: Microsoft.Data.SqlClient => 0xd35114f1 => 184
	i32 3560100363, ; 606: System.Threading.Timer => 0xd432d20b => 147
	i32 3561949811, ; 607: Azure.Core.dll => 0xd44f0a73 => 173
	i32 3570554715, ; 608: System.IO.FileSystem.AccessControl => 0xd4d2575b => 47
	i32 3570608287, ; 609: System.Runtime.Caching.dll => 0xd4d3289f => 230
	i32 3580758918, ; 610: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 348
	i32 3597029428, ; 611: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 237
	i32 3598340787, ; 612: System.Net.WebSockets.Client => 0xd67a52b3 => 79
	i32 3608519521, ; 613: System.Linq.dll => 0xd715a361 => 61
	i32 3624195450, ; 614: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 106
	i32 3627220390, ; 615: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 286
	i32 3633644679, ; 616: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 241
	i32 3638274909, ; 617: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 49
	i32 3641597786, ; 618: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 272
	i32 3643446276, ; 619: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 345
	i32 3643854240, ; 620: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 283
	i32 3645089577, ; 621: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3657292374, ; 622: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 192
	i32 3660523487, ; 623: System.Net.NetworkInformation => 0xda2f27df => 68
	i32 3672681054, ; 624: Mono.Android.dll => 0xdae8aa5e => 171
	i32 3676670898, ; 625: Microsoft.Maui.Controls.HotReload.Forms => 0xdb258bb2 => 353
	i32 3682565725, ; 626: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 247
	i32 3684561358, ; 627: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 251
	i32 3689375977, ; 628: System.Drawing.Common => 0xdbe768e9 => 226
	i32 3697841164, ; 629: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 350
	i32 3700591436, ; 630: Microsoft.IdentityModel.Abstractions.dll => 0xdc928b4c => 210
	i32 3700866549, ; 631: System.Net.WebProxy.dll => 0xdc96bdf5 => 78
	i32 3706696989, ; 632: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 256
	i32 3716563718, ; 633: System.Runtime.Intrinsics => 0xdd864306 => 108
	i32 3718780102, ; 634: Xamarin.AndroidX.Annotation => 0xdda814c6 => 240
	i32 3722202641, ; 635: Microsoft.Extensions.Configuration.Json.dll => 0xdddc4e11 => 195
	i32 3724971120, ; 636: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 282
	i32 3732100267, ; 637: System.Net.NameResolution => 0xde7354ab => 67
	i32 3732214720, ; 638: Microsoft.AspNetCore.Metadata.dll => 0xde7513c0 => 182
	i32 3737834244, ; 639: System.Net.Http.Json.dll => 0xdecad304 => 63
	i32 3748608112, ; 640: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 27
	i32 3751444290, ; 641: System.Xml.XPath => 0xdf9a7f42 => 160
	i32 3758424670, ; 642: Microsoft.Extensions.Configuration.FileExtensions => 0xe005025e => 194
	i32 3786282454, ; 643: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 249
	i32 3792276235, ; 644: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3800979733, ; 645: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 217
	i32 3802395368, ; 646: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3819260425, ; 647: System.Net.WebProxy => 0xe3a54a09 => 78
	i32 3823082795, ; 648: System.Security.Cryptography.dll => 0xe3df9d2b => 126
	i32 3829621856, ; 649: System.Numerics.dll => 0xe4436460 => 83
	i32 3841636137, ; 650: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 197
	i32 3844307129, ; 651: System.Net.Mail.dll => 0xe52378b9 => 66
	i32 3849253459, ; 652: System.Runtime.InteropServices.dll => 0xe56ef253 => 107
	i32 3870376305, ; 653: System.Net.HttpListener.dll => 0xe6b14171 => 65
	i32 3873536506, ; 654: System.Security.Principal => 0xe6e179fa => 128
	i32 3875112723, ; 655: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 122
	i32 3885497537, ; 656: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 77
	i32 3885922214, ; 657: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 297
	i32 3888767677, ; 658: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 287
	i32 3889960447, ; 659: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 349
	i32 3896106733, ; 660: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 661: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 255
	i32 3901907137, ; 662: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3920810846, ; 663: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 44
	i32 3921031405, ; 664: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 300
	i32 3928044579, ; 665: System.Xml.ReaderWriter => 0xea213423 => 156
	i32 3930554604, ; 666: System.Security.Principal.dll => 0xea4780ec => 128
	i32 3931092270, ; 667: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 285
	i32 3945713374, ; 668: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3953953790, ; 669: System.Text.Encoding.CodePages => 0xebac8bfe => 133
	i32 3955647286, ; 670: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 243
	i32 3959773229, ; 671: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 274
	i32 3980434154, ; 672: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 344
	i32 3987592930, ; 673: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 326
	i32 4003436829, ; 674: System.Diagnostics.Process.dll => 0xee9f991d => 29
	i32 4015948917, ; 675: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 242
	i32 4023392905, ; 676: System.IO.Pipelines => 0xefd01a89 => 228
	i32 4025784931, ; 677: System.Memory => 0xeff49a63 => 62
	i32 4046471985, ; 678: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 219
	i32 4054681211, ; 679: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 90
	i32 4068434129, ; 680: System.Private.Xml.Linq.dll => 0xf27f60d1 => 87
	i32 4073602200, ; 681: System.Threading.dll => 0xf2ce3c98 => 148
	i32 4094352644, ; 682: Microsoft.Maui.Essentials.dll => 0xf40add04 => 221
	i32 4099507663, ; 683: System.Drawing.dll => 0xf45985cf => 36
	i32 4100113165, ; 684: System.Private.Uri => 0xf462c30d => 86
	i32 4101593132, ; 685: Xamarin.AndroidX.Emoji2 => 0xf479582c => 263
	i32 4101842092, ; 686: Microsoft.Extensions.Caching.Memory => 0xf47d24ac => 190
	i32 4102112229, ; 687: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 339
	i32 4125707920, ; 688: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 334
	i32 4126470640, ; 689: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 196
	i32 4127667938, ; 690: System.IO.FileSystem.Watcher => 0xf60736e2 => 50
	i32 4130442656, ; 691: System.AppContext => 0xf6318da0 => 6
	i32 4147896353, ; 692: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 90
	i32 4150914736, ; 693: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 346
	i32 4151237749, ; 694: System.Core => 0xf76edc75 => 21
	i32 4159265925, ; 695: System.Xml.XmlSerializer => 0xf7e95c85 => 162
	i32 4161255271, ; 696: System.Reflection.TypeExtensions => 0xf807b767 => 96
	i32 4164802419, ; 697: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 50
	i32 4181436372, ; 698: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 113
	i32 4182413190, ; 699: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 279
	i32 4182880526, ; 700: Microsoft.VisualStudio.DesignTools.MobileTapContracts => 0xf951b10e => 354
	i32 4185676441, ; 701: System.Security => 0xf97c5a99 => 130
	i32 4194278001, ; 702: Microsoft.EntityFrameworkCore.SqlServer.dll => 0xf9ff9a71 => 188
	i32 4196529839, ; 703: System.Net.WebClient.dll => 0xfa21f6af => 76
	i32 4213026141, ; 704: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 27
	i32 4256097574, ; 705: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 256
	i32 4258378803, ; 706: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 278
	i32 4260525087, ; 707: System.Buffers => 0xfdf2741f => 7
	i32 4263231520, ; 708: System.IdentityModel.Tokens.Jwt.dll => 0xfe1bc020 => 227
	i32 4271975918, ; 709: Microsoft.Maui.Controls.dll => 0xfea12dee => 218
	i32 4274976490, ; 710: System.Runtime.Numerics => 0xfecef6ea => 110
	i32 4292120959, ; 711: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 279
	i32 4294648842, ; 712: Microsoft.Extensions.FileProviders.Embedded => 0xfffb240a => 200
	i32 4294763496 ; 713: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 265
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [714 x i32] [
	i32 68, ; 0
	i32 67, ; 1
	i32 108, ; 2
	i32 275, ; 3
	i32 309, ; 4
	i32 48, ; 5
	i32 80, ; 6
	i32 145, ; 7
	i32 224, ; 8
	i32 30, ; 9
	i32 350, ; 10
	i32 124, ; 11
	i32 222, ; 12
	i32 102, ; 13
	i32 293, ; 14
	i32 107, ; 15
	i32 293, ; 16
	i32 139, ; 17
	i32 313, ; 18
	i32 77, ; 19
	i32 124, ; 20
	i32 13, ; 21
	i32 249, ; 22
	i32 132, ; 23
	i32 295, ; 24
	i32 151, ; 25
	i32 347, ; 26
	i32 348, ; 27
	i32 18, ; 28
	i32 247, ; 29
	i32 26, ; 30
	i32 269, ; 31
	i32 1, ; 32
	i32 59, ; 33
	i32 42, ; 34
	i32 91, ; 35
	i32 177, ; 36
	i32 252, ; 37
	i32 147, ; 38
	i32 271, ; 39
	i32 268, ; 40
	i32 319, ; 41
	i32 54, ; 42
	i32 69, ; 43
	i32 347, ; 44
	i32 238, ; 45
	i32 83, ; 46
	i32 223, ; 47
	i32 332, ; 48
	i32 270, ; 49
	i32 331, ; 50
	i32 131, ; 51
	i32 55, ; 52
	i32 149, ; 53
	i32 74, ; 54
	i32 145, ; 55
	i32 62, ; 56
	i32 146, ; 57
	i32 356, ; 58
	i32 165, ; 59
	i32 343, ; 60
	i32 253, ; 61
	i32 12, ; 62
	i32 266, ; 63
	i32 125, ; 64
	i32 152, ; 65
	i32 113, ; 66
	i32 166, ; 67
	i32 164, ; 68
	i32 268, ; 69
	i32 210, ; 70
	i32 281, ; 71
	i32 84, ; 72
	i32 330, ; 73
	i32 324, ; 74
	i32 207, ; 75
	i32 150, ; 76
	i32 313, ; 77
	i32 60, ; 78
	i32 203, ; 79
	i32 51, ; 80
	i32 103, ; 81
	i32 114, ; 82
	i32 183, ; 83
	i32 40, ; 84
	i32 306, ; 85
	i32 304, ; 86
	i32 200, ; 87
	i32 120, ; 88
	i32 338, ; 89
	i32 52, ; 90
	i32 44, ; 91
	i32 119, ; 92
	i32 258, ; 93
	i32 336, ; 94
	i32 264, ; 95
	i32 81, ; 96
	i32 136, ; 97
	i32 300, ; 98
	i32 245, ; 99
	i32 8, ; 100
	i32 73, ; 101
	i32 318, ; 102
	i32 155, ; 103
	i32 315, ; 104
	i32 154, ; 105
	i32 92, ; 106
	i32 310, ; 107
	i32 45, ; 108
	i32 333, ; 109
	i32 321, ; 110
	i32 314, ; 111
	i32 109, ; 112
	i32 129, ; 113
	i32 25, ; 114
	i32 235, ; 115
	i32 72, ; 116
	i32 55, ; 117
	i32 46, ; 118
	i32 342, ; 119
	i32 206, ; 120
	i32 259, ; 121
	i32 181, ; 122
	i32 22, ; 123
	i32 273, ; 124
	i32 226, ; 125
	i32 86, ; 126
	i32 43, ; 127
	i32 160, ; 128
	i32 71, ; 129
	i32 286, ; 130
	i32 3, ; 131
	i32 42, ; 132
	i32 63, ; 133
	i32 16, ; 134
	i32 53, ; 135
	i32 345, ; 136
	i32 309, ; 137
	i32 105, ; 138
	i32 314, ; 139
	i32 307, ; 140
	i32 270, ; 141
	i32 34, ; 142
	i32 158, ; 143
	i32 85, ; 144
	i32 32, ; 145
	i32 12, ; 146
	i32 51, ; 147
	i32 202, ; 148
	i32 56, ; 149
	i32 290, ; 150
	i32 36, ; 151
	i32 197, ; 152
	i32 320, ; 153
	i32 308, ; 154
	i32 243, ; 155
	i32 35, ; 156
	i32 58, ; 157
	i32 277, ; 158
	i32 352, ; 159
	i32 209, ; 160
	i32 175, ; 161
	i32 17, ; 162
	i32 311, ; 163
	i32 164, ; 164
	i32 194, ; 165
	i32 333, ; 166
	i32 276, ; 167
	i32 205, ; 168
	i32 184, ; 169
	i32 233, ; 170
	i32 303, ; 171
	i32 186, ; 172
	i32 339, ; 173
	i32 153, ; 174
	i32 198, ; 175
	i32 299, ; 176
	i32 284, ; 177
	i32 186, ; 178
	i32 337, ; 179
	i32 245, ; 180
	i32 190, ; 181
	i32 29, ; 182
	i32 52, ; 183
	i32 0, ; 184
	i32 335, ; 185
	i32 304, ; 186
	i32 5, ; 187
	i32 319, ; 188
	i32 352, ; 189
	i32 294, ; 190
	i32 298, ; 191
	i32 250, ; 192
	i32 315, ; 193
	i32 242, ; 194
	i32 261, ; 195
	i32 85, ; 196
	i32 303, ; 197
	i32 61, ; 198
	i32 112, ; 199
	i32 57, ; 200
	i32 349, ; 201
	i32 290, ; 202
	i32 99, ; 203
	i32 19, ; 204
	i32 254, ; 205
	i32 111, ; 206
	i32 101, ; 207
	i32 102, ; 208
	i32 317, ; 209
	i32 104, ; 210
	i32 307, ; 211
	i32 71, ; 212
	i32 38, ; 213
	i32 32, ; 214
	i32 199, ; 215
	i32 103, ; 216
	i32 73, ; 217
	i32 227, ; 218
	i32 323, ; 219
	i32 9, ; 220
	i32 123, ; 221
	i32 46, ; 222
	i32 244, ; 223
	i32 207, ; 224
	i32 9, ; 225
	i32 43, ; 226
	i32 4, ; 227
	i32 291, ; 228
	i32 327, ; 229
	i32 211, ; 230
	i32 322, ; 231
	i32 202, ; 232
	i32 31, ; 233
	i32 138, ; 234
	i32 92, ; 235
	i32 181, ; 236
	i32 93, ; 237
	i32 342, ; 238
	i32 230, ; 239
	i32 49, ; 240
	i32 141, ; 241
	i32 112, ; 242
	i32 140, ; 243
	i32 174, ; 244
	i32 260, ; 245
	i32 115, ; 246
	i32 308, ; 247
	i32 157, ; 248
	i32 353, ; 249
	i32 76, ; 250
	i32 79, ; 251
	i32 280, ; 252
	i32 37, ; 253
	i32 302, ; 254
	i32 214, ; 255
	i32 195, ; 256
	i32 264, ; 257
	i32 257, ; 258
	i32 64, ; 259
	i32 138, ; 260
	i32 15, ; 261
	i32 180, ; 262
	i32 116, ; 263
	i32 296, ; 264
	i32 305, ; 265
	i32 252, ; 266
	i32 48, ; 267
	i32 70, ; 268
	i32 80, ; 269
	i32 126, ; 270
	i32 185, ; 271
	i32 94, ; 272
	i32 121, ; 273
	i32 312, ; 274
	i32 26, ; 275
	i32 273, ; 276
	i32 97, ; 277
	i32 28, ; 278
	i32 248, ; 279
	i32 340, ; 280
	i32 318, ; 281
	i32 149, ; 282
	i32 228, ; 283
	i32 169, ; 284
	i32 4, ; 285
	i32 98, ; 286
	i32 179, ; 287
	i32 33, ; 288
	i32 93, ; 289
	i32 295, ; 290
	i32 203, ; 291
	i32 21, ; 292
	i32 41, ; 293
	i32 170, ; 294
	i32 334, ; 295
	i32 266, ; 296
	i32 326, ; 297
	i32 208, ; 298
	i32 183, ; 299
	i32 280, ; 300
	i32 311, ; 301
	i32 305, ; 302
	i32 285, ; 303
	i32 2, ; 304
	i32 134, ; 305
	i32 111, ; 306
	i32 355, ; 307
	i32 204, ; 308
	i32 233, ; 309
	i32 346, ; 310
	i32 235, ; 311
	i32 343, ; 312
	i32 58, ; 313
	i32 95, ; 314
	i32 214, ; 315
	i32 325, ; 316
	i32 39, ; 317
	i32 246, ; 318
	i32 355, ; 319
	i32 25, ; 320
	i32 94, ; 321
	i32 89, ; 322
	i32 99, ; 323
	i32 10, ; 324
	i32 87, ; 325
	i32 100, ; 326
	i32 292, ; 327
	i32 191, ; 328
	i32 312, ; 329
	i32 237, ; 330
	i32 215, ; 331
	i32 322, ; 332
	i32 7, ; 333
	i32 277, ; 334
	i32 317, ; 335
	i32 234, ; 336
	i32 209, ; 337
	i32 88, ; 338
	i32 193, ; 339
	i32 272, ; 340
	i32 154, ; 341
	i32 321, ; 342
	i32 33, ; 343
	i32 201, ; 344
	i32 116, ; 345
	i32 82, ; 346
	i32 20, ; 347
	i32 11, ; 348
	i32 162, ; 349
	i32 3, ; 350
	i32 220, ; 351
	i32 329, ; 352
	i32 206, ; 353
	i32 204, ; 354
	i32 84, ; 355
	i32 316, ; 356
	i32 64, ; 357
	i32 331, ; 358
	i32 299, ; 359
	i32 143, ; 360
	i32 281, ; 361
	i32 157, ; 362
	i32 185, ; 363
	i32 213, ; 364
	i32 41, ; 365
	i32 117, ; 366
	i32 192, ; 367
	i32 236, ; 368
	i32 325, ; 369
	i32 288, ; 370
	i32 131, ; 371
	i32 75, ; 372
	i32 66, ; 373
	i32 335, ; 374
	i32 172, ; 375
	i32 240, ; 376
	i32 143, ; 377
	i32 106, ; 378
	i32 151, ; 379
	i32 70, ; 380
	i32 156, ; 381
	i32 212, ; 382
	i32 191, ; 383
	i32 121, ; 384
	i32 127, ; 385
	i32 330, ; 386
	i32 152, ; 387
	i32 263, ; 388
	i32 354, ; 389
	i32 177, ; 390
	i32 141, ; 391
	i32 250, ; 392
	i32 327, ; 393
	i32 20, ; 394
	i32 14, ; 395
	i32 216, ; 396
	i32 135, ; 397
	i32 75, ; 398
	i32 59, ; 399
	i32 253, ; 400
	i32 167, ; 401
	i32 168, ; 402
	i32 218, ; 403
	i32 15, ; 404
	i32 74, ; 405
	i32 6, ; 406
	i32 23, ; 407
	i32 275, ; 408
	i32 234, ; 409
	i32 176, ; 410
	i32 91, ; 411
	i32 328, ; 412
	i32 1, ; 413
	i32 136, ; 414
	i32 276, ; 415
	i32 298, ; 416
	i32 134, ; 417
	i32 69, ; 418
	i32 178, ; 419
	i32 146, ; 420
	i32 198, ; 421
	i32 337, ; 422
	i32 316, ; 423
	i32 267, ; 424
	i32 205, ; 425
	i32 88, ; 426
	i32 96, ; 427
	i32 257, ; 428
	i32 262, ; 429
	i32 332, ; 430
	i32 31, ; 431
	i32 229, ; 432
	i32 45, ; 433
	i32 271, ; 434
	i32 187, ; 435
	i32 212, ; 436
	i32 173, ; 437
	i32 231, ; 438
	i32 236, ; 439
	i32 109, ; 440
	i32 158, ; 441
	i32 35, ; 442
	i32 22, ; 443
	i32 174, ; 444
	i32 114, ; 445
	i32 180, ; 446
	i32 57, ; 447
	i32 296, ; 448
	i32 144, ; 449
	i32 118, ; 450
	i32 120, ; 451
	i32 110, ; 452
	i32 238, ; 453
	i32 139, ; 454
	i32 176, ; 455
	i32 244, ; 456
	i32 208, ; 457
	i32 54, ; 458
	i32 105, ; 459
	i32 338, ; 460
	i32 223, ; 461
	i32 188, ; 462
	i32 219, ; 463
	i32 220, ; 464
	i32 133, ; 465
	i32 310, ; 466
	i32 301, ; 467
	i32 289, ; 468
	i32 344, ; 469
	i32 267, ; 470
	i32 224, ; 471
	i32 222, ; 472
	i32 159, ; 473
	i32 323, ; 474
	i32 254, ; 475
	i32 163, ; 476
	i32 132, ; 477
	i32 289, ; 478
	i32 161, ; 479
	i32 336, ; 480
	i32 182, ; 481
	i32 278, ; 482
	i32 232, ; 483
	i32 187, ; 484
	i32 140, ; 485
	i32 301, ; 486
	i32 297, ; 487
	i32 169, ; 488
	i32 221, ; 489
	i32 231, ; 490
	i32 239, ; 491
	i32 306, ; 492
	i32 40, ; 493
	i32 265, ; 494
	i32 81, ; 495
	i32 179, ; 496
	i32 56, ; 497
	i32 37, ; 498
	i32 97, ; 499
	i32 166, ; 500
	i32 172, ; 501
	i32 201, ; 502
	i32 302, ; 503
	i32 82, ; 504
	i32 241, ; 505
	i32 98, ; 506
	i32 30, ; 507
	i32 159, ; 508
	i32 225, ; 509
	i32 18, ; 510
	i32 127, ; 511
	i32 119, ; 512
	i32 261, ; 513
	i32 292, ; 514
	i32 274, ; 515
	i32 225, ; 516
	i32 294, ; 517
	i32 165, ; 518
	i32 269, ; 519
	i32 229, ; 520
	i32 356, ; 521
	i32 351, ; 522
	i32 291, ; 523
	i32 282, ; 524
	i32 170, ; 525
	i32 16, ; 526
	i32 189, ; 527
	i32 144, ; 528
	i32 329, ; 529
	i32 215, ; 530
	i32 125, ; 531
	i32 118, ; 532
	i32 38, ; 533
	i32 115, ; 534
	i32 47, ; 535
	i32 142, ; 536
	i32 117, ; 537
	i32 34, ; 538
	i32 175, ; 539
	i32 95, ; 540
	i32 53, ; 541
	i32 283, ; 542
	i32 129, ; 543
	i32 153, ; 544
	i32 189, ; 545
	i32 24, ; 546
	i32 161, ; 547
	i32 260, ; 548
	i32 232, ; 549
	i32 148, ; 550
	i32 104, ; 551
	i32 89, ; 552
	i32 248, ; 553
	i32 60, ; 554
	i32 142, ; 555
	i32 100, ; 556
	i32 5, ; 557
	i32 13, ; 558
	i32 122, ; 559
	i32 135, ; 560
	i32 28, ; 561
	i32 324, ; 562
	i32 211, ; 563
	i32 72, ; 564
	i32 258, ; 565
	i32 24, ; 566
	i32 351, ; 567
	i32 246, ; 568
	i32 287, ; 569
	i32 284, ; 570
	i32 341, ; 571
	i32 137, ; 572
	i32 239, ; 573
	i32 255, ; 574
	i32 168, ; 575
	i32 213, ; 576
	i32 288, ; 577
	i32 320, ; 578
	i32 101, ; 579
	i32 123, ; 580
	i32 259, ; 581
	i32 199, ; 582
	i32 193, ; 583
	i32 196, ; 584
	i32 163, ; 585
	i32 167, ; 586
	i32 262, ; 587
	i32 39, ; 588
	i32 217, ; 589
	i32 328, ; 590
	i32 178, ; 591
	i32 17, ; 592
	i32 171, ; 593
	i32 0, ; 594
	i32 341, ; 595
	i32 340, ; 596
	i32 137, ; 597
	i32 150, ; 598
	i32 251, ; 599
	i32 216, ; 600
	i32 155, ; 601
	i32 130, ; 602
	i32 19, ; 603
	i32 65, ; 604
	i32 184, ; 605
	i32 147, ; 606
	i32 173, ; 607
	i32 47, ; 608
	i32 230, ; 609
	i32 348, ; 610
	i32 237, ; 611
	i32 79, ; 612
	i32 61, ; 613
	i32 106, ; 614
	i32 286, ; 615
	i32 241, ; 616
	i32 49, ; 617
	i32 272, ; 618
	i32 345, ; 619
	i32 283, ; 620
	i32 14, ; 621
	i32 192, ; 622
	i32 68, ; 623
	i32 171, ; 624
	i32 353, ; 625
	i32 247, ; 626
	i32 251, ; 627
	i32 226, ; 628
	i32 350, ; 629
	i32 210, ; 630
	i32 78, ; 631
	i32 256, ; 632
	i32 108, ; 633
	i32 240, ; 634
	i32 195, ; 635
	i32 282, ; 636
	i32 67, ; 637
	i32 182, ; 638
	i32 63, ; 639
	i32 27, ; 640
	i32 160, ; 641
	i32 194, ; 642
	i32 249, ; 643
	i32 10, ; 644
	i32 217, ; 645
	i32 11, ; 646
	i32 78, ; 647
	i32 126, ; 648
	i32 83, ; 649
	i32 197, ; 650
	i32 66, ; 651
	i32 107, ; 652
	i32 65, ; 653
	i32 128, ; 654
	i32 122, ; 655
	i32 77, ; 656
	i32 297, ; 657
	i32 287, ; 658
	i32 349, ; 659
	i32 8, ; 660
	i32 255, ; 661
	i32 2, ; 662
	i32 44, ; 663
	i32 300, ; 664
	i32 156, ; 665
	i32 128, ; 666
	i32 285, ; 667
	i32 23, ; 668
	i32 133, ; 669
	i32 243, ; 670
	i32 274, ; 671
	i32 344, ; 672
	i32 326, ; 673
	i32 29, ; 674
	i32 242, ; 675
	i32 228, ; 676
	i32 62, ; 677
	i32 219, ; 678
	i32 90, ; 679
	i32 87, ; 680
	i32 148, ; 681
	i32 221, ; 682
	i32 36, ; 683
	i32 86, ; 684
	i32 263, ; 685
	i32 190, ; 686
	i32 339, ; 687
	i32 334, ; 688
	i32 196, ; 689
	i32 50, ; 690
	i32 6, ; 691
	i32 90, ; 692
	i32 346, ; 693
	i32 21, ; 694
	i32 162, ; 695
	i32 96, ; 696
	i32 50, ; 697
	i32 113, ; 698
	i32 279, ; 699
	i32 354, ; 700
	i32 130, ; 701
	i32 188, ; 702
	i32 76, ; 703
	i32 27, ; 704
	i32 256, ; 705
	i32 278, ; 706
	i32 7, ; 707
	i32 227, ; 708
	i32 218, ; 709
	i32 110, ; 710
	i32 279, ; 711
	i32 200, ; 712
	i32 265 ; 713
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.4xx @ a8cd27e430e55df3e3c1e3a43d35c11d9512a2db"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"min_enum_size", i32 4}
