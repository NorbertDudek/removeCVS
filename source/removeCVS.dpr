program removeCVS;

uses
  Forms,
  dialogs,
  FormMain in 'FormMain.pas' {FrmMain};

{$R *.res}

begin
  if ParamCount = 1 then
  begin
    Application.Initialize;
    Application.CreateForm(TFrmMain, FrmMain);
    Application.Run;
  end
  else
    ShowMessage( 'Using: '#13'  removeCVS.exe scandirectory'#13'where'#13'  scandirectory is directory to scan' );
end.
