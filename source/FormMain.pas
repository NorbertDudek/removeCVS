unit FormMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFrmMain = class(TForm)
    lbxDirectoryList: TListBox;
    btnRemove: TButton;
    btnClose: TButton;
    labRootDirectory: TLabel;
    btnUpdateRoot: TButton;
    Label1: TLabel;
    edtRootString: TEdit;
    procedure btnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnUpdateRootClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ScanDirectory(DirectoryName: string);
    procedure RemoveDirectory(DirectoryName: string);
    procedure UpdateRoot(DirectoryName: string);
  end;

var
  FrmMain: TFrmMain;

implementation
  
{$R *.dfm}

procedure TFrmMain.btnCloseClick(Sender: TObject);
begin
  Close;
end;


procedure TFrmMain.FormShow(Sender: TObject);
begin
  labRootDirectory.Caption := 'Root directory: ' +ParamStr( 1 );
  ScanDirectory( ParamStr( 1 ) );
  if lbxDirectoryList.Items.Count = 0 then
  begin
    ShowMessage( format( 'No found CVS directory in "%s". Application will be closed.', [ParamStr( 1 )] ) );
    Application.Terminate;
  end;
end;

procedure TFrmMain.ScanDirectory(DirectoryName: string);
var
  SearchRec: TSearchRec;
begin
  if ExtractFileName( DirectoryName ) = 'CVS' then
    lbxDirectoryList.Items.Add( DirectoryName );
  if FindFirst( DirectoryName +'\*.*', faAnyFile, SearchRec ) = 0 then
  begin
    repeat
      if (SearchRec.Attr and faDirectory <> 0) and (SearchRec.Name[1] <> '.') then
        ScanDirectory( DirectoryName +'\' +SearchRec.Name )
      else
        if SearchRec.Name = '.cvsignore' then
          lbxDirectoryList.Items.Add( DirectoryName +'\' +SearchRec.Name );

    until FindNext(SearchRec) <> 0;
    FindClose(SearchRec);
  end;
end;

procedure TFrmMain.btnRemoveClick(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to lbxDirectoryList.Items.Count -1 do
    if FileExists(lbxDirectoryList.Items[i]) then
      DeleteFile(lbxDirectoryList.Items[i])
    else
      RemoveDirectory( lbxDirectoryList.Items[i] );
  ShowMessage( 'All CVS directory is removed. Application will be closed.' );
  Application.Terminate;
end;                                            

procedure TFrmMain.RemoveDirectory(DirectoryName: string);
var
  SearchRec: TSearchRec; 
begin
  if FindFirst( DirectoryName +'\*.*', faAnyFile, SearchRec ) = 0 then
  begin
    repeat
      if (SearchRec.Attr and faDirectory = 0) then
        DeleteFile( DirectoryName +'\' +SearchRec.Name ); 
    until FindNext(SearchRec) <> 0;
    FindClose(SearchRec);
  end;
  windows.RemoveDirectory( PChar( DirectoryName ) );
end;

procedure TFrmMain.btnUpdateRootClick(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to lbxDirectoryList.Items.Count -1 do
    UpdateRoot( lbxDirectoryList.Items[i] );
  ShowMessage( 'All Root files is updated. Application will be closed.' );
  Application.Terminate;
end;

procedure TFrmMain.UpdateRoot(DirectoryName: string);
var
  Output: TextFile; 
begin
  AssignFile( Output, DirectoryName +'\Root' );
  ReWrite( Output );
  WriteLn( Output, edtRootString.Text );
  CloseFile( Output );  
end;

end.
