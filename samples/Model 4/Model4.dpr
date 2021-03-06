program Model4;

uses Horse, Horse.RateLimit, Store.Redis;  // Add uses Store.Redis

begin
  THorse
  .Use(THorseRateLimit.New(10,60, TRedisStore.New()).Limit) // Add TRedisStore.New().Limit
  .Get('/ping',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
      Res.Send('pong');
    end);

  THorse.Listen(9000);
end.
