import 'package:coinranking/core/network/connection_checker.dart';
import 'package:coinranking/core/network/dio_client.dart';
import 'package:coinranking/core/utils/user_storage.dart';
import 'package:coinranking/features/dashboard/data/datasources/dashboard_remote_datasources.dart';
import 'package:coinranking/features/dashboard/data/repository/dashboard_repository_impl.dart';
import 'package:coinranking/features/dashboard/domain/repository/dashboard_repository.dart';
import 'package:coinranking/features/dashboard/domain/usecases/get_coins_usecase.dart';
import 'package:coinranking/features/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  await dotenv.load(fileName: ".env");
  await Future.delayed(const Duration(seconds: 3));
  _initDashboard();
  // _initAuth();
  // _initAiSmartContentMainDashboard();
  // _initOnboarding();
  // _initDashboard();
  // _initCampaigns();
  // _initDmAutomationMainDashboard();
  // _initDmAutomationLeadMainDashboard();
  // _initDmAutomationCampaign();
  // _initDmAutomationMessages();
  // _initGlobal();
  // _initAiSmartContentCampaign();
  // _initCreateAiSmartContentCampaign();
  // _initAccount();
  // _initGrowthToolMainDashboard();
  // _initGrowthToolCampaigns();
  // _initProfileSettings();
  // _initUpdateSettings();
  // _initFreeCredits();
  // _initLearning();
  // _initAffiliateProgram();
  // _initCredits();
  // _initGlobalBlocking();
  final DioClient dioClient = DioClient();
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final UserStorage userStorage = UserStorage();

  // Hive.defaultDirectory = (await getApplicationDocumentsDirectory()).path;

  serviceLocator.registerLazySingleton(() => dioClient);
  serviceLocator.registerLazySingleton(() => userStorage);
  serviceLocator.registerLazySingleton(() => googleSignIn);
  // serviceLocator.registerLazySingleton(() => firebase);
  // serviceLocator.registerLazySingleton(
  //   () => Hive.box(name: 'user'),
  // );

  // if (Platform.isAndroid) {
  //   await InAppWebViewController.setWebContentsDebuggingEnabled(true);
  // }
  serviceLocator.registerFactory(() => InternetConnection());

  serviceLocator.registerFactory<ConnectionChecker>(
    () => ConnectionCheckerImpl(serviceLocator()),
  );
}

// void _initAuth() {
//   // Datasource
//   serviceLocator
//     ..registerFactory<AuthenticationRemoteDatasourceImpl>(
//       () => AuthenticationRemoteDatasourceImpl(
//         serviceLocator(),
//         serviceLocator(),
//       ),
//     )
//     // ..registerFactory<AuthenticationLocalDataSourceImpl>(
//     //   () => AuthenticationLocalDataSourceImpl(serviceLocator()),
//     // )
//     // Repository
//     ..registerFactory<AuthenticationRepository>(
//       () => AuthenticationRepositoryImpl(
//         connectionChecker: serviceLocator(),
//         googleSignIn: serviceLocator(),
//         remoteDataSource: serviceLocator(),
//       ),
//     )
//     //usecases
//     ..registerFactory(() => RegisterUserUsecase(serviceLocator()))
//     ..registerFactory(() => LoginUserUsecase(serviceLocator()))
//     ..registerFactory(() => VerifyUserEmailOrPhoneUsecase(serviceLocator()))
//     // ..registerFactory(() => VerifyPasswordOTPUsecase(serviceLocator()))
//     // ..registerFactory(() => ResendEmailOTPUsecase(serviceLocator()))
//     ..registerFactory(() => ConfirmUserEmailUsecase(serviceLocator()))
//     ..registerFactory(() => ConfirmUserPhoneNumberUsecase(serviceLocator()))
//     ..registerFactory(() => ForgetPasswordUsecase(serviceLocator()))
//     ..registerFactory(() => GoogleLoginUsecase(serviceLocator()))
//     ..registerFactory(() => UpdatePasswordUsecase(serviceLocator()))
//     ..registerFactory(() => VerifyOtpUpdateContactUsecase(serviceLocator()))
//     ..registerFactory(() => UpdateContactUsecase(serviceLocator()))
//     ..registerFactory(() => ResetPasswordUsecase(serviceLocator()));
//   //..registerFactory(() => GetCurrentUserUsecase(serviceLocator()));

//   // cubit
//   serviceLocator.registerLazySingleton(
//     () => AuthenticationCubit(
//       updatePasswordUsecase: serviceLocator(),
//       googleLoginUsecase: serviceLocator(),
//       registerUserseCase: serviceLocator(),
//       loginUserUsecase: serviceLocator(),
//       verifyEmailUsecase: serviceLocator(),
//       forgetPasswordUsecase: serviceLocator(),
//       confirmUserEmailUsecase: serviceLocator(),
//       confirmUserPhoneNumberUsecase: serviceLocator(),
//       updateContactUsecase: serviceLocator(),
//       verifyOtpUpdateContactUsecase: serviceLocator(),
//       // verifyPasswordUsecase: serviceLocator(),
//       // resendEmailOTPUsecase: serviceLocator(),
//       resetPasswordUsecase: serviceLocator(),
//     ),
//   );
// }

void _initDashboard() {
  //DataSource
  serviceLocator
    ..registerFactory<DashboardRemoteDatasources>(
      () => DashboardRemoteDatasourcesImpl(serviceLocator()),
    )
    //Repo
    ..registerFactory<DashboardRepository>(
      () => DashboardRepositoryImpl(serviceLocator(), serviceLocator()),
    )
    //UserCase
    ..registerFactory(() => GetCoinsUsecase(serviceLocator()));
  //Cubit
  serviceLocator.registerLazySingleton(
    () => DashboardCubit(getCoinsUsecase: serviceLocator()),
  );
}

// void _initCampaigns() {
//   serviceLocator
//     ..registerFactory<CampaignRemoteDatasourceImp>(
//       () => CampaignRemoteDatasourceImp(serviceLocator()),
//     )
//     ..registerFactory<CampaignRepository>(
//       () => CampaignRepositoryImpl(serviceLocator(), serviceLocator()),
//     )
//     ..registerFactory(() => GetLatestCampaignUsecase(serviceLocator()));
// }

// void _initDashboard() {
//   //Datasource
//   serviceLocator
//     ..registerFactory<DashboardRemoteDatasourceImpl>(
//       () => DashboardRemoteDatasourceImpl(serviceLocator()),
//     )
//     //Repo
//     ..registerFactory<DashboardRepository>(
//       () => DashboardRepositoryImpl(serviceLocator(), serviceLocator()),
//     )
//     //UseCase
//     ..registerFactory(() => GetUserDetailsUsecase(serviceLocator()))
//     ..registerFactory(() => FetchFeedBackUsecase(serviceLocator()))
//     ..registerFactory(() => AddFeedBackUsecase(serviceLocator()))
//     ..registerFactory(() => VoteUsecase(serviceLocator()));

//   //Cubit
//   serviceLocator.registerLazySingleton(
//     () => DashboardCubit(
//       getUserDetailsUsecase: serviceLocator(),
//       getLatestCampaignUsecase: serviceLocator(),
//     ),
//   );

//   serviceLocator.registerLazySingleton(
//     () => FeedbackCubit(
//       fetchFeedBackUsecase: serviceLocator(),
//       voteUsecase: serviceLocator(),
//     ),
//   );
//   serviceLocator.registerLazySingleton(
//     () => AddFeedbackCubit(addFeedBackUsecase: serviceLocator()),
//   );
// }

// void _initDmAutomationMainDashboard() {
//   //Datasource
//   serviceLocator
//     ..registerFactory<DmAutomationRemoteDatasourceImpl>(
//       () => DmAutomationRemoteDatasourceImpl(serviceLocator()),
//     )
//     //Repo
//     ..registerFactory<DmAutomationRepository>(
//       () => DmAutomationRepositoryImpl(serviceLocator(), serviceLocator()),
//     )
//     //UseCase
//     ..registerFactory(() => FetchDmAutomationCampaignsUsecase(serviceLocator()))
//     ..registerFactory(() => FetchXAccountUsecase(serviceLocator()))
//     ..registerFactory(() => FetchDmAutomationMetricesUsecase(serviceLocator()));
//   //Cubit
//   serviceLocator.registerLazySingleton(
//     () => DmAutomationMainDashboardDartCubit(
//       fetchDmAutomationCampaignsUsecase: serviceLocator(),
//       fetchDmAutomationMetricesUsecase: serviceLocator(),
//       // fetchXAccountUsecase: serviceLocator(),
//     ),
//   );
// }

// void _initDmAutomationLeadMainDashboard() {
//   //Datasource
//   serviceLocator
//     ..registerFactory<DmAutomationLeadRemoteDatasourceImpl>(
//       () => DmAutomationLeadRemoteDatasourceImpl(serviceLocator()),
//     )
//     //Repo
//     ..registerFactory<DmAutomationLeadRepository>(
//       () => DmAutomationLeadRepositoryImpl(serviceLocator(), serviceLocator()),
//     )
//     //UseCase
//     ..registerFactory(() => FetchLeadCampaignUsecase(serviceLocator()))
//     ..registerFactory(() => DownloadLeadsUsecase(serviceLocator()))
//     ..registerFactory(() => DeleteLeadsUsecase(serviceLocator()))
//     ..registerFactory(() => ImportLeadAccountSourceUsecase(serviceLocator()))
//     ..registerFactory(() => FetchLeadUsecase(serviceLocator()));

//   //Cubit
//   serviceLocator.registerLazySingleton(
//     () => DmAutomationLeadDashboardCubit(
//       fetchLeadCampaignUsecase: serviceLocator(),
//       fetchLeadUsecase: serviceLocator(),
//     ),
//   );
//   serviceLocator.registerLazySingleton(
//     () =>
//         DmAutomationDownloadLeadsCubit(downloadLeadsUsecase: serviceLocator()),
//   );
//   serviceLocator.registerLazySingleton(
//     () => DmAutomationDeleteLeadCubit(deleteLeadsUsecase: serviceLocator()),
//   );
//   serviceLocator.registerLazySingleton(
//     () => DmAutomationImportLeadAccountSourceCubit(
//       importLeadAccountSourceUsecase: serviceLocator(),
//     ),
//   );
// }

// void _initDmAutomationCampaign() {
//   //Datasource
//   serviceLocator
//     ..registerFactory<DMAutomationCampaignRemoteDatasource>(
//       () => DMAutomationCampaignRemoteDatasourceImpl(serviceLocator()),
//     )
//     //Repo
//     ..registerFactory<DMAutomationCampaignRepository>(
//       () => DMAutomationCampaignRepositoryImpl(
//         serviceLocator(),
//         serviceLocator(),
//       ),
//     )
//     //UseCase
//     ..registerFactory(() => FetchDMAutomationCampaignsUsecase(serviceLocator()))
//     ..registerFactory(
//       () => deleteDmAutomationCampaign.DeleteCampaignUsecase(serviceLocator()),
//     )
//     ..registerFactory(
//       () => pauseDmAutomationCampaign.PauseCampaignUsecase(serviceLocator()),
//     )
//     ..registerFactory(() => CreateDmCampaignUsecase(serviceLocator()))
//     ..registerFactory(() => ResumeCampaignUsecase(serviceLocator()));
//   //Cubit
//   serviceLocator.registerLazySingleton(
//     () => DMAutomationCampaignsCubit(
//       fetchCampaignsUsecase: serviceLocator(),
//       deleteCampaignUsecase: serviceLocator(),
//       pauseCampaignUsecase: serviceLocator(),
//       createDmCampaignUsecase: serviceLocator(),
//       resumeCampaignUsecase: serviceLocator(),
//     ),
//   );
//   serviceLocator.registerLazySingleton(() => DmCampaignFormCubit());
// }

// void _initDmAutomationMessages() {
//   //Datasource
//   serviceLocator
//     ..registerFactory<DMAutomationMessageRemoteDatasource>(
//       () => DMAutomationMessageRemoteDatasourceImpl(serviceLocator()),
//     )
//     //Repo
//     ..registerFactory<DMAutomationMessageRepository>(
//       () =>
//           DMAutomationMessageRepositoryImpl(serviceLocator(), serviceLocator()),
//     )
//     //UseCase
//     ..registerFactory(() => FetchConversationDetailsUsecase(serviceLocator()))
//     ..registerFactory(() => FetchConversationsUsecase(serviceLocator()))
//     ..registerFactory(() => SendMessageUsecase(serviceLocator()));
//   //Cubit
//   serviceLocator.registerLazySingleton(
//     () => DMAutomationMessageCubit(
//       fetchConversationDetailsUsecase: serviceLocator(),
//       fetchConversationsUsecase: serviceLocator(),
//       sendMessageUsecase: serviceLocator(),
//     ),
//   );
// }

// void _initGlobal() {
//   //Datasource
//   // serviceLocator
//   //   ..registerFactory<DMAutomationMessageRemoteDatasource>(
//   //     () => DMAutomationMessageRemoteDatasourceImpl(serviceLocator()),
//   //   )
//   //   //Repo
//   //   ..registerFactory<DMAutomationMessageRepository>(
//   //     () =>
//   //         DMAutomationMessageRepositoryImpl(serviceLocator(), serviceLocator()),
//   //   )
//   //UseCase
//   //serviceLocator.registerFactory(() => FetchXAccountUsecase(serviceLocator()));
//   // ..registerFactory(() => FetchConversationsUsecase(serviceLocator()))
//   // ..registerFactory(() => SendMessageUsecase(serviceLocator()));
//   //Cubit
//   serviceLocator.registerLazySingleton(
//     () => XAccountCubit(fetchXAccountUsecase: serviceLocator()),
//   );
//   serviceLocator.registerLazySingleton(
//     () => UserCubit(getUserDetailsUsecase: serviceLocator()),
//   );
// }

// void _initAiSmartContentMainDashboard() {
//   //Datasource
//   serviceLocator
//     ..registerFactory<AiSmartContentCampaignRemoteDatasource>(
//       () => AiSmartContentCampaignRemoteDatasourceImpl(serviceLocator()),
//     )
//     //Repo
//     ..registerFactory<AiSmartContentRepository>(
//       () => AiSmartContentRepositoryImpl(serviceLocator(), serviceLocator()),
//     )
//     ..registerFactory(
//       () => FetchAiSmartContentMainDashboardCampaignsUsecase(serviceLocator()),
//     )
//     ..registerFactory(
//       () => FetchAiSmartContentCampaignDetailsUsecase(serviceLocator()),
//     )
//     ..registerFactory(
//       () => FetchAiSmartContentMetricsUsecase(serviceLocator()),
//     );

//   //Cubit
//   serviceLocator.registerLazySingleton(
//     () => AiSmartContentMainDashbaordCubit(
//       fetchAiSmartContentCampaignsUsecase: serviceLocator(),
//       fetchAiSmartContentMetricsUsecase: serviceLocator(),
//       fetchAiSmartContentCampaignDetailsUsecase: serviceLocator(),
//     ),
//   );
// }

// void _initAiSmartContentCampaign() {
//   //Datasource
//   serviceLocator
//     ..registerFactory<AiSmartContentRemoteDatasource>(
//       () => AiSmartContentRemoteDatasourceImpl(serviceLocator()),
//     )
//     //Repo
//     ..registerFactory<AiSmartCampaignRepository>(
//       () => AiSmartCampaignRepositoryImpl(serviceLocator(), serviceLocator()),
//     )
//     //UseCase
//     ..registerFactory(() => DeleteCampaignUsecase(serviceLocator()))
//     ..registerFactory(() => PauseCampaignUsecase(serviceLocator()))
//     ..registerFactory(
//       () => aiSmartContentResumeCampaignUsecase.ResumeCampaignUsecase(
//         serviceLocator(),
//       ),
//     )
//     ..registerFactory(
//       () => FetchAiSmartContentCampaignsUsecase(serviceLocator()),
//     );

//   //Cubit
//   serviceLocator.registerLazySingleton(
//     () => AiSmartContentCampaignsCubit(
//       deleteCampaignUsecase: serviceLocator(),
//       fetchCampaignsUsecase: serviceLocator(),
//       pauseCampaignUsecase: serviceLocator(),
//       resumeCampaignUsecase: serviceLocator(),
//     ),
//   );
// }

// void _initCreateAiSmartContentCampaign() {
//   //Datasource
//   serviceLocator.registerFactory<AiSmartContentAiPosterRemoteDatasource>(
//     () => AiSmartContentAiPosterRemoteDatasourceImpl(serviceLocator()),
//   );
//   serviceLocator
//     ..registerFactory<AiSmartContentAiReplierRemoteDatasource>(
//       () => AiSmartContentAiReplierRemoteDatasourceImpl(serviceLocator()),
//     )
//     //Repo
//     ..registerFactory<AiSmartContentAiReplierRepository>(
//       () => AiSmartContentAiReplierRepositoryImpl(
//         serviceLocator(),
//         serviceLocator(),
//       ),
//     )
//     ..registerFactory<AiSmartContentAiPosterRepository>(
//       () => AiSmartContentAiPosterRepositoryImpl(
//         serviceLocator(),
//         serviceLocator(),
//       ),
//     )
//     //UseCase
//     ..registerFactory(() => CreateAiPosterCampaignUsecase(serviceLocator()))
//     ..registerFactory(() => CreateAiReplierCampaignUsecase(serviceLocator()));

//   //Cubit
//   serviceLocator.registerLazySingleton(
//     () => AiSmartContentAiPosterCubit(
//       createAiPosterCampaignUsecase: serviceLocator(),
//     ),
//   );
//   serviceLocator.registerLazySingleton(() => AiSmartContentFormDataCubit());
//   serviceLocator.registerLazySingleton(
//     () => AiSmartContentReplierFormDataCubit(),
//   );
//   serviceLocator.registerLazySingleton(
//     () => AiSmartContentAiReplierCubit(
//       createAiReplierCampaignUsecase: serviceLocator(),
//     ),
//   );
// }

// void _initAccount() {
//   //Datasource
//   serviceLocator.registerFactory<AccountRemoteDatasources>(
//     () => AccountRemoteDatasourcesImpl(serviceLocator()),
//   );

//   //Repo
//   serviceLocator
//     ..registerFactory<AccountsRepositories>(
//       () => AccountRepositoriesImpl(serviceLocator(), serviceLocator()),
//     )
//     //UseCase
//     ..registerFactory(() => AddXAccountUsecase(serviceLocator()))
//     ..registerFactory(() => DeleteXAccountUsecase(serviceLocator()))
//     ..registerFactory(() => ConnectXByTokenUsecase(serviceLocator()))
//     ..registerFactory(() => SaveXAccountUsecase(serviceLocator()));

//   //Cubit
//   serviceLocator.registerLazySingleton(
//     () => AccountsCubit(
//       addXAccountUsecase: serviceLocator(),
//       deleteXAccountUsecase: serviceLocator(),
//       saveXAccountUsecase: serviceLocator(),
//       connectXByTokenUsecase: serviceLocator(),
//     ),
//   );
// }

// void _initGrowthToolMainDashboard() {
//   //Datasource
//   serviceLocator.registerFactory<GrowthToolRemoteDatasources>(
//     () => GrowthToolRemoteDatasourcesImpl(serviceLocator()),
//   );

//   //Repo
//   serviceLocator
//     ..registerFactory<GrowthToolRepository>(
//       () => GrowthToolRepositoryImpl(serviceLocator(), serviceLocator()),
//     )
//     //UseCase
//     ..registerFactory(() => FetchGrowthToolUsecase(serviceLocator()))
//     ..registerFactory(() => FetchGrowthToolStatsUsecase(serviceLocator()));

//   //Cubit
//   serviceLocator.registerLazySingleton(
//     () => GrowthToolCubit(
//       fetchGrowthToolStatsUsecase: serviceLocator(),
//       fetchGrowthToolUsecase: serviceLocator(),
//     ),
//   );
// }

// void _initGrowthToolCampaigns() {
//   //Datasource
//   serviceLocator.registerFactory<GrowthToolCampaignRemoteDatasource>(
//     () => GrowthToolCampaignRemoteDatasourceImpl(serviceLocator()),
//   );

//   //Repo
//   serviceLocator
//     ..registerFactory<GrowthToolCampaignRepository>(
//       () =>
//           GrowthToolCampaignRepositoryImpl(serviceLocator(), serviceLocator()),
//     )
//     //UseCase
//     ..registerFactory(() => CreateGrowthToolCampaignUsecase(serviceLocator()))
//     ..registerFactory(() => DeleteGrowthToolCampaignUsecase(serviceLocator()))
//     ..registerFactory(() => ResumeGrowthToolCampaignUsecase(serviceLocator()))
//     ..registerFactory(() => PauseGrowthToolCampaignUsecase(serviceLocator()));

//   //Cubit
//   serviceLocator.registerLazySingleton(
//     () => GrowthToolCampaignCubit(
//       deleteCampaignUsecase: serviceLocator(),
//       fetchGrowthToolUsecase: serviceLocator(),
//       pauseCampaignUsecase: serviceLocator(),
//       resumeCampaignUsecase: serviceLocator(),
//       createGrowthToolCampaignUsecase: serviceLocator(),
//     ),
//   );
//   serviceLocator.registerLazySingleton(() => GrowthToolFollowFormDataCubit());
// }

// void _initProfileSettings() {
//   //Datasource
//   serviceLocator.registerFactory<ProfileSettingRemoteDatasources>(
//     () => ProfileSettingRemoteDatasourcesImpl(serviceLocator()),
//   );

//   //Repo
//   serviceLocator
//     ..registerFactory<ProfileSettingRepository>(
//       () => ProfileSettingRepositoryImpl(serviceLocator(), serviceLocator()),
//     )
//     //UseCase
//     ..registerFactory(() => UpdateProfileImageUsecase(serviceLocator()))
//     ..registerFactory(() => EditUserProfileUsecase(serviceLocator()));

//   //Cubit
//   serviceLocator.registerLazySingleton(
//     () => ProfileSettingCubit(
//       editUserProfileUsecase: serviceLocator(),
//       updateProfileImageUsecase: serviceLocator(),
//     ),
//   );
// }

// void _initUpdateSettings() {
//   //Datasource
//   serviceLocator.registerFactory<NotificationRemoteDatasource>(
//     () => NotificationRemoteDatasourceImpl(serviceLocator()),
//   );

//   //Repo
//   serviceLocator
//     ..registerFactory<NotificationRepository>(
//       () => NotificationRepositoryImpl(serviceLocator(), serviceLocator()),
//     )
//     //UseCase
//     ..registerFactory(() => UpdateNotificationUsecase(serviceLocator()));

//   //Cubit
//   serviceLocator.registerLazySingleton(
//     () => NotificationsCubit(updateNotificationUsecase: serviceLocator()),
//   );
// }

// void _initFreeCredits() {
//   //Datasource
//   serviceLocator.registerFactory<FreeCreditsRemoteDatasources>(
//     () => FreeCreditsRemoteDatasourcesImpl(serviceLocator()),
//   );

//   //Repo
//   serviceLocator
//     ..registerFactory<FreeCreditRepository>(
//       () => FreeCreditRepositoryImpl(serviceLocator(), serviceLocator()),
//     )
//     //UseCase
//     ..registerFactory(() => GetTasksUsecases(serviceLocator()))
//     ..registerFactory(() => CompleteTaskUsecase(serviceLocator()));

//   //Cubit
//   serviceLocator.registerLazySingleton(
//     () => FreeCreditsCubit(
//       getTasksUsecases: serviceLocator(),
//       completeTaskUsecase: serviceLocator(),
//     ),
//   );
// }

// void _initAffiliateProgram() {
//   //Datasource
//   serviceLocator.registerFactory<AffiliateProgramRemoteDatasource>(
//     () => AffiliateProgramRemoteDatasourceImpl(serviceLocator()),
//   );

//   //Repo
//   serviceLocator
//     ..registerFactory<AffiliateProgramRepository>(
//       () => AffiliateProgramRepositoryImpl(serviceLocator(), serviceLocator()),
//     )
//     //UseCase
//     ..registerFactory(() => FetchAffiliateProgramUsecase(serviceLocator()))
//     ..registerFactory(() => FetchWalletBalanceUsecase(serviceLocator()))
//     ..registerFactory(() => SubmitPostLinkUscase(serviceLocator()))
//     ..registerFactory(() => FetchPayoutUsecase(serviceLocator()))
//     ..registerFactory(() => RequestPayoutUsecase(serviceLocator()))
//     ..registerFactory(() => FetchCommissionHistoryUsecase(serviceLocator()));

//   //Cubit
//   serviceLocator.registerLazySingleton(
//     () => AffiliateProgramCubit(
//       fetchAffiliateProgramUsecase: serviceLocator(),
//       fetchWalletBalanceUsecase: serviceLocator(),
//       fetchCommissionHistoryUsecase: serviceLocator(),
//       submitPostLinkUscase: serviceLocator(),
//       fetchPayoutUsecase: serviceLocator(),
//       requestPayoutUsecase: serviceLocator(),
//     ),
//   );
// }

// void _initLearning() {
//   //Datasource
//   serviceLocator.registerFactory<VideoTutorialRemoteDatasources>(
//     () => VideoTutorialRemoteDatasourcesImpl(serviceLocator()),
//   );
//   serviceLocator.registerFactory<BlogsRemoteDatasource>(
//     () => BlogsRemoteDatasourceImpl(serviceLocator()),
//   );

//   //Repo
//   serviceLocator
//     ..registerFactory<VideoTutorialsRepository>(
//       () => VideoTutorialRepositoryImpl(serviceLocator(), serviceLocator()),
//     )
//     ..registerFactory<BlogRepository>(
//       () => BlogRepositoryImpl(serviceLocator(), serviceLocator()),
//     )
//     //UseCase
//     ..registerFactory(() => FetchCourseDetailsUsecase(serviceLocator()))
//     ..registerFactory(() => FetchLessonUsecase(serviceLocator()))
//     ..registerFactory(() => BlogUsecase(serviceLocator()));

//   //Cubit
//   serviceLocator.registerLazySingleton(
//     () => VideoTutorialCubit(
//       fetchCourseDetailsUsecase: serviceLocator(),
//       fetchLessonUsecase: serviceLocator(),
//     ),
//   );
//   serviceLocator.registerLazySingleton(
//     () => BlogsCubit(blogUsecase: serviceLocator()),
//   );
// }

// void _initGlobalBlocking() {
//   //Datasource
//   serviceLocator.registerFactory<GlobalBlockRemoteDatasources>(
//     () => GlobalBlockRemoteDatasourcesImpl(serviceLocator()),
//   );

//   //Repo
//   serviceLocator
//     ..registerFactory<GlobalBlockRepositories>(
//       () => GlobalBlockRepositoryImpl(serviceLocator(), serviceLocator()),
//     )
//     //UseCase
//     ..registerFactory(() => FetchGloballyBlockUserUsecase(serviceLocator()))
//     ..registerFactory(() => UnblockUsersUsecase(serviceLocator()))
//     ..registerFactory(() => BlockUsersUsecase(serviceLocator()));

//   //Cubit
//   serviceLocator.registerLazySingleton(
//     () => GlobalBlockListCubit(
//       blockUsersUsecase: serviceLocator(),
//       fetchGloballyBlockUserUsecase: serviceLocator(),
//       unblockUsersUsecase: serviceLocator(),
//     ),
//   );
// }

// void _initCredits() {
//   //Datasource
//   serviceLocator.registerFactory<MonthlyPackagesRemoteDatasources>(
//     () => MonthlyPackagesRemoteDatasourcesImpl(serviceLocator()),
//   );
//   serviceLocator.registerFactory<PerCreditPackageRemoteDatasources>(
//     () => PerCreditPackageRemoteDatasourcesImpl(serviceLocator()),
//   );
//   serviceLocator.registerFactory<AddOnsRemoteDatasources>(
//     () => AddOnsRemoteDatasourcesImpl(serviceLocator()),
//   );

//   //Repo
//   serviceLocator
//     ..registerFactory<MonthlyPackagesRepository>(
//       () => MonthlyPackagesRepositoryImpl(serviceLocator(), serviceLocator()),
//     )
//     ..registerFactory<PerCreditPackagesRepository>(
//       () => PerCreditPackageRepositoryImpl(serviceLocator(), serviceLocator()),
//     )
//     ..registerFactory<AddOnRepository>(
//       () => AddOnsRepositoryImpl(serviceLocator(), serviceLocator()),
//     )
//     //UseCase
//     ..registerFactory(() => FetchPlansUsecase(serviceLocator()))
//     ..registerFactory(() => AccessForeverPlanUsecase(serviceLocator()))
//     ..registerFactory(() => FetchCreditUsecase(serviceLocator()))
//     ..registerFactory(() => PurchaseAddOnsUsecase(serviceLocator()))
//     ..registerFactory(() => FetchAddOnsUsecase(serviceLocator()))
//     ..registerFactory(() => SubscribeUsecase(serviceLocator()))
//     ..registerFactory(() => DowngradePlanUsecase(serviceLocator()))
//     ..registerFactory(() => PurchaseCreditUsecase(serviceLocator()));

//   //Cubit
//   serviceLocator.registerLazySingleton(
//     () => MonthlyPackageCubit(
//       fetchPlansUsecase: serviceLocator(),
//       accessForeverPlanUsecase: serviceLocator(),
//       subscribeUsecase: serviceLocator(),
//       downgradePlanUsecase: serviceLocator(),
//     ),
//   );
//   //Cubit
//   serviceLocator.registerLazySingleton(
//     () => PerCreditPackageCubit(
//       fetchCreditUsecase: serviceLocator(),
//       purchaseCreditUsecase: serviceLocator(),
//     ),
//   );
//   serviceLocator.registerLazySingleton(
//     () => AddOnsCubit(
//       fetchAddOnsUsecase: serviceLocator(),
//       purchaseAddOnsUsecase: serviceLocator(),
//     ),
//   );
// }
