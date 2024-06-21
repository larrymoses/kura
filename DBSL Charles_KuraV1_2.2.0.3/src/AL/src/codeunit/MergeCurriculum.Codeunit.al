#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Codeunit 57011 "MergeCurriculum"
{

    trigger OnRun()
    begin
        //D:\CUENAV_BACKUP\CUENAV_Documents

        //MergeFiles('D:\newFile.pdf','D:\newFile.pdf','D:\newFile.pdf','D:\newFile.pdf','D:\newFile.pdf','D:\newFile.pdf','D:\newFile.pdf','D:\CUENAV_BACKUP\PDF\test001.pdf');
        //MESSAGE(fnCreateF());
        // Message(fnCreateFCon());
    end;

    var
        mergePdfsapiPath: label 'http://192.168.1.34:8095/api/values/MergePdf?tenderNo=';
        createFolderapiPath: label 'http://192.168.1.187:8095/api/values/CreateFolder?tenderNo=';
        mergeConPdfsapiPath: label 'http://192.168.1.187:8096/api/values/MergePdf?tenderNo=';
        createConFolderapiPath: label 'http://192.168.1.187:8096/api/values/CreateFolder?tenderNo=';

    // procedure MergeFiles(File1: Text;File2: Text;File3: Text;File4: Text;File5: Text;File6: Text;File7: Text;File8: Text) FileName: Text
    // var
    //     BaseUrl: Text;
    //     Method: Text;
    //     RestMethod: Text;
    //HttpContent: dotnet HttpContent;
    //     // HttpResponseMessage: dotnet HttpResponseMessage;
    //     // HttpClient: dotnet HttpClient;
    //     // Uri: dotnet Uri;
    // begin
    //     HttpClient := HttpClient.HttpClient();
    //     //add function to hold multiple files on C#
    //     HttpClient.BaseAddress := Uri.Uri('http://localhost:8040/api/values?file1='+File1+'&file2='+File2+'&file3='+File3+'&file4='+File4+'&file5='+File5+'&file6='+File6+'&file7='+File7+'&file8='+File8);
    //     HttpResponseMessage := HttpClient.GetAsync(Method).Result;

    //     exit(HttpResponseMessage.Content.ReadAsStringAsync().Result);
    //     HttpResponseMessage.EnsureSuccessStatusCode();
    // end;

    procedure fnMergePdfs(tenderNo: Text; finalDocument: Text) //status: HttpContent
    var
        isSuccess: Text;
        BaseUrl: Text;
        Method: Text;
        RestMethod: Text;
        HttpContent: HttpContent;
        HttpResponseMessage: HttpResponseMessage;
        httpResponse: Boolean;
        HttpClient: HttpClient;
        //     Uri: uri;
        CurrentBaseAddress: Text[500];
        newContent: HttpClient;
    begin

        // newContent := HttpClient();
        //add function to hold multiple files on C#
        CurrentBaseAddress := HttpClient.GetBaseAddress();
        HttpClient.SetBaseAddress(CurrentBaseAddress);
        //HttpClient.GetBaseAddress := Uri.Uri(mergePdfsapiPath+tenderNo+'&&finalFile='+ finalDocument);
        httpResponse := HttpClient.Get(CurrentBaseAddress, HttpResponseMessage);

        //  exit(HttpResponseMessage.Content());
        //HttpResponseMessage.HttpStatusCode();
        //MESSAGE('Status is %1',status);
    end;

    // procedure fnCreateFolder(tenderNo: Text) status: Text
    // var
    //     isSuccess: Text;
    //     BaseUrl: Text;
    //     Method: Text;
    //     RestMethod: Text;
    //     HttpContent: dotnet HttpContent;
    //     HttpResponseMessage: dotnet HttpResponseMessage;
    //     HttpClient: dotnet HttpClient;
    //     Uri: dotnet Uri;
    // begin

    //     HttpClient := HttpClient.HttpClient();
    //     //add function to hold multiple files on C#
    //     HttpClient.BaseAddress := Uri.Uri(createFolderapiPath+tenderNo);
    //     HttpResponseMessage := HttpClient.GetAsync(Method).Result;

    //     exit(HttpResponseMessage.Content.ReadAsStringAsync().Result);
    //     HttpResponseMessage.EnsureSuccessStatusCode();
    // end;

    // procedure fnCreateF() status: Text
    // begin
    //     status:= fnMergePdfs('IFS0061','FINALDOC.pdf');
    //     if status='true' then begin
    //       Message('Documents merged');
    //       exit(status);
    //       end else begin
    //         Message('Documents not merged');
    //         end;
    // end;

    // procedure fnMergeConPdfs(tenderNo: Text;finalDocument: Text) status: Text
    // var
    //     isSuccess: Text;
    //     BaseUrl: Text;
    //     Method: Text;
    //     RestMethod: Text;
    //     HttpContent: dotnet HttpContent;
    //     HttpResponseMessage: dotnet HttpResponseMessage;
    //     HttpClient: dotnet HttpClient;
    //     Uri: dotnet Uri;
    // begin

    //     HttpClient := HttpClient.HttpClient();
    //     //add function to hold multiple files on C#
    //     HttpClient.BaseAddress := Uri.Uri(mergeConPdfsapiPath+tenderNo+'&&finalFile='+ finalDocument);
    //     HttpResponseMessage := HttpClient.GetAsync(Method).Result;

    //     exit(HttpResponseMessage.Content.ReadAsStringAsync().Result);
    //     HttpResponseMessage.EnsureSuccessStatusCode();
    //     //MESSAGE('Status is %1',status);
    // end;

    // procedure fnCreateConFolder(tenderNo: Text) status: Text
    // var
    //     isSuccess: Text;
    //     BaseUrl: Text;
    //     Method: Text;
    //     RestMethod: Text;
    //     HttpContent: dotnet HttpContent;
    //     HttpResponseMessage: dotnet HttpResponseMessage;
    //     HttpClient: dotnet HttpClient;
    //     Uri: dotnet Uri;
    // begin

    //     HttpClient := HttpClient.HttpClient();
    //     //add function to hold multiple files on C#
    //     HttpClient.BaseAddress := Uri.Uri(createConFolderapiPath+tenderNo);
    //     HttpResponseMessage := HttpClient.GetAsync(Method).Result;

    //     exit(HttpResponseMessage.Content.ReadAsStringAsync().Result);
    //     HttpResponseMessage.EnsureSuccessStatusCode();
    // end;

    // procedure fnCreateFCon() status: Text
    // begin
    //     status:= fnMergeConPdfs('PRN0653','Fianl.pdf');
    //     if status='true' then begin
    //       Message('Created');
    //       exit(status);
    //       end else begin
    //         Message('NoT Created');
    //         end;
    // end;

    procedure fngeneratepersonnel(PurchaseHeader: Record "Purchase Header")
    var
        PurchaseHead: Record "Purchase Header";
        ContractIssuanc: Record "Contract Issuance Requirements";
        DocNo: Code[10];
        DocDesc: Text[2000];
        ProcurementDoc: Record "Procurement Document Type";
        ProcurementSetups: Record "Procurement Setup";
        DocTemplateLine: Record "Procurement Doc Template Line";
        ContractIndex: Text[250];
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExistCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        CanCancelApprovalForRecord: Boolean;
        CanRequestApprovalForFlow: Boolean;
        CanCancelApprovalForFlow: Boolean;
        ShowWorkflowStatus: Boolean;
        Procurement: Codeunit "Procurement Processing";
        DMSDocuments: Record "DMS Documents";
        DMSManagement: Codeunit "DMS Management";
        licenseno: Boolean;
        Instr: InStream;
        OutStr: OutStream;
        TORText: Text;
        Obj: BigText;
        ObjInstr: InStream;
        ObjOutStr: OutStream;
        ObjText: Text;
        MergePDF: Codeunit MergeCurriculum;
        FileDirectoryX: Text;
        FileNameX: Text;
        FileName1: Text;
        FileName2: Text;
        FileName3: Text;
        FileName4: Text;
        FileName5: Text;
        FileName6: Text;
        FileName7: Text;
        FileName8: Text;
        FileName61: Text;
        FileName71: Text;
        FileName62: Text;
        FileDirectoryX1: Text;
        FileNameX1: Text;
        FileDirectory1: Text;
        FileName31: Text;
        FileName41: Text;
        FileName51: Text;
        FileName66: Text;
        FileName76: Text;
        FileDirectory: Text;
        TestFile: File;
        Statuses: Text[250];
        FileName: Text;
    begin

        ProcurementSetups.Get;
        DocNo := 'STAFFCV';
        DocTemplateLine.Reset;
        DocTemplateLine.SetRange("Template ID", ProcurementSetups."Default Procurement Template");
        DocTemplateLine.SetRange("Procurement Document Type", DocNo);
        DocTemplateLine.SetRange("Part of Contract Document", true);
        if DocTemplateLine.FindFirst then
            DocDesc := DocTemplateLine.Description;
        ContractIndex := Format(DocTemplateLine."Contract Index");
        DocDesc := ConvertStr(DocDesc, ':', '_');
        DocDesc := ConvertStr(DocDesc, '\', '_');
        DocDesc := ConvertStr(DocDesc, '/', '_');
        FileDirectoryX := 'C:\SCM\Contract\' + PurchaseHeader."Requisition No" + '\';
        FileNameX := PurchaseHeader."Requisition No" + '_' + ContractIndex + '_' + DocNo + '_' + DocDesc + '.pdf';
        if FILE.Exists(FileDirectoryX + FileNameX) then
            FILE.Erase(FileDirectoryX + FileNameX);//51217
        FileDirectory := 'C:\SCM\Contract\' + PurchaseHeader."Requisition No" + '\';
        FileName := PurchaseHeader."Requisition No" + '_' + ContractIndex + '_' + DocNo + '_' + DocDesc + '.pdf';
        PurchaseHead.Reset;
        //PurchaseHead.SETRANGE("Document Type",PurchaseHead."Document Type"::Quote);
        PurchaseHead.SetRange("No.", PurchaseHeader."Awarded Bid No");
        if PurchaseHead.FindSet then begin
            Message('Done%1 on %2', FileDirectory, FileName);
            Report.SaveAsPdf(75011, FileDirectory + FileName, PurchaseHead);
        end;
    end;
}

