page 99250 "EmailPageExtn"
{
    ApplicationArea = all;
    Caption = 'Test Email';
    UsageCategory = Tasks;

    trigger OnOpenPage();
    begin
        sendmail();
        Message('Email Sent');
    end;

    procedure sendmail()
    var
        TxtDefaultCCMailList: List of [Text];
        TxtDefaultBCCMailList: List of [Text];
        TxtReceipientsList: List of [Text];
        AttachmentTempBlob: Codeunit "Temp Blob";
        AttachmentIntStream: instream;
        FileMgt: Codeunit "File Management";

    begin
        TxtReceipientsList.Add('Charlescheptumo@dynasoft.co.ke');
        TxtDefaultCCMailList.Add('mohancharlz@gmail.com');
        TxtDefaultBCCMailList.Add('');

        EmailMsg.Create(
            TxtReceipientsList,
            'This is a test',
            'Alaaaaaaaaaaaaa',
            false,
            TxtDefaultCCMailList,
            TxtDefaultBCCMailList
        );
        //Attachment
        FileMgt.BLOBImportFromServerFile(
            AttachmentTempBlob,
            ''
        );
        AttachmentTempBlob.CreateInStream(AttachmentIntStream);


        //attachment Function
        // emailMsg.AddAttachment(
        //     'Example.pdf',
        //     'Pdf',
        //  AttachmentIntStream
        // );

        EmailObj.Send(EmailMsg, Enum::"Email Scenario"::default);
    end;

    var
        EmailObj: Codeunit Email;

        EmailMsg: Codeunit "Email Message";

}
