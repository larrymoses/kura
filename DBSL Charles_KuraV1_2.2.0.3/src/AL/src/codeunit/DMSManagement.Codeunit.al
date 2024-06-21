#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Codeunit 50009 "DMS Management"
{

    trigger OnRun()
    begin
    end;

    var
        Docname: Text;
        FileName: Text;
        Filer: Codeunit "File Management";
        FileName2: Text[2000];
        DocLink: Record "Record Link";
        FileDesc: Text;
        FileWriter: OutStream;
        File1: File;
        Xml1: label '"<?xml version=""1.0"" encoding=""utf-8""?>"'';';
        ConfigOpen: label '<Config>';
        Configclose: label '</Config>';
        FolderOpen: label '<Folder>';
        FolderClose: label '</Folder>';
        Fileopen: label '<Filename>';
        FileClose: label '</Filename>';
        ColumnsOpen: label '<Columns>';
        ColumnsClose: label '</Columns>';
        ColumnOpen: label '<Column>';
        ColumnClose: label '</Column>';
        TitleOpen: label '<Title>';
        TitleClose: label '</Title>';
        ValueOpen: label '<Value>';
        ValueClose: label '</Value>';
        XmlFileName: Text;
        CashManagementSetup: Record "Cash Management Setup";


    procedure UploadDocument(DocumentType: Option; DocNo: Code[50]; DocDesc: Text; TabID: RecordID): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record "DMS Document Lines";
        FileName: Text[250];
        // xmlWriter: dotnet XmlTextWriter;
        //EncodingText: dotnet Encoding;
        CashManagementSetup: Record "Cash Management Setup";
    begin
        DocType.Reset;
        DocType.SetRange(DocType."Document Type", DocType."document type"::"Purchase Invoices");
        if DocType.Find('-') then begin
            //Uploade File to folder
            FileName := '';
            FileName2 := '';
            Docname := DocNo;
            Docname := ConvertStr(Docname, ':', '_');
            Docname := ConvertStr(Docname, ':', '_');
            //FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
            FileName2 := '\\192.168.1.121\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
            FileDesc := Docname + '_' + Filer.GetFileName(FileName);
            //Filer.CopyClientFile(FileName, FileName2, true);
            // Filer.MoveFile(FileName2, '\\192.168.1.121\DocumentsPath\' + FileDesc);
            // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
            //Insert Link
            DocLink.Init;
            DocLink."Link ID" := 0;
            DocLink.URL1 := DocType."Sharepoint URL" + FileDesc;
            DocLink.Description := FileDesc;
            DocLink.Type := DocLink.Type::Link;
            DocLink.Company := COMPANYNAME;
            DocLink."User ID" := UserId;
            DocLink.Created := CreateDatetime(Today, Time);
            DocLink."Record ID" := TabID;
            DocLink.Insert;

            //Create Xml Document
            DocLines.Reset;
            DocLines.SetRange("Document Type", DocType."document type"::"Purchase Invoices");
            if DocLines.Find('-') then begin
                XmlFileName := DocType."Document Path" + FileDesc + '.xml';
                FileName := DocType."Document Path" + FileDesc + '.xml';
                //FileName :=Docname+'.xml';
                // if IsNull(xmlWriter) then
                //xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                //xmlWriter.WriteStartDocument();
                //Create Parent element
                //xmlWriter.WriteStartElement('Columns');
                //xmlWriter.WriteStartElement('Params');
                //xmlWriter.WriteElementString('Library', DocType."Library Name");
                //xmlWriter.WriteElementString('Folder', Docname);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteStartElement('Files');
                //xmlWriter.WriteElementString('Filename', FileDesc);
                //xmlWriter.WriteEndElement();
                //Region Metadata
                //xmlWriter.WriteStartElement('Column');
                // REPEAT
                //Create Child elements
                //xmlWriter.WriteElementString('Title', DocLines."Column Name");
                //xmlWriter.WriteElementString('Value', DocLines."Region Code");
                // //xmlWriter.WriteEndElement();
                // UNTIL DocLines.NEXT = 0;
                //End writing top element and XML document
                //xmlWriter.WriteEndElement();
                //Constituency Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Constituency');
                //xmlWriter.WriteElementString('Value', DocLines."Constituency Code");
                //xmlWriter.WriteEndElement();
                //Employee Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Employee');
                //xmlWriter.WriteElementString('Value', UserId);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteEndDocument();
                //xmlWriter.Close();
            end;
            // //Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
            // Filer.MoveFile(FileName, 'X:\' + FileDesc + '.xml');
        end;
        Message('Documents Uploaded Successffully');


    end;

    procedure UploadImprestDocuments(DocumentType: Option; DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Text): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record "DMS Document Lines";
        FileName: Text[250];
    // xmlWriter: dotnet XmlTextWriter;
    //EncodingText: dotnet Encoding;
    begin
        CashManagementSetup.Get;
        if CashManagementSetup.Find('-') then begin
            //Uploade File to folder
            Docname := DocNo;
            Docname := ConvertStr(Docname, ':', '_');
            Docname := ConvertStr(Docname, ':', '_');
            //FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
            FileName2 := '\\192.168.1.121\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
            FileDesc := Docname + '_' + Filer.GetFileName(FileName);
            //Filer.CopyClientFile(FileName, FileName2, true);
            // Filer.MoveFile(FileName2, '\\192.168.1.121\DocumentsPath\' + FileDesc);
            // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
            //Insert Link
            DocLink.Init;
            DocLink."Link ID" := 0;
            DocLink.URL1 := CashManagementSetup."SharePoint Site Link" + '/' + CashManagementSetup."SharePoint Site Main Library" + '/' + CashManagementSetup."SharePoint Document Library" + '/' + Region + '/' + CashManagementSetup."Imprest Memo DMS Link" + '/'
            + Docname + '/' + FileDesc;
            DocLink.Description := FileDesc;
            DocLink.Type := DocLink.Type::Link;
            DocLink.Company := COMPANYNAME;
            DocLink."User ID" := UserId;
            DocLink.Created := CreateDatetime(Today, Time);
            DocLink."Record ID" := TabID;
            DocLink.Insert;

            //Create Xml Document
            CashManagementSetup.Get;
            if CashManagementSetup.Find('-') then begin
                XmlFileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
                FileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
                //FileName :=Docname+'.xml';
                // if IsNull(xmlWriter) then
                //xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                //xmlWriter.WriteStartDocument();
                //Create Parent element
                //xmlWriter.WriteStartElement('Columns');
                //xmlWriter.WriteStartElement('Params');
                //xmlWriter.WriteElementString('Library', CashManagementSetup."SharePoint Site Main Library");
                //xmlWriter.WriteElementString('Folder', CashManagementSetup."SharePoint Document Library" + '/' + Region + '/' + CashManagementSetup."Imprest Memo DMS Link" + '/' + Docname);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteStartElement('Files');
                //xmlWriter.WriteElementString('Filename', FileDesc);
                //xmlWriter.WriteEndElement();
                //Region Metadata
                //xmlWriter.WriteStartElement('Column');
                // REPEAT
                //Create Child elements
                //xmlWriter.WriteElementString('Title', 'Region');
                //xmlWriter.WriteElementString('Value', '');
                // //xmlWriter.WriteEndElement();
                // UNTIL DocLines.NEXT = 0;
                //End writing top element and XML document
                //xmlWriter.WriteEndElement();
                //Constituency Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Constituency');
                //xmlWriter.WriteElementString('Value', '');
                //xmlWriter.WriteEndElement();
                //Employee Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Employee');
                //xmlWriter.WriteElementString('Value', UserId);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteEndDocument();
                //xmlWriter.Close();
            end;
            // //Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
            // Filer.MoveFile(FileName, '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml');
        end;
        Message('Documents Uploaded Successffully');

    end;

    procedure UploadStaffClaimDocuments(DocumentType: Option; DocNo: Code[50]; DocDesc: Text; TabID: RecordID; region: Code[100]): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record "DMS Document Lines";
        FileName: Text[250];
    // xmlWriter: dotnet XmlTextWriter;
    //EncodingText: dotnet Encoding;
    begin
        CashManagementSetup.Get;
        if CashManagementSetup.Find('-') then begin
            //Uploade File to folder
            Docname := DocNo;
            Docname := ConvertStr(Docname, ':', '_');
            Docname := ConvertStr(Docname, ':', '_');
            //FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
            FileName2 := 'C:\DOCS\' + Docname + '_' + Filer.GetFileName(FileName);
            FileDesc := Docname + '_' + Filer.GetFileName(FileName);
            ////Filer.CopyClientFile(FileName,FileName2,TRUE);
            //Filer.MoveFile(FileName2,'C:\DOCS\'+FileDesc);
            // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
            //Insert Link
            DocLink.Init;
            DocLink."Link ID" := 0;
            DocLink.URL1 := CashManagementSetup."SharePoint Site Link" + '/' + CashManagementSetup."SharePoint Site Main Library" + '/' + CashManagementSetup."SharePoint Document Library" + '/' + region + '/' + CashManagementSetup."Staff Claims DMS Link" + '/'
            + Docname + '/' + FileDesc;
            //MESSAGE('URL1 is %1',DocLink.URL1);
            DocLink.Description := FileDesc;
            DocLink.Type := DocLink.Type::Link;
            DocLink.Company := COMPANYNAME;
            //DocLink."Base URL" := '/' + CashManagementSetup."SharePoint Site Main Library" + '/' + CashManagementSetup."SharePoint Document Library" + '/' + region + '/' + CashManagementSetup."Staff Claims DMS Link";
            //DocLink."Document No" := DocNo;
            //MESSAGE('This is BaseURL %1',DocLink."Base URL");
            //DocLink.LocalUrl := FileName2;
            DocLink."User ID" := UserId;
            //DocLink."Fetch To Sharepoint" := true;
            //DocLink."Uploaded To SharePoint" := false;
            //DocLink."SP URL Returned" := '';
            // DocLink.Polled := false;
            DocLink.Created := CreateDatetime(Today, Time);
            DocLink."Record ID" := TabID;
            DocLink.Insert(true);
        end;
        Message('Documents Uploaded Successffully');
    end;

    procedure UploadBillDiscountingDocuments(DocumentType: Option; DocNo: Code[50]; DocDesc: Text; TabID: RecordID; region: Code[100]): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record "DMS Document Lines";
        FileName: Text[250];
    // xmlWriter: dotnet XmlTextWriter;
    //EncodingText: dotnet Encoding;
    begin
        CashManagementSetup.Get;
        if CashManagementSetup.Find('-') then begin
            //Uploade File to folder
            Docname := DocNo;
            Docname := ConvertStr(Docname, ':', '_');
            Docname := ConvertStr(Docname, ':', '_');
            //FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
            FileName2 := 'C:\DOCS\' + Docname + '_' + Filer.GetFileName(FileName);
            FileDesc := Docname + '_' + Filer.GetFileName(FileName);
            //Filer.CopyClientFile(FileName, FileName2, true);
            // Filer.MoveFile(FileName2, 'C:\DOCS\' + FileDesc);
            // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
            //Insert Link
            DocLink.Init;
            DocLink."Link ID" := 0;
            DocLink.URL1 := CashManagementSetup."SharePoint Site Link" + '/' + CashManagementSetup."SharePoint Site Main Library" + '/' + CashManagementSetup."SharePoint Document Library" + '/' + region + '/' + CashManagementSetup."Imprest Surrender DMS Link" + '/'
            + Docname + '/' + FileDesc;
            DocLink.Description := FileDesc;
            DocLink.Type := DocLink.Type::Link;
            DocLink.Company := COMPANYNAME;
            //DocLink."Base URL" := '/' + CashManagementSetup."SharePoint Site Main Library" + '/' + CashManagementSetup."SharePoint Document Library" + '/' + region + '/' + CashManagementSetup."Imprest Surrender DMS Link";
            //DocLink."Document No" := DocNo;
            //MESSAGE(DocLink."Base URL");
            //DocLink.LocalUrl := FileName2;
            DocLink."User ID" := UserId;
            //DocLink."Fetch To Sharepoint" := true;
            //DocLink."Uploaded To SharePoint" := false;
            //DocLink."SP URL Returned" := '';
            //DocLink.Polled := false;
            DocLink.Created := CreateDatetime(Today, Time);
            DocLink."Record ID" := TabID;
            DocLink.Insert(true);

            //Create Xml Document
            /*CashManagementSetup.RESET;
            CashManagementSetup.GET;
              IF DocLines.FIND('-') THEN BEGIN
                XmlFileName:='C:\DOCS\'+FileDesc+'.xml';
                FileName :='C:\DOCS\'+FileDesc+'.xml';
                //FileName :=Docname+'.xml';
                // if IsNull(xmlWriter) THEN
                //xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                //xmlWriter.WriteStartDocument();
                //Create Parent element
                //xmlWriter.WriteStartElement('Columns');
                //xmlWriter.WriteStartElement('Params');
                //xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
                //xmlWriter.WriteElementString('Region',region);
                //xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+region+'/'+CashManagementSetup."Staff Claims DMS Link"+'/'+Docname);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteStartElement('Files');
                //xmlWriter.WriteElementString('Filename',FileDesc);
                //xmlWriter.WriteEndElement();
                 //Region Metadata
                //xmlWriter.WriteStartElement('Column');
                // REPEAT
                //Create Child elements
                //xmlWriter.WriteElementString('Title','Region');
                //xmlWriter.WriteElementString('Value',region);
                //End writing top element and XML document
                //xmlWriter.WriteEndElement();
               //Constituency Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title','Constituency');
                //xmlWriter.WriteElementString('Value','');
                //xmlWriter.WriteEndElement();
                //Employee Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title','Employee');
                //xmlWriter.WriteElementString('Value',USERID);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteEndDocument();
                //xmlWriter.Close();
                END;*/
            // //Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
            //Filer.MoveFile(FileName,'C:\DOCS\'+FileDesc+'.xml');
        end;


        Message('Documents Uploaded Successffully');


    end;

    procedure UploadImprestSurrenderDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; region: Code[100]): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record "DMS Document Lines";
        FileName: Text[250];
    // xmlWriter: dotnet XmlTextWriter;
    //EncodingText: dotnet Encoding;
    begin
        CashManagementSetup.Get;
        if CashManagementSetup.Find('-') then begin
            //Uploade File to folder
            Docname := DocNo;
            Docname := ConvertStr(Docname, ':', '_');
            Docname := ConvertStr(Docname, ':', '_');
            //FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
            FileName2 := '\\192.168.1.121\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
            FileDesc := Docname + '_' + Filer.GetFileName(FileName);
            //Filer.CopyClientFile(FileName, FileName2, true);
            // Filer.MoveFile(FileName2, '\\192.168.1.121\DocumentsPath\' + FileDesc);
            // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
            //Insert Link
            DocLink.Init;
            DocLink."Link ID" := 0;
            DocLink.URL1 := CashManagementSetup."SharePoint Site Link" + '/' + CashManagementSetup."SharePoint Site Main Library" + '/' + CashManagementSetup."SharePoint Document Library" + '/' + region + '/' + CashManagementSetup."Imprest Surrender DMS Link" + '/'
             + Docname + '/' + FileDesc;
            DocLink.Description := FileDesc;
            DocLink.Type := DocLink.Type::Link;
            DocLink.Company := COMPANYNAME;
            DocLink."User ID" := UserId;
            DocLink.Created := CreateDatetime(Today, Time);
            DocLink."Record ID" := TabID;
            DocLink.Insert;

            //Create Xml Document
            CashManagementSetup.Reset;
            CashManagementSetup.Get;
            if DocLines.Find('-') then begin
                XmlFileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
                FileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
                //FileName :=Docname+'.xml';
                // if IsNull(xmlWriter) then
                //xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                //xmlWriter.WriteStartDocument();
                //Create Parent element
                //xmlWriter.WriteStartElement('Columns');
                //xmlWriter.WriteStartElement('Params');
                //xmlWriter.WriteElementString('Library', CashManagementSetup."SharePoint Site Main Library");
                //xmlWriter.WriteElementString('Region', region);
                //xmlWriter.WriteElementString('Folder', CashManagementSetup."SharePoint Document Library" + '/' + region + '/' + CashManagementSetup."Imprest Surrender DMS Link" + '/' + Docname);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteStartElement('Files');
                //xmlWriter.WriteElementString('Filename', FileDesc);
                //xmlWriter.WriteEndElement();
                //Region Metadata
                //xmlWriter.WriteStartElement('Column');
                // REPEAT
                //Create Child elements
                //xmlWriter.WriteElementString('Title', 'Region');
                //xmlWriter.WriteElementString('Value', region);
                //End writing top element and XML document
                //xmlWriter.WriteEndElement();
                //Constituency Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Constituency');
                //xmlWriter.WriteElementString('Value', '');
                //xmlWriter.WriteEndElement();
                //Employee Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Employee');
                //xmlWriter.WriteElementString('Value', UserId);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteEndDocument();
                //xmlWriter.Close();
            end;
            // //Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
            // Filer.MoveFile(FileName, '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml');
        end;

        Message('Documents Uploaded Successffully');

    end;

    procedure UploadPettyCashDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Code[100]): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record "DMS Document Lines";
        FileName: Text[250];
    // xmlWriter: dotnet XmlTextWriter;
    //EncodingText: dotnet Encoding;
    begin
        CashManagementSetup.Get;
        if CashManagementSetup.Find('-') then begin
            //Uploade File to folder
            Docname := DocNo;
            Docname := ConvertStr(Docname, ':', '_');
            Docname := ConvertStr(Docname, ':', '_');
            //FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
            FileName2 := '\\192.168.1.121\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
            FileDesc := Docname + '_' + Filer.GetFileName(FileName);
            //Filer.CopyClientFile(FileName, FileName2, true);
            // Filer.MoveFile(FileName2, '\\192.168.1.121\DocumentsPath\' + FileDesc);
            // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
            //Insert Link
            DocLink.Init;
            DocLink."Link ID" := 0;
            DocLink.URL1 := CashManagementSetup."SharePoint Site Link" + '/' + CashManagementSetup."SharePoint Site Main Library" + '/' + CashManagementSetup."SharePoint Document Library" + '/' + Region + '/' + CashManagementSetup."Petty Cash Voucher DMS Link" + '/'
            + Docname + '/' + FileDesc;
            DocLink.Description := FileDesc;
            DocLink.Type := DocLink.Type::Link;
            DocLink.Company := COMPANYNAME;
            DocLink."User ID" := UserId;
            DocLink.Created := CreateDatetime(Today, Time);
            DocLink."Record ID" := TabID;
            DocLink.Insert;

            //Create Xml Document
            CashManagementSetup.Get;
            if DocLines.Find('-') then begin
                XmlFileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
                FileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
                //FileName :=Docname+'.xml';
                // if IsNull(xmlWriter) then
                //xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                //xmlWriter.WriteStartDocument();
                //Create Parent element
                //xmlWriter.WriteStartElement('Columns');
                //xmlWriter.WriteStartElement('Params');
                //xmlWriter.WriteElementString('Library', CashManagementSetup."SharePoint Site Main Library");
                //xmlWriter.WriteElementString('Region', Region);
                //xmlWriter.WriteElementString('Folder', CashManagementSetup."SharePoint Document Library" + '/' + Region + '/' + CashManagementSetup."Petty Cash Voucher DMS Link" + '/' + Docname);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteStartElement('Files');
                //xmlWriter.WriteElementString('Filename', FileDesc);
                //xmlWriter.WriteEndElement();
                //Region Metadata
                //xmlWriter.WriteStartElement('Column');
                // REPEAT
                //Create Child elements
                //xmlWriter.WriteElementString('Title', 'Region');
                //xmlWriter.WriteElementString('Value', Region);
                //End writing top element and XML document
                //xmlWriter.WriteEndElement();
                //Constituency Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Constituency');
                //xmlWriter.WriteElementString('Value', '');
                //xmlWriter.WriteEndElement();
                //Employee Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Employee');
                //xmlWriter.WriteElementString('Value', UserId);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteEndDocument();
                //xmlWriter.Close();
            end;
            // //Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
            // Filer.MoveFile(FileName, '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml');
        end;
        Message('Documents Uploaded Successffully');

    end;

    procedure UploadPurchaseRequisitionDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Code[100]): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record "DMS Document Lines";
        FileName: Text[250];
    // xmlWriter: dotnet XmlTextWriter;
    //EncodingText: dotnet Encoding;
    begin
        CashManagementSetup.Get;
        if CashManagementSetup.Find('-') then begin
            //Uploade File to folder
            Docname := DocNo;
            Docname := ConvertStr(Docname, ':', '_');
            Docname := ConvertStr(Docname, ':', '_');
            //FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
            FileName2 := '\\192.168.1.121\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
            FileDesc := Docname + '_' + Filer.GetFileName(FileName);
            //Filer.CopyClientFile(FileName, FileName2, true);
            // Filer.MoveFile(FileName2, '\\192.168.1.121\DocumentsPath\' + FileDesc);
            // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
            //Insert Link
            DocLink.Init;
            DocLink."Link ID" := 0;
            DocLink.URL1 := DocType."Sharepoint URL" + FileDesc;
            DocLink.Description := FileDesc;
            DocLink.Type := DocLink.Type::Link;
            DocLink.Company := COMPANYNAME;
            DocLink."User ID" := UserId;
            DocLink.Created := CreateDatetime(Today, Time);
            DocLink."Record ID" := TabID;
            DocLink.Insert;

            //Create Xml Document
            CashManagementSetup.Get;
            if DocLines.Find('-') then begin
                XmlFileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
                FileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
                //FileName :=Docname+'.xml';
                // if IsNull(xmlWriter) then
                //xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                //xmlWriter.WriteStartDocument();
                //Create Parent element
                //xmlWriter.WriteStartElement('Columns');
                //xmlWriter.WriteStartElement('Params');
                //xmlWriter.WriteElementString('Library', CashManagementSetup."SharePoint Site Main Library");
                //xmlWriter.WriteElementString('Region', Region);
                //xmlWriter.WriteElementString('Folder', CashManagementSetup."SharePoint Document Library" + '/' + Region + '/' + CashManagementSetup."Staff Claims DMS Link" + '/' + Docname);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteStartElement('Files');
                //xmlWriter.WriteElementString('Filename', FileDesc);
                //xmlWriter.WriteEndElement();
                //Region Metadata
                //xmlWriter.WriteStartElement('Column');
                // REPEAT
                //Create Child elements
                //xmlWriter.WriteElementString('Title', 'Region');
                //xmlWriter.WriteElementString('Value', Region);
                //End writing top element and XML document
                //xmlWriter.WriteEndElement();
                //Constituency Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Constituency');
                //xmlWriter.WriteElementString('Value', '');
                //xmlWriter.WriteEndElement();
                //Employee Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Employee');
                //xmlWriter.WriteElementString('Value', UserId);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteEndDocument();
                //xmlWriter.Close();
            end;
            // //Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
            // Filer.MoveFile(FileName, '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml');
        end;
        Message('Documents Uploaded Successffully');

    end;

    procedure UploadStoreRequisitionDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Code[100]): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record "DMS Document Lines";
        FileName: Text[250];
    // xmlWriter: dotnet XmlTextWriter;
    //EncodingText: dotnet Encoding;
    begin
        CashManagementSetup.Get;
        if CashManagementSetup.Find('-') then begin
            //Uploade File to folder
            Docname := DocNo;
            Docname := ConvertStr(Docname, ':', '_');
            Docname := ConvertStr(Docname, ':', '_');
            //FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
            FileName2 := '\\192.168.1.121\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
            FileDesc := Docname + '_' + Filer.GetFileName(FileName);
            //Filer.CopyClientFile(FileName, FileName2, true);
            // Filer.MoveFile(FileName2, '\\192.168.1.121\DocumentsPath\' + FileDesc);
            // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
            //Insert Link
            DocLink.Init;
            DocLink."Link ID" := 0;
            DocLink.URL1 := DocType."Sharepoint URL" + FileDesc;
            DocLink.Description := FileDesc;
            DocLink.Type := DocLink.Type::Link;
            DocLink.Company := COMPANYNAME;
            DocLink."User ID" := UserId;
            DocLink.Created := CreateDatetime(Today, Time);
            DocLink."Record ID" := TabID;
            DocLink.Insert;
            //Create Xml Document
            CashManagementSetup.Get;
            if DocLines.Find('-') then begin
                XmlFileName := 'C:\Data\' + FileDesc + '.xml';
                FileName := 'C:\Data\' + FileDesc + '.xml';
                //FileName :=Docname+'.xml';
                // if IsNull(xmlWriter) then
                //xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                //xmlWriter.WriteStartDocument();
                //Create Parent element
                //xmlWriter.WriteStartElement('Columns');
                //xmlWriter.WriteStartElement('Params');
                //xmlWriter.WriteElementString('Library', CashManagementSetup."SharePoint Site Main Library");
                //xmlWriter.WriteElementString('Region', Region);
                //xmlWriter.WriteElementString('Folder', CashManagementSetup."SharePoint Document Library" + '/' + Region + '/' + CashManagementSetup."Staff Claims DMS Link" + '/' + Docname);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteStartElement('Files');
                //xmlWriter.WriteElementString('Filename', FileDesc);
                //xmlWriter.WriteEndElement();
                //Region Metadata
                //xmlWriter.WriteStartElement('Column');
                // REPEAT
                //Create Child elements
                //xmlWriter.WriteElementString('Title', 'Region');
                //xmlWriter.WriteElementString('Value', Region);
                //End writing top element and XML document
                //xmlWriter.WriteEndElement();
                //Constituency Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Constituency');
                //xmlWriter.WriteElementString('Value', '');
                //xmlWriter.WriteEndElement();
                //Employee Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Employee');
                //xmlWriter.WriteElementString('Value', UserId);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteEndDocument();
                //xmlWriter.Close();
            end;
            // //Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
            // Filer.MoveFile(FileName, 'X:\' + FileDesc + '.xml');
        end;
        Message('Documents Uploaded Successffully');

    end;

    procedure UploadPettyCashSurrenderDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Code[100]): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record "DMS Document Lines";
        FileName: Text[250];
    // xmlWriter: dotnet XmlTextWriter;
    //EncodingText: dotnet Encoding;
    begin
        CashManagementSetup.Get;
        if CashManagementSetup.Find('-') then begin
            //Uploade File to folder
            Docname := DocNo;
            Docname := ConvertStr(Docname, ':', '_');
            Docname := ConvertStr(Docname, ':', '_');
            //FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
            FileName2 := 'C:\Data\' + Docname + '_' + Filer.GetFileName(FileName);
            FileDesc := Docname + '_' + Filer.GetFileName(FileName);
            //Filer.CopyClientFile(FileName, FileName2, true);
            // Filer.MoveFile(FileName2, 'X:\' + FileDesc);
            // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
            //Insert Link
            DocLink.Init;
            DocLink."Link ID" := 0;
            DocLink.URL1 := DocType."Sharepoint URL" + FileDesc;
            DocLink.Description := FileDesc;
            DocLink.Type := DocLink.Type::Link;
            DocLink.Company := COMPANYNAME;
            DocLink."User ID" := UserId;
            DocLink.Created := CreateDatetime(Today, Time);
            DocLink."Record ID" := TabID;
            DocLink.Insert;

            //Create Xml Document
            CashManagementSetup.Get;
            if DocLines.Find('-') then begin
                XmlFileName := 'C:\Data\' + FileDesc + '.xml';
                FileName := 'C:\Data\' + FileDesc + '.xml';
                //FileName :=Docname+'.xml';
                // if IsNull(xmlWriter) then
                //xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                //xmlWriter.WriteStartDocument();
                //Create Parent element
                //xmlWriter.WriteStartElement('Columns');
                //xmlWriter.WriteStartElement('Params');
                //xmlWriter.WriteElementString('Library', CashManagementSetup."SharePoint Site Main Library");
                //xmlWriter.WriteElementString('Region', Region);
                //xmlWriter.WriteElementString('Folder', CashManagementSetup."SharePoint Document Library" + '/' + Region + '/' + CashManagementSetup."Petty Cash Voucher DMS Link" + '/' + Docname);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteStartElement('Files');
                //xmlWriter.WriteElementString('Filename', FileDesc);
                //xmlWriter.WriteEndElement();
                //Region Metadata
                //xmlWriter.WriteStartElement('Column');
                // REPEAT
                //Create Child elements
                //xmlWriter.WriteElementString('Title', 'Region');
                //xmlWriter.WriteElementString('Value', Region);
                //End writing top element and XML document
                //xmlWriter.WriteEndElement();
                //Constituency Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Constituency');
                //xmlWriter.WriteElementString('Value', '');
                //xmlWriter.WriteEndElement();
                //Employee Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Employee');
                //xmlWriter.WriteElementString('Value', UserId);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteEndDocument();
                //xmlWriter.Close();
            end;
            // //Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
            // Filer.MoveFile(FileName, 'X:\' + FileDesc + '.xml');
        end;
        Message('Documents Uploaded Successffully');

    end;

    procedure UploadLeaveApplicationsDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Code[100]): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record "DMS Document Lines";
        FileName: Text[250];
    // xmlWriter: dotnet XmlTextWriter;
    //EncodingText: dotnet Encoding;
    begin
        CashManagementSetup.Get;
        if CashManagementSetup.Find('-') then begin
            //Uploade File to folder
            Docname := DocNo;
            Docname := ConvertStr(Docname, ':', '_');
            Docname := ConvertStr(Docname, ':', '_');
            //FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
            FileName2 := 'C:\Data\' + Docname + '_' + Filer.GetFileName(FileName);
            FileDesc := Docname + '_' + Filer.GetFileName(FileName);
            //Filer.CopyClientFile(FileName, FileName2, true);
            // Filer.MoveFile(FileName2, 'X:\' + FileDesc);
            // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
            //Insert Link
            DocLink.Init;
            DocLink."Link ID" := 0;
            DocLink.URL1 := DocType."Sharepoint URL" + FileDesc;
            DocLink.Description := FileDesc;
            DocLink.Type := DocLink.Type::Link;
            DocLink.Company := COMPANYNAME;
            DocLink."User ID" := UserId;
            DocLink.Created := CreateDatetime(Today, Time);
            DocLink."Record ID" := TabID;
            DocLink.Insert;

            //Create Xml Document
            CashManagementSetup.Reset;
            CashManagementSetup.Get;
            if DocLines.Find('-') then begin
                XmlFileName := 'C:\Data\' + FileDesc + '.xml';
                FileName := 'C:\Data\' + FileDesc + '.xml';
                //FileName :=Docname+'.xml';
                // if IsNull(xmlWriter) then
                //xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                //xmlWriter.WriteStartDocument();
                //Create Parent element
                //xmlWriter.WriteStartElement('Columns');
                //xmlWriter.WriteStartElement('Params');
                //xmlWriter.WriteElementString('Library', CashManagementSetup."SharePoint Site Main Library");
                //xmlWriter.WriteElementString('Region', Region);
                //xmlWriter.WriteElementString('Folder', CashManagementSetup."SharePoint Document Library" + '/' + Region + '/' + CashManagementSetup."Petty Cash Voucher DMS Link" + '/' + Docname);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteStartElement('Files');
                //xmlWriter.WriteElementString('Filename', FileDesc);
                //xmlWriter.WriteEndElement();
                //Region Metadata
                //xmlWriter.WriteStartElement('Column');
                // REPEAT
                //Create Child elements
                //xmlWriter.WriteElementString('Title', 'Region');
                //xmlWriter.WriteElementString('Value', Region);
                //End writing top element and XML document
                //xmlWriter.WriteEndElement();
                //Constituency Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Constituency');
                //xmlWriter.WriteElementString('Value', '');
                //xmlWriter.WriteEndElement();
                //Employee Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Employee');
                //xmlWriter.WriteElementString('Value', UserId);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteEndDocument();
                //xmlWriter.Close();
            end;
            // //Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
            // Filer.MoveFile(FileName, 'X:\' + FileDesc + '.xml');
        end;
        Message('Documents Uploaded Successffully');

    end;

    procedure UploadFleetRequisitionDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Code[100]): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record "DMS Document Lines";
        FileName: Text[250];
    // xmlWriter: dotnet XmlTextWriter;
    //EncodingText: dotnet Encoding;
    begin
        CashManagementSetup.Get;
        if CashManagementSetup.Find('-') then begin
            //Uploade File to folder
            Docname := DocNo;
            Docname := ConvertStr(Docname, ':', '_');
            Docname := ConvertStr(Docname, ':', '_');
            //FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
            FileName2 := 'C:\Data\' + Docname + '_' + Filer.GetFileName(FileName);
            FileDesc := Docname + '_' + Filer.GetFileName(FileName);
            //Filer.CopyClientFile(FileName, FileName2, true);
            // Filer.MoveFile(FileName2, 'X:\' + FileDesc);
            // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
            //Insert Link
            DocLink.Init;
            DocLink."Link ID" := 0;
            DocLink.URL1 := DocType."Sharepoint URL" + FileDesc;
            DocLink.Description := FileDesc;
            DocLink.Type := DocLink.Type::Link;
            DocLink.Company := COMPANYNAME;
            DocLink."User ID" := UserId;
            DocLink.Created := CreateDatetime(Today, Time);
            DocLink."Record ID" := TabID;
            DocLink.Insert;

            //Create Xml Document
            CashManagementSetup.Get;
            if DocLines.Find('-') then begin
                XmlFileName := 'C:\Data\' + FileDesc + '.xml';
                FileName := 'C:\Data\' + FileDesc + '.xml';
                //FileName :=Docname+'.xml';
                // if IsNull(xmlWriter) then
                //xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                //xmlWriter.WriteStartDocument();
                //Create Parent element
                //xmlWriter.WriteStartElement('Columns');
                //xmlWriter.WriteStartElement('Params');
                //xmlWriter.WriteElementString('Library', CashManagementSetup."SharePoint Site Main Library");
                //xmlWriter.WriteElementString('Region', Region);
                //xmlWriter.WriteElementString('Folder', CashManagementSetup."SharePoint Document Library" + '/' + Region + '/' + CashManagementSetup."Petty Cash Voucher DMS Link" + '/' + Docname);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteStartElement('Files');
                //xmlWriter.WriteElementString('Filename', FileDesc);
                //xmlWriter.WriteEndElement();
                //Region Metadata
                //xmlWriter.WriteStartElement('Column');
                // REPEAT
                //Create Child elements
                //xmlWriter.WriteElementString('Title', 'Region');
                //xmlWriter.WriteElementString('Value', Region);
                //End writing top element and XML document
                //xmlWriter.WriteEndElement();
                //Constituency Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Constituency');
                //xmlWriter.WriteElementString('Value', '');
                //xmlWriter.WriteEndElement();
                //Employee Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Employee');
                //xmlWriter.WriteElementString('Value', UserId);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteEndDocument();
                //xmlWriter.Close();
            end;
            // //Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
            // Filer.MoveFile(FileName, 'X:\' + FileDesc + '.xml');
        end;
        Message('Documents Uploaded Successffully');

    end;

    procedure UploadTrainingRequisitionDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Code[100]): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record "DMS Document Lines";
        FileName: Text[250];
    // xmlWriter: dotnet XmlTextWriter;
    //EncodingText: dotnet Encoding;
    begin
        CashManagementSetup.Get;
        if CashManagementSetup.Find('-') then begin
            //Uploade File to folder
            Docname := DocNo;
            Docname := ConvertStr(Docname, ':', '_');
            Docname := ConvertStr(Docname, ':', '_');
            //FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
            FileName2 := 'C:\Data\' + Docname + '_' + Filer.GetFileName(FileName);
            FileDesc := Docname + '_' + Filer.GetFileName(FileName);
            //Filer.CopyClientFile(FileName, FileName2, true);
            // Filer.MoveFile(FileName2, 'X:\' + FileDesc);
            // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
            //Insert Link
            DocLink.Init;
            DocLink."Link ID" := 0;
            DocLink.URL1 := DocType."Sharepoint URL" + FileDesc;
            DocLink.Description := FileDesc;
            DocLink.Type := DocLink.Type::Link;
            DocLink.Company := COMPANYNAME;
            DocLink."User ID" := UserId;
            DocLink.Created := CreateDatetime(Today, Time);
            DocLink."Record ID" := TabID;
            DocLink.Insert;

            //Create Xml Document
            CashManagementSetup.Get;
            if DocLines.Find('-') then begin
                XmlFileName := 'C:\Data\' + FileDesc + '.xml';
                FileName := 'C:\Data\' + FileDesc + '.xml';
                //FileName :=Docname+'.xml';
                // if IsNull(xmlWriter) then
                //xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                //xmlWriter.WriteStartDocument();
                //Create Parent element
                //xmlWriter.WriteStartElement('Columns');
                //xmlWriter.WriteStartElement('Params');
                //xmlWriter.WriteElementString('Library', CashManagementSetup."SharePoint Site Main Library");
                //xmlWriter.WriteElementString('Region', Region);
                //xmlWriter.WriteElementString('Folder', CashManagementSetup."SharePoint Document Library" + '/' + Region + '/' + CashManagementSetup."Petty Cash Voucher DMS Link" + '/' + Docname);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteStartElement('Files');
                //xmlWriter.WriteElementString('Filename', FileDesc);
                //xmlWriter.WriteEndElement();
                //Region Metadata
                //xmlWriter.WriteStartElement('Column');
                // REPEAT
                //Create Child elements
                //xmlWriter.WriteElementString('Title', 'Region');
                //xmlWriter.WriteElementString('Value', Region);
                //End writing top element and XML document
                //xmlWriter.WriteEndElement();
                //Constituency Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Constituency');
                //xmlWriter.WriteElementString('Value', '');
                //xmlWriter.WriteEndElement();
                //Employee Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Employee');
                //xmlWriter.WriteElementString('Value', UserId);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteEndDocument();
                //xmlWriter.Close();
            end;
            // //Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
            // Filer.MoveFile(FileName, 'X:\' + FileDesc + '.xml');
        end;
        Message('Documents Uploaded Successffully');

    end;

    procedure UploadICTHelpDeskDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Code[100]): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record "DMS Document Lines";
        FileName: Text[250];
    // xmlWriter: dotnet XmlTextWriter;
    //EncodingText: dotnet Encoding;
    begin
        CashManagementSetup.Get;
        if CashManagementSetup.Find('-') then begin
            //Uploade File to folder
            Docname := DocNo;
            Docname := ConvertStr(Docname, ':', '_');
            Docname := ConvertStr(Docname, ':', '_');
            //Docname:=CONVERTSTR(Docname,' ','_');
            //FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
            FileName2 := '\\192.168.1.121\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
            FileDesc := Docname + '_' + Filer.GetFileName(FileName);
            //Filer.CopyClientFile(FileName, FileName2, true);
            // Filer.MoveFile(FileName2, '\\192.168.1.121\DocumentsPath\' + FileDesc);
            // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
            //Insert Link
            DocLink.Init;
            DocLink."Link ID" := 0;
            DocLink.URL1 := CashManagementSetup."SharePoint Site Link" + '/' + CashManagementSetup."SharePoint Site Main Library" + '/' + CashManagementSetup."SharePoint Document Library" + '/' + Region + '/' + CashManagementSetup."Payment Voucher DMS Link" + '/'
            + Docname + '/' + FileDesc;
            DocLink.Description := FileDesc;
            DocLink.Type := DocLink.Type::Link;
            DocLink.Company := COMPANYNAME;
            DocLink."User ID" := UserId;
            DocLink.Created := CreateDatetime(Today, Time);
            DocLink."Record ID" := TabID;
            DocLink.Insert;

            //Create Xml Document
            CashManagementSetup.Get;
            if CashManagementSetup.Find('-') then begin
                XmlFileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
                FileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
                //FileName :=Docname+'.xml';
                // if IsNull(xmlWriter) then
                //xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                //xmlWriter.WriteStartDocument();
                //Create Parent element
                //xmlWriter.WriteStartElement('Columns');
                //xmlWriter.WriteStartElement('Params');
                //xmlWriter.WriteElementString('Library', CashManagementSetup."SharePoint Site Main Library");
                //xmlWriter.WriteElementString('Folder', CashManagementSetup."SharePoint Document Library" + '/' + Region + '/' + CashManagementSetup."Payment Voucher DMS Link" + '/' + Docname);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteStartElement('Files');
                //xmlWriter.WriteElementString('Filename', FileDesc);
                //xmlWriter.WriteEndElement();
                //Region Metadata
                //xmlWriter.WriteStartElement('Column');
                // REPEAT
                //Create Child elements
                //xmlWriter.WriteElementString('Title', 'Region');
                //xmlWriter.WriteElementString('Value', '');
                // //xmlWriter.WriteEndElement();
                // UNTIL DocLines.NEXT = 0;
                //End writing top element and XML document
                //xmlWriter.WriteEndElement();
                //Constituency Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Constituency');
                //xmlWriter.WriteElementString('Value', '');
                //xmlWriter.WriteEndElement();
                //Employee Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Employee');
                //xmlWriter.WriteElementString('Value', UserId);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteEndDocument();
                //xmlWriter.Close();
            end;
            // //Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
            // Filer.MoveFile(FileName, '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml');
        end;
        Message('Documents Uploaded Successffully');

    end;

    procedure UploadPaymentsDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Text): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record "DMS Document Lines";
        FileName: Text[250];
    // xmlWriter: dotnet XmlTextWriter;
    //EncodingText: dotnet Encoding;
    begin
        CashManagementSetup.Get;
        if CashManagementSetup.Find('-') then begin
            //Uploade File to folder
            Docname := DocNo;
            Docname := ConvertStr(Docname, ':', '_');
            Docname := ConvertStr(Docname, ':', '_');
            //FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
            FileName2 := '\\192.168.1.121\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
            FileDesc := Docname + '_' + Filer.GetFileName(FileName);
            //Filer.CopyClientFile(FileName, FileName2, true);
            // Filer.MoveFile(FileName2, '\\192.168.1.121\DocumentsPath\' + FileDesc);
            // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
            //Insert Link
            DocLink.Init;
            DocLink."Link ID" := 0;
            DocLink.URL1 := CashManagementSetup."SharePoint Site Link" + '/' + CashManagementSetup."SharePoint Site Main Library" + '/' + CashManagementSetup."SharePoint Document Library" + '/' + Region + '/' + CashManagementSetup."Payment Voucher DMS Link" + '/'
            + Docname + '/' + FileDesc;
            DocLink.Description := FileDesc;
            DocLink.Type := DocLink.Type::Link;
            DocLink.Company := COMPANYNAME;
            DocLink."User ID" := UserId;
            DocLink.Created := CreateDatetime(Today, Time);
            DocLink."Record ID" := TabID;
            DocLink.Insert;

            //Create Xml Document
            CashManagementSetup.Get;
            if CashManagementSetup.Find('-') then begin
                XmlFileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
                FileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
                //FileName :=Docname+'.xml';
                // if IsNull(xmlWriter) then
                //xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                //xmlWriter.WriteStartDocument();
                //Create Parent element
                //xmlWriter.WriteStartElement('Columns');
                //xmlWriter.WriteStartElement('Params');
                //xmlWriter.WriteElementString('Library', CashManagementSetup."SharePoint Site Main Library");
                //xmlWriter.WriteElementString('Folder', CashManagementSetup."SharePoint Document Library" + '/' + Region + '/' + CashManagementSetup."Payment Voucher DMS Link" + '/' + Docname);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteStartElement('Files');
                //xmlWriter.WriteElementString('Filename', FileDesc);
                //xmlWriter.WriteEndElement();
                //Region Metadata
                //xmlWriter.WriteStartElement('Column');
                // REPEAT
                //Create Child elements
                //xmlWriter.WriteElementString('Title', 'Region');
                //xmlWriter.WriteElementString('Value', '');
                // //xmlWriter.WriteEndElement();
                // UNTIL DocLines.NEXT = 0;
                //End writing top element and XML document
                //xmlWriter.WriteEndElement();
                //Constituency Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Constituency');
                //xmlWriter.WriteElementString('Value', '');
                //xmlWriter.WriteEndElement();
                //Employee Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Employee');
                //xmlWriter.WriteElementString('Value', UserId);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteEndDocument();
                //xmlWriter.Close();
            end;
            // //Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
            // Filer.MoveFile(FileName, '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml');
        end;
        Message('Documents Uploaded Successffully');

    end;

    procedure UploadAIEAttchmentDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Text): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record "DMS Document Lines";
        FileName: Text[250];
    // xmlWriter: dotnet XmlTextWriter;
    //EncodingText: dotnet Encoding;
    begin
        CashManagementSetup.Get;
        if CashManagementSetup.Find('-') then begin
            //Uploade File to folder
            Docname := DocNo;
            Docname := ConvertStr(Docname, ':', '_');
            Docname := ConvertStr(Docname, ':', '_');
            //FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
            FileName2 := '\\192.168.1.121\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
            FileDesc := Docname + '_' + Filer.GetFileName(FileName);
            //Filer.CopyClientFile(FileName, FileName2, true);
            // Filer.MoveFile(FileName2, '\\192.168.1.121\DocumentsPath\' + FileDesc);
            // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
            //Insert Link
            DocLink.Init;
            DocLink."Link ID" := 0;
            DocLink.URL1 := CashManagementSetup."SharePoint Site Link" + '/' + CashManagementSetup."SharePoint Site Main Library" + '/' + CashManagementSetup."SharePoint Document Library" + '/' + Region + '/' + CashManagementSetup."AIE EDMS Link" + '/'
            + Docname + '/' + FileDesc;
            DocLink.Description := FileDesc;
            DocLink.Type := DocLink.Type::Link;
            DocLink.Company := COMPANYNAME;
            DocLink."User ID" := UserId;
            DocLink.Created := CreateDatetime(Today, Time);
            DocLink."Record ID" := TabID;
            DocLink.Insert;

            //Create Xml Document
            CashManagementSetup.Get;
            if CashManagementSetup.Find('-') then begin
                XmlFileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
                FileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
                //FileName :=Docname+'.xml';
                // if IsNull(xmlWriter) then
                //xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                //xmlWriter.WriteStartDocument();
                //Create Parent element
                //xmlWriter.WriteStartElement('Columns');
                //xmlWriter.WriteStartElement('Params');
                //xmlWriter.WriteElementString('Library', CashManagementSetup."SharePoint Site Main Library");
                //xmlWriter.WriteElementString('Folder', CashManagementSetup."SharePoint Document Library" + '/' + Region + '/' + CashManagementSetup."AIE EDMS Link" + '/' + Docname);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteStartElement('Files');
                //xmlWriter.WriteElementString('Filename', FileDesc);
                //xmlWriter.WriteEndElement();
                //Region Metadata
                //xmlWriter.WriteStartElement('Column');
                // REPEAT
                //Create Child elements
                //xmlWriter.WriteElementString('Title', 'Region');
                //xmlWriter.WriteElementString('Value', '');
                // //xmlWriter.WriteEndElement();
                // UNTIL DocLines.NEXT = 0;
                //End writing top element and XML document
                //xmlWriter.WriteEndElement();
                //Constituency Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Constituency');
                //xmlWriter.WriteElementString('Value', '');
                //xmlWriter.WriteEndElement();
                //Employee Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Employee');
                //xmlWriter.WriteElementString('Value', UserId);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteEndDocument();
                //xmlWriter.Close();
            end;
            // //Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
            // Filer.MoveFile(FileName, '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml');
        end;
        Message('Documents Uploaded Successffully');

        //LPO/LSO
    end;

    procedure UploadPurchaseorderDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Text)
    var
        Procurementsetups: Record "Procurement Setup";
        DocType: Record "DMS Documents";
        DocLines: Record "DMS Document Lines";
        FileName: Text[250];
        xmlWriter: XmlAttribute;
    //EncodingText: dotnet Encoding;
    begin

        Procurementsetups.Get;
        if Procurementsetups.Find('-') then begin
            //Uploade File to folder
            Docname := DocNo;
            Docname := ConvertStr(Docname, ':', '_');
            Docname := ConvertStr(Docname, ':', '_');
            //FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
            FileName2 := '\\192.168.1.121\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
            FileDesc := Docname + '_' + Filer.GetFileName(FileName);
            //Filer.CopyClientFile(FileName, FileName2, true);
            // Filer.MoveFile(FileName2, '\\192.168.1.121\DocumentsPath\' + FileDesc);
            // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
            //Insert Link
            DocLink.Init;
            DocLink."Link ID" := 0;
            DocLink.URL1 := Procurementsetups."SharePoint Site Link" + '/' + Procurementsetups."SharePoint Site Main Library" + '/' + Procurementsetups."SharePoint Document Library" + '/' + Region + '/' + Procurementsetups."LPO/LSO DMS Link" + '/'
            + Docname + '/' + FileDesc;
            DocLink.Description := FileDesc;
            DocLink.Type := DocLink.Type::Link;
            DocLink.Company := COMPANYNAME;
            DocLink."User ID" := UserId;
            DocLink.Created := CreateDatetime(Today, Time);
            DocLink."Record ID" := TabID;
            DocLink.Insert;

            //Create Xml Document
            Procurementsetups.Get;
            if Procurementsetups.Find('-') then begin
                XmlFileName := '\\192.168.1.34\DocumentsPath\' + FileDesc + '.xml';
                FileName := '\\192.168.1.34\DocumentsPath\' + FileDesc + '.xml';
                //FileName :=Docname+'.xml';
                // if IsNull(xmlWriter) then
                //xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                //xmlWriter.WriteStartDocument();
                //Create Parent element
                // xmlWriter.WriteStartElement('Columns');
                //xmlWriter.WriteStartElement('Params');
                //xmlWriter.WriteElementString('Library', Procurementsetups."SharePoint Site Main Library");
                //xmlWriter.WriteElementString('Folder', Procurementsetups."SharePoint Document Library" + '/' + Region + '/' + Procurementsetups."LPO/LSO DMS Link" + '/' + Docname);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteStartElement('Files');
                //xmlWriter.WriteElementString('Filename', FileDesc);
                //xmlWriter.WriteEndElement();
                //Region Metadata
                //xmlWriter.WriteStartElement('Column');
                // REPEAT
                //Create Child elements
                //xmlWriter.WriteElementString('Title', 'Region');
                //xmlWriter.WriteElementString('Value', '');
                // //xmlWriter.WriteEndElement();
                // UNTIL DocLines.NEXT = 0;
                //End writing top element and XML document
                //xmlWriter.WriteEndElement();
                //Constituency Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Constituency');
                //xmlWriter.WriteElementString('Value', '');
                //xmlWriter.WriteEndElement();
                //Employee Metadata
                //// xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Employee');
                //xmlWriter.WriteElementString('Value', UserId);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteEndDocument();
                //xmlWriter.Close();
            end;
            // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
            // Filer.MoveFile(FileName, '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml');
        end;
        Message('Documents Uploaded Successffully');

    end;

    procedure UploadStandardPRNDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Text)
    var
        Procurementsetups: Record "Procurement Setup";
        DocType: Record "DMS Documents";
        DocLines: Record "DMS Document Lines";
        FileName: Text[250];
    // xmlWriter: dotnet XmlTextWriter;
    //EncodingText: dotnet Encoding;
    begin

        Procurementsetups.Get;
        if Procurementsetups.Find('-') then begin
            //Uploade File to folder
            Docname := DocNo;
            Docname := ConvertStr(Docname, ':', '_');
            Docname := ConvertStr(Docname, ':', '_');
            //FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
            FileName2 := '\\192.168.1.121\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
            FileDesc := Docname + '_' + Filer.GetFileName(FileName);
            //Filer.CopyClientFile(FileName, FileName2, true);
            // Filer.MoveFile(FileName2, '\\192.168.1.121\DocumentsPath\' + FileDesc);
            // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
            //Insert Link
            DocLink.Init;
            DocLink."Link ID" := 0;
            DocLink.URL1 := Procurementsetups."SharePoint Site Link" + '/' + Procurementsetups."SharePoint Site Main Library" + '/' + Procurementsetups."SharePoint Document Library" + '/' + Region + '/' + Procurementsetups."PRN(Goods & Services) DMS Link" + '/'
            + Docname + '/' + FileDesc;
            DocLink.Description := FileDesc;
            DocLink.Type := DocLink.Type::Link;
            DocLink.Company := COMPANYNAME;
            DocLink."User ID" := UserId;
            DocLink.Created := CreateDatetime(Today, Time);
            DocLink."Record ID" := TabID;
            DocLink.Insert;

            //Create Xml Document
            Procurementsetups.Get;
            if Procurementsetups.Find('-') then begin
                XmlFileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
                FileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
                //FileName :=Docname+'.xml';
                // if IsNull(xmlWriter) then
                //xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                //xmlWriter.WriteStartDocument();
                //Create Parent element
                //xmlWriter.WriteStartElement('Columns');
                //xmlWriter.WriteStartElement('Params');
                //xmlWriter.WriteElementString('Library', Procurementsetups."SharePoint Site Main Library");
                //xmlWriter.WriteElementString('Folder', Procurementsetups."SharePoint Document Library" + '/' + Region + '/' + Procurementsetups."PRN(Goods & Services) DMS Link" + '/' + Docname);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteStartElement('Files');
                //xmlWriter.WriteElementString('Filename', FileDesc);
                //xmlWriter.WriteEndElement();
                //Region Metadata
                //xmlWriter.WriteStartElement('Column');
                // REPEAT
                //Create Child elements
                //xmlWriter.WriteElementString('Title', 'Region');
                //xmlWriter.WriteElementString('Value', '');
                // //xmlWriter.WriteEndElement();
                // UNTIL DocLines.NEXT = 0;
                //End writing top element and XML document
                //xmlWriter.WriteEndElement();
                //Constituency Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Constituency');
                //xmlWriter.WriteElementString('Value', '');
                //xmlWriter.WriteEndElement();
                //Employee Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Employee');
                //xmlWriter.WriteElementString('Value', UserId);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteEndDocument();
                //xmlWriter.Close();
            end;
            // //Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
            // Filer.MoveFile(FileName, '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml');
        end;
        Message('Documents Uploaded Successffully');

    end;

    procedure UploadImprestrequisitionsDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Text)
    var
        Procurementsetups: Record "Procurement Setup";
        DocType: Record "DMS Documents";
        DocLines: Record "DMS Document Lines";
        FileName: Text[250];
    // xmlWriter: dotnet XmlTextWriter;
    //EncodingText: dotnet Encoding;
    begin
        CashManagementSetup.Get;
        if CashManagementSetup.Find('-') then begin
            //Uploade File to folder
            Docname := DocNo;
            Docname := ConvertStr(Docname, ':', '_');
            Docname := ConvertStr(Docname, ':', '_');
            //FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
            FileName2 := '\\192.168.1.121\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
            FileDesc := Docname + '_' + Filer.GetFileName(FileName);
            //Filer.CopyClientFile(FileName, FileName2, true);
            // Filer.MoveFile(FileName2, '\\192.168.1.121\DocumentsPath\' + FileDesc);
            // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
            //Insert Link
            DocLink.Init;
            DocLink."Link ID" := 0;
            DocLink.URL1 := CashManagementSetup."SharePoint Site Link" + '/' + CashManagementSetup."SharePoint Site Main Library" + '/' + CashManagementSetup."SharePoint Document Library" + '/' + Region + '/' + CashManagementSetup."Imprest Requisition DMS Link" + '/'
            + Docname + '/' + FileDesc;
            DocLink.Description := FileDesc;
            DocLink.Type := DocLink.Type::Link;
            DocLink.Company := COMPANYNAME;
            DocLink."User ID" := UserId;
            DocLink.Created := CreateDatetime(Today, Time);
            DocLink."Record ID" := TabID;
            DocLink.Insert;

            //Create Xml Document
            CashManagementSetup.Get;
            if CashManagementSetup.Find('-') then begin
                XmlFileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
                FileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
                //FileName :=Docname+'.xml';
                // if IsNull(xmlWriter) then
                //xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                //xmlWriter.WriteStartDocument();
                //Create Parent element
                //xmlWriter.WriteStartElement('Columns');
                //xmlWriter.WriteStartElement('Params');
                //xmlWriter.WriteElementString('Library', CashManagementSetup."SharePoint Site Main Library");
                //xmlWriter.WriteElementString('Folder', CashManagementSetup."SharePoint Document Library" + '/' + Region + '/' + CashManagementSetup."Imprest Requisition DMS Link" + '/' + Docname);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteStartElement('Files');
                //xmlWriter.WriteElementString('Filename', FileDesc);
                //xmlWriter.WriteEndElement();
                //Region Metadata
                //xmlWriter.WriteStartElement('Column');
                // REPEAT
                //Create Child elements
                //xmlWriter.WriteElementString('Title', 'Region');
                //xmlWriter.WriteElementString('Value', '');
                // //xmlWriter.WriteEndElement();
                // UNTIL DocLines.NEXT = 0;
                //End writing top element and XML document
                //xmlWriter.WriteEndElement();
                //Constituency Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Constituency');
                //xmlWriter.WriteElementString('Value', '');
                //xmlWriter.WriteEndElement();
                //Employee Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Employee');
                //xmlWriter.WriteElementString('Value', UserId);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteEndDocument();
                //xmlWriter.Close();
            end;
            // //Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
            // Filer.MoveFile(FileName, '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml');
        end;
        Message('Documents Uploaded Successffully');

    end;

    procedure UploadRFQNDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Text)
    var
        Procurementsetups: Record "Procurement Setup";
        DocType: Record "DMS Documents";
        DocLines: Record "DMS Document Lines";
        FileName: Text[250];
    // xmlWriter: dotnet XmlTextWriter;
    //EncodingText: dotnet Encoding;
    begin

        Procurementsetups.Get;
        if Procurementsetups.Find('-') then begin
            //Uploade File to folder
            Docname := DocNo;
            Docname := ConvertStr(Docname, ':', '_');
            Docname := ConvertStr(Docname, ':', '_');
            //FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
            FileName2 := '\\192.168.1.121\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
            FileDesc := Docname + '_' + Filer.GetFileName(FileName);
            //Filer.CopyClientFile(FileName, FileName2, true);
            // Filer.MoveFile(FileName2, '\\192.168.1.121\DocumentsPath\' + FileDesc);
            // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
            //Insert Link
            DocLink.Init;
            DocLink."Link ID" := 0;
            DocLink.URL1 := Procurementsetups."SharePoint Site Link" + '/' + Procurementsetups."SharePoint Site Main Library" + '/' + Procurementsetups."SharePoint Document Library" + '/' + Region + '/' + Procurementsetups."RFQ DMS Link" + '/'
            + Docname + '/' + FileDesc;
            DocLink.Description := FileDesc;
            DocLink.Type := DocLink.Type::Link;
            DocLink.Company := COMPANYNAME;
            DocLink."User ID" := UserId;
            DocLink.Created := CreateDatetime(Today, Time);
            DocLink."Record ID" := TabID;
            DocLink.Insert;

            //Create Xml Document
            Procurementsetups.Get;
            if Procurementsetups.Find('-') then begin
                XmlFileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
                FileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
                //FileName :=Docname+'.xml';
                // if IsNull(xmlWriter) then
                //xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                //xmlWriter.WriteStartDocument();
                //Create Parent element
                //xmlWriter.WriteStartElement('Columns');
                //xmlWriter.WriteStartElement('Params');
                //xmlWriter.WriteElementString('Library', Procurementsetups."SharePoint Site Main Library");
                //xmlWriter.WriteElementString('Folder', Procurementsetups."SharePoint Document Library" + '/' + Region + '/' + Procurementsetups."RFQ DMS Link" + '/' + Docname);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteStartElement('Files');
                //xmlWriter.WriteElementString('Filename', FileDesc);
                //xmlWriter.WriteEndElement();
                //Region Metadata
                //xmlWriter.WriteStartElement('Column');
                // REPEAT
                //Create Child elements
                //xmlWriter.WriteElementString('Title', 'Region');
                //xmlWriter.WriteElementString('Value', '');
                // //xmlWriter.WriteEndElement();
                // UNTIL DocLines.NEXT = 0;
                //End writing top element and XML document
                //xmlWriter.WriteEndElement();
                //Constituency Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Constituency');
                //xmlWriter.WriteElementString('Value', '');
                //xmlWriter.WriteEndElement();
                //Employee Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Employee');
                //xmlWriter.WriteElementString('Value', UserId);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteEndDocument();
                //xmlWriter.Close();
            end;
            // //Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
            // Filer.MoveFile(FileName, '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml');
        end;
        Message('Documents Uploaded Successffully');

    end;

    procedure UploadIFSDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Text)
    var
        Procurementsetups: Record "Procurement Setup";
        DocType: Record "DMS Documents";
        DocLines: Record "DMS Document Lines";
        FileName: Text[250];
    // xmlWriter: dotnet XmlTextWriter;
    //EncodingText: dotnet Encoding;
    begin

        Procurementsetups.Get;
        if Procurementsetups.Find('-') then begin
            //Uploade File to folder
            Docname := DocNo;
            Docname := ConvertStr(Docname, ':', '_');
            Docname := ConvertStr(Docname, ':', '_');
            //FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
            FileName2 := '\\192.168.1.121\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
            FileDesc := Docname + '_' + Filer.GetFileName(FileName);
            //Filer.CopyClientFile(FileName, FileName2, true);
            // Filer.MoveFile(FileName2, '\\192.168.1.121\DocumentsPath\' + FileDesc);
            // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
            //Insert Link
            DocLink.Init;
            DocLink."Link ID" := 0;
            DocLink.URL1 := Procurementsetups."SharePoint Site Link" + '/' + Procurementsetups."SharePoint Site Main Library" + '/' + Procurementsetups."SharePoint Document Library" + '/' + Region + '/' + Procurementsetups."IFS DMS Link" + '/'
            + Docname + '/' + FileDesc;
            DocLink.Description := FileDesc;
            DocLink.Type := DocLink.Type::Link;
            DocLink.Company := COMPANYNAME;
            DocLink."User ID" := UserId;
            DocLink.Created := CreateDatetime(Today, Time);
            DocLink."Record ID" := TabID;
            DocLink.Insert;

            //Create Xml Document
            Procurementsetups.Get;
            if Procurementsetups.Find('-') then begin
                XmlFileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
                FileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
                //FileName :=Docname+'.xml';
                // if IsNull(xmlWriter) then
                //xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                //xmlWriter.WriteStartDocument();
                //Create Parent element
                //xmlWriter.WriteStartElement('Columns');
                //xmlWriter.WriteStartElement('Params');
                //xmlWriter.WriteElementString('Library', Procurementsetups."SharePoint Site Main Library");
                //xmlWriter.WriteElementString('Folder', Procurementsetups."SharePoint Document Library" + '/' + Region + '/' + Procurementsetups."IFS DMS Link" + '/' + Docname);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteStartElement('Files');
                //xmlWriter.WriteElementString('Filename', FileDesc);
                //xmlWriter.WriteEndElement();
                //Region Metadata
                //xmlWriter.WriteStartElement('Column');
                // REPEAT
                //Create Child elements
                //xmlWriter.WriteElementString('Title', 'Region');
                //xmlWriter.WriteElementString('Value', '');
                // //xmlWriter.WriteEndElement();
                // UNTIL DocLines.NEXT = 0;
                //End writing top element and XML document
                //xmlWriter.WriteEndElement();
                //Constituency Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Constituency');
                //xmlWriter.WriteElementString('Value', '');
                //xmlWriter.WriteEndElement();
                //Employee Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Employee');
                //xmlWriter.WriteElementString('Value', UserId);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteEndDocument();
                //xmlWriter.Close();
            end;
            // //Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
            // Filer.MoveFile(FileName, '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml');
        end;
        Message('Documents Uploaded Successffully');

    end;

    procedure UploadIFSCommitteeDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Text)
    var
        Procurementsetups: Record "Procurement Setup";
        DocType: Record "DMS Documents";
        DocLines: Record "DMS Document Lines";
        FileName: Text[250];
    // xmlWriter: dotnet XmlTextWriter;
    //EncodingText: dotnet Encoding;
    begin

        Procurementsetups.Get;
        if Procurementsetups.Find('-') then begin
            //Uploade File to folder
            Docname := DocNo;
            Docname := ConvertStr(Docname, ':', '_');
            Docname := ConvertStr(Docname, ':', '_');
            //FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
            FileName2 := '\\192.168.1.121\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
            FileDesc := Docname + '_' + Filer.GetFileName(FileName);
            //Filer.CopyClientFile(FileName, FileName2, true);
            // Filer.MoveFile(FileName2, '\\192.168.1.121\DocumentsPath\' + FileDesc);
            // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
            //Insert Link
            DocLink.Init;
            DocLink."Link ID" := 0;
            DocLink.URL1 := Procurementsetups."SharePoint Site Link" + '/' + Procurementsetups."SharePoint Site Main Library" + '/' + Procurementsetups."SharePoint Document Library" + '/' + Region + '/' + Procurementsetups."IFS Tender Comm. DMS Link" + '/'
            + Docname + '/' + FileDesc;
            DocLink.Description := FileDesc;
            DocLink.Type := DocLink.Type::Link;
            DocLink.Company := COMPANYNAME;
            DocLink."User ID" := UserId;
            DocLink.Created := CreateDatetime(Today, Time);
            DocLink."Record ID" := TabID;
            DocLink.Insert;

            //Create Xml Document
            Procurementsetups.Get;
            if Procurementsetups.Find('-') then begin
                XmlFileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
                FileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
                //FileName :=Docname+'.xml';
                // if IsNull(xmlWriter) then
                //xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                //xmlWriter.WriteStartDocument();
                //Create Parent element
                //xmlWriter.WriteStartElement('Columns');
                //xmlWriter.WriteStartElement('Params');
                //xmlWriter.WriteElementString('Library', Procurementsetups."SharePoint Site Main Library");
                //xmlWriter.WriteElementString('Folder', Procurementsetups."SharePoint Document Library" + '/' + Region + '/' + Procurementsetups."IFS Tender Comm. DMS Link" + '/' + Docname);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteStartElement('Files');
                //xmlWriter.WriteElementString('Filename', FileDesc);
                //xmlWriter.WriteEndElement();
                //Region Metadata
                //xmlWriter.WriteStartElement('Column');
                // REPEAT
                //Create Child elements
                //xmlWriter.WriteElementString('Title', 'Region');
                //xmlWriter.WriteElementString('Value', '');
                // //xmlWriter.WriteEndElement();
                // UNTIL DocLines.NEXT = 0;
                //End writing top element and XML document
                //xmlWriter.WriteEndElement();
                //Constituency Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Constituency');
                //xmlWriter.WriteElementString('Value', '');
                //xmlWriter.WriteEndElement();
                //Employee Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Employee');
                //xmlWriter.WriteElementString('Value', UserId);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteEndDocument();
                //xmlWriter.Close();
            end;
            // //Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
            // Filer.MoveFile(FileName, '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml');
        end;
        Message('Documents Uploaded Successffully');

    end;

    procedure UploadIBTDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Text)
    var
        Procurementsetups: Record "Procurement Setup";
        DocType: Record "DMS Documents";
        DocLines: Record "DMS Document Lines";
        FileName: Text[250];
    // xmlWriter: dotnet XmlTextWriter;
    //EncodingText: dotnet Encoding;
    begin

        Procurementsetups.Get;
        if Procurementsetups.Find('-') then begin
            //Upload File to folder
            Docname := DocNo;
            Docname := ConvertStr(Docname, ':', '_');
            Docname := ConvertStr(Docname, ':', '_');
            //FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
            FileName2 := '\\192.168.1.121\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
            FileDesc := Docname + '_' + Filer.GetFileName(FileName);
            //Filer.CopyClientFile(FileName, FileName2, true);
            // Filer.MoveFile(FileName2, '\\192.168.1.121\DocumentsPath\' + FileDesc);
            // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
            //Insert Link
            DocLink.Init;
            DocLink."Link ID" := 0;
            DocLink.URL1 := Procurementsetups."SharePoint Site Link" + '/' + Procurementsetups."SharePoint Site Main Library" + '/' + Procurementsetups."SharePoint Document Library" + '/' + Region + '/' + Procurementsetups."RFQ DMS Link" + '/'
            + Docname + '/' + FileDesc;
            DocLink.Description := FileDesc;
            DocLink.Type := DocLink.Type::Link;
            DocLink.Company := COMPANYNAME;
            DocLink."User ID" := UserId;
            DocLink.Created := CreateDatetime(Today, Time);
            DocLink."Record ID" := TabID;
            DocLink.Insert;

            //Create Xml Document
            Procurementsetups.Get;
            if Procurementsetups.Find('-') then begin
                XmlFileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
                FileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
                //FileName :=Docname+'.xml';
                // if IsNull(xmlWriter) then
                //xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                //xmlWriter.WriteStartDocument();
                //Create Parent element
                //xmlWriter.WriteStartElement('Columns');
                //xmlWriter.WriteStartElement('Params');
                //xmlWriter.WriteElementString('Library', Procurementsetups."SharePoint Site Main Library");
                //xmlWriter.WriteElementString('Folder', Procurementsetups."SharePoint Document Library" + '/' + Region + '/' + Procurementsetups."RFQ DMS Link" + '/' + Docname);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteStartElement('Files');
                //xmlWriter.WriteElementString('Filename', FileDesc);
                //xmlWriter.WriteEndElement();
                //Region Metadata
                //xmlWriter.WriteStartElement('Column');
                // REPEAT
                //Create Child elements
                //xmlWriter.WriteElementString('Title', 'Region');
                //xmlWriter.WriteElementString('Value', '');
                // //xmlWriter.WriteEndElement();
                // UNTIL DocLines.NEXT = 0;
                //End writing top element and XML document
                //xmlWriter.WriteEndElement();
                //Constituency Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Constituency');
                //xmlWriter.WriteElementString('Value', '');
                //xmlWriter.WriteEndElement();
                //Employee Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Employee');
                //xmlWriter.WriteElementString('Value', UserId);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteEndDocument();
                //xmlWriter.Close();
            end;
            // //Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
            // Filer.MoveFile(FileName, '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml');
        end;
        Message('Documents Uploaded Successffully');

    end;

    procedure UploadInterBankTransferDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Code[100]): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record "DMS Document Lines";
        FileName: Text[250];
    // xmlWriter: dotnet XmlTextWriter;
    //EncodingText: dotnet Encoding;
    begin
        CashManagementSetup.Get;
        if CashManagementSetup.Find('-') then begin
            //Uploade File to folder
            Docname := DocNo;
            Docname := ConvertStr(Docname, ':', '_');
            Docname := ConvertStr(Docname, ':', '_');
            //FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
            FileName2 := '\\192.168.1.121\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
            FileDesc := Docname + '_' + Filer.GetFileName(FileName);
            //Filer.CopyClientFile(FileName, FileName2, true);
            // Filer.MoveFile(FileName2, '\\192.168.1.121\DocumentsPath\' + FileDesc);
            // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
            //Insert Link
            DocLink.Init;
            DocLink."Link ID" := 0;
            DocLink.URL1 := CashManagementSetup."SharePoint Site Link" + '/' + CashManagementSetup."SharePoint Site Main Library" + '/' + CashManagementSetup."SharePoint Document Library" + '/' + Region + '/' + CashManagementSetup."Inter Bank Transfer DMS Link" + '/'
            + Docname + '/' + FileDesc;
            DocLink.Description := FileDesc;
            DocLink.Type := DocLink.Type::Link;
            DocLink.Company := COMPANYNAME;
            DocLink."User ID" := UserId;
            DocLink.Created := CreateDatetime(Today, Time);
            DocLink."Record ID" := TabID;
            DocLink.Insert;

            //Create Xml Document
            CashManagementSetup.Get;
            if DocLines.Find('-') then begin
                XmlFileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
                FileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
                //FileName :=Docname+'.xml';
                // if IsNull(xmlWriter) then
                //xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                //xmlWriter.WriteStartDocument();
                //Create Parent element
                //xmlWriter.WriteStartElement('Columns');
                //xmlWriter.WriteStartElement('Params');
                //xmlWriter.WriteElementString('Library', CashManagementSetup."SharePoint Site Main Library");
                //xmlWriter.WriteElementString('Region', Region);
                //xmlWriter.WriteElementString('Folder', CashManagementSetup."SharePoint Document Library" + '/' + Region + '/' + CashManagementSetup."Petty Cash Voucher DMS Link" + '/' + Docname);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteStartElement('Files');
                //xmlWriter.WriteElementString('Filename', FileDesc);
                //xmlWriter.WriteEndElement();
                //Region Metadata
                //xmlWriter.WriteStartElement('Column');
                // REPEAT
                //Create Child elements
                //xmlWriter.WriteElementString('Title', 'Region');
                //xmlWriter.WriteElementString('Value', Region);
                //End writing top element and XML document
                //xmlWriter.WriteEndElement();
                //Constituency Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Constituency');
                //xmlWriter.WriteElementString('Value', '');
                //xmlWriter.WriteEndElement();
                //Employee Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Employee');
                //xmlWriter.WriteElementString('Value', UserId);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteEndDocument();
                //xmlWriter.Close();
            end;
            // //Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
            // Filer.MoveFile(FileName, '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml');
        end;
        Message('Documents Uploaded Successffully');

    end;

    procedure UploadEvalreportDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Text)
    var
        Procurementsetups: Record "Procurement Setup";
        DocType: Record "DMS Documents";
        DocLines: Record "DMS Document Lines";
        FileName: Text[250];
    // xmlWriter: dotnet XmlTextWriter;
    //EncodingText: dotnet Encoding;
    begin

        Procurementsetups.Get;
        if Procurementsetups.Find('-') then begin
            //Uploade File to folder
            Docname := DocNo;
            Docname := ConvertStr(Docname, ':', '_');
            Docname := ConvertStr(Docname, ':', '_');
            //FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
            FileName2 := '\\192.168.1.121\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
            FileDesc := Docname + '_' + Filer.GetFileName(FileName);
            //Filer.CopyClientFile(FileName, FileName2, true);
            // Filer.MoveFile(FileName2, '\\192.168.1.121\DocumentsPath\' + FileDesc);
            // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
            //Insert Link
            DocLink.Init;
            DocLink."Link ID" := 0;
            DocLink.URL1 := Procurementsetups."SharePoint Site Link" + '/' + Procurementsetups."SharePoint Site Main Library" + '/' + Procurementsetups."SharePoint Document Library" + '/' + Region + '/' + Procurementsetups."Evaluation Report DMS Link" + '/'
            + Docname + '/' + FileDesc;
            DocLink.Description := FileDesc;
            DocLink.Type := DocLink.Type::Link;
            DocLink.Company := COMPANYNAME;
            DocLink."User ID" := UserId;
            DocLink.Created := CreateDatetime(Today, Time);
            DocLink."Record ID" := TabID;
            DocLink.Insert;

            //Create Xml Document
            Procurementsetups.Get;
            if Procurementsetups.Find('-') then begin
                XmlFileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
                FileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
                //FileName :=Docname+'.xml';
                // if IsNull(xmlWriter) then
                //xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                //xmlWriter.WriteStartDocument();
                //Create Parent element
                //xmlWriter.WriteStartElement('Columns');
                //xmlWriter.WriteStartElement('Params');
                //xmlWriter.WriteElementString('Library', Procurementsetups."SharePoint Site Main Library");
                //xmlWriter.WriteElementString('Folder', Procurementsetups."SharePoint Document Library" + '/' + Region + '/' + Procurementsetups."Evaluation Report DMS Link" + '/' + Docname);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteStartElement('Files');
                //xmlWriter.WriteElementString('Filename', FileDesc);
                //xmlWriter.WriteEndElement();
                //Region Metadata
                //xmlWriter.WriteStartElement('Column');
                // REPEAT
                //Create Child elements
                //xmlWriter.WriteElementString('Title', 'Region');
                //xmlWriter.WriteElementString('Value', '');
                // //xmlWriter.WriteEndElement();
                // UNTIL DocLines.NEXT = 0;
                //End writing top element and XML document
                //xmlWriter.WriteEndElement();
                //Constituency Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Constituency');
                //xmlWriter.WriteElementString('Value', '');
                //xmlWriter.WriteEndElement();
                //Employee Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Employee');
                //xmlWriter.WriteElementString('Value', UserId);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteEndDocument();
                //xmlWriter.Close();
            end;
            // //Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
            // Filer.MoveFile(FileName, '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml');
        end;
        Message('Documents Uploaded Successffully');

    end;

    procedure UploadProffessionalOpinionDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Text)
    var
        Procurementsetups: Record "Procurement Setup";
        DocType: Record "DMS Documents";
        DocLines: Record "DMS Document Lines";
        FileName: Text[250];
    // xmlWriter: dotnet XmlTextWriter;
    //EncodingText: dotnet Encoding;
    begin

        Procurementsetups.Get;
        if Procurementsetups.Find('-') then begin
            //Uploade File to folder
            Docname := DocNo;
            Docname := ConvertStr(Docname, ':', '_');
            Docname := ConvertStr(Docname, ':', '_');
            //FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
            FileName2 := '\\192.168.1.121\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
            FileDesc := Docname + '_' + Filer.GetFileName(FileName);
            //Filer.CopyClientFile(FileName, FileName2, true);
            // Filer.MoveFile(FileName2, '\\192.168.1.121\DocumentsPath\' + FileDesc);
            // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
            //Insert Link
            DocLink.Init;
            DocLink."Link ID" := 0;
            DocLink.URL1 := Procurementsetups."SharePoint Site Link" + '/' + Procurementsetups."SharePoint Site Main Library" + '/' + Procurementsetups."SharePoint Document Library" + '/' + Region + '/' + Procurementsetups."Professional Opinion DMS Link" + '/'
            + Docname + '/' + FileDesc;
            DocLink.Description := FileDesc;
            DocLink.Type := DocLink.Type::Link;
            DocLink.Company := COMPANYNAME;
            DocLink."User ID" := UserId;
            DocLink.Created := CreateDatetime(Today, Time);
            DocLink."Record ID" := TabID;
            DocLink.Insert;

            //Create Xml Document
            Procurementsetups.Get;
            if Procurementsetups.Find('-') then begin
                XmlFileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
                FileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
                //FileName :=Docname+'.xml';
                // if IsNull(xmlWriter) then
                //xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                //xmlWriter.WriteStartDocument();
                //Create Parent element
                //xmlWriter.WriteStartElement('Columns');
                //xmlWriter.WriteStartElement('Params');
                //xmlWriter.WriteElementString('Library', Procurementsetups."SharePoint Site Main Library");
                //xmlWriter.WriteElementString('Folder', Procurementsetups."SharePoint Document Library" + '/' + Region + '/' + Procurementsetups."Professional Opinion DMS Link" + '/' + Docname);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteStartElement('Files');
                //xmlWriter.WriteElementString('Filename', FileDesc);
                //xmlWriter.WriteEndElement();
                //Region Metadata
                //xmlWriter.WriteStartElement('Column');
                // REPEAT
                //Create Child elements
                //xmlWriter.WriteElementString('Title', 'Region');
                //xmlWriter.WriteElementString('Value', '');
                // //xmlWriter.WriteEndElement();
                // UNTIL DocLines.NEXT = 0;
                //End writing top element and XML document
                //xmlWriter.WriteEndElement();
                //Constituency Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Constituency');
                //xmlWriter.WriteElementString('Value', '');
                //xmlWriter.WriteEndElement();
                //Employee Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Employee');
                //xmlWriter.WriteElementString('Value', UserId);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteEndDocument();
                //xmlWriter.Close();
            end;
            // //Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
            // Filer.MoveFile(FileName, '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml');
        end;
        Message('Documents Uploaded Successffully');

    end;

    procedure UploadReceiptsDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Text): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record "DMS Document Lines";
        FileName: Text[250];
    // xmlWriter: dotnet XmlTextWriter;
    //EncodingText: dotnet Encoding;
    begin
        CashManagementSetup.Get;
        if CashManagementSetup.Find('-') then begin
            //Uploade File to folder
            Docname := DocNo;
            Docname := ConvertStr(Docname, ':', '_');
            Docname := ConvertStr(Docname, ':', '_');
            //FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
            FileName2 := '\\192.168.1.121\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
            FileDesc := Docname + '_' + Filer.GetFileName(FileName);
            //Filer.CopyClientFile(FileName, FileName2, true);
            // Filer.MoveFile(FileName2, '\\192.168.1.121\DocumentsPath\' + FileDesc);
            // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
            //Insert Link
            DocLink.Init;
            DocLink."Link ID" := 0;
            DocLink.URL1 := CashManagementSetup."SharePoint Site Link" + '/' + CashManagementSetup."SharePoint Site Main Library" + '/' + CashManagementSetup."SharePoint Document Library" + '/' + Region + '/' + CashManagementSetup."Receipts DMS Link" + '/'
            + Docname + '/' + FileDesc;
            DocLink.Description := FileDesc;
            DocLink.Type := DocLink.Type::Link;
            DocLink.Company := COMPANYNAME;
            DocLink."User ID" := UserId;
            DocLink.Created := CreateDatetime(Today, Time);
            DocLink."Record ID" := TabID;
            DocLink.Insert;

            //Create Xml Document
            CashManagementSetup.Get;
            if CashManagementSetup.Find('-') then begin
                XmlFileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
                FileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
                //FileName :=Docname+'.xml';
                // if IsNull(xmlWriter) then
                //xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                //xmlWriter.WriteStartDocument();
                //Create Parent element
                //xmlWriter.WriteStartElement('Columns');
                //xmlWriter.WriteStartElement('Params');
                //xmlWriter.WriteElementString('Library', CashManagementSetup."SharePoint Site Main Library");
                //xmlWriter.WriteElementString('Folder', CashManagementSetup."SharePoint Document Library" + '/' + Region + '/' + CashManagementSetup."Receipts DMS Link" + '/' + Docname);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteStartElement('Files');
                //xmlWriter.WriteElementString('Filename', FileDesc);
                //xmlWriter.WriteEndElement();
                //Region Metadata
                //xmlWriter.WriteStartElement('Column');
                // REPEAT
                //Create Child elements
                //xmlWriter.WriteElementString('Title', 'Region');
                //xmlWriter.WriteElementString('Value', '');
                // //xmlWriter.WriteEndElement();
                // UNTIL DocLines.NEXT = 0;
                //End writing top element and XML document
                //xmlWriter.WriteEndElement();
                //Constituency Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Constituency');
                //xmlWriter.WriteElementString('Value', '');
                //xmlWriter.WriteEndElement();
                //Employee Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Employee');
                //xmlWriter.WriteElementString('Value', UserId);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteEndDocument();
                //xmlWriter.Close();
            end;
            // //Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
            // Filer.MoveFile(FileName, '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml');
        end;
        Message('Documents Uploaded Successffully');

    end;

    procedure UploadProcurementLawsDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Text)
    var
        Procurementsetups: Record "Procurement Setup";
        DocType: Record "DMS Documents";
        DocLines: Record "DMS Document Lines";
        FileName: Text[250];
    // xmlWriter: dotnet XmlTextWriter;
    //EncodingText: dotnet Encoding;
    begin

        Procurementsetups.Get;
        if Procurementsetups.Find('-') then begin
            //Uploade File to folder
            Docname := DocNo;
            Docname := ConvertStr(Docname, ':', '_');
            Docname := ConvertStr(Docname, ':', '_');
            //FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
            FileName2 := '\\192.168.1.121\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
            FileDesc := Docname + '_' + Filer.GetFileName(FileName);
            //Filer.CopyClientFile(FileName, FileName2, true);
            // Filer.MoveFile(FileName2, '\\192.168.1.121\DocumentsPath\' + FileDesc);
            // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
            //Insert Link
            DocLink.Init;
            DocLink."Link ID" := 0;
            DocLink.URL1 := Procurementsetups."SharePoint Site Link" + '/' + Procurementsetups."SharePoint Site Main Library" + '/' + Procurementsetups."SharePoint Document Library" + '/' + Region + '/' + Procurementsetups."Procurement Laws DMS Link" + '/'
            + Docname + '/' + FileDesc;
            DocLink.Description := FileDesc;
            DocLink.Type := DocLink.Type::Link;
            DocLink.Company := COMPANYNAME;
            DocLink."User ID" := UserId;
            DocLink.Created := CreateDatetime(Today, Time);
            DocLink."Record ID" := TabID;
            DocLink.Insert;

            //Create Xml Document
            Procurementsetups.Get;
            if Procurementsetups.Find('-') then begin
                XmlFileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
                FileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
                //FileName :=Docname+'.xml';
                // if IsNull(xmlWriter) then
                //xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                //xmlWriter.WriteStartDocument();
                //Create Parent element
                //xmlWriter.WriteStartElement('Columns');
                //xmlWriter.WriteStartElement('Params');
                //xmlWriter.WriteElementString('Library', Procurementsetups."SharePoint Site Main Library");
                //xmlWriter.WriteElementString('Folder', Procurementsetups."SharePoint Document Library" + '/' + Region + '/' + Procurementsetups."Procurement Laws DMS Link" + '/' + Docname);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteStartElement('Files');
                //xmlWriter.WriteElementString('Filename', FileDesc);
                //xmlWriter.WriteEndElement();
                //Region Metadata
                //xmlWriter.WriteStartElement('Column');
                // REPEAT
                //Create Child elements
                //xmlWriter.WriteElementString('Title', 'Region');
                //xmlWriter.WriteElementString('Value', '');
                // //xmlWriter.WriteEndElement();
                // UNTIL DocLines.NEXT = 0;
                //End writing top element and XML document
                //xmlWriter.WriteEndElement();
                //Constituency Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Constituency');
                //xmlWriter.WriteElementString('Value', '');
                //xmlWriter.WriteEndElement();
                //Employee Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Employee');
                //xmlWriter.WriteElementString('Value', UserId);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteEndDocument();
                //xmlWriter.Close();
            end;
            // //Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
            // Filer.MoveFile(FileName, '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml');
        end;
        Message('Documents Uploaded Successffully');

    end;

    procedure UploadTenderopeningregisterDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Text)
    var
        Procurementsetups: Record "Procurement Setup";
        DocType: Record "DMS Documents";
        DocLines: Record "DMS Document Lines";
        FileName: Text[250];
    //xmlWriter: dotnet XmlTextWriter;
    // EncodingText: dotnet Encoding;
    begin

        Procurementsetups.Get;
        if Procurementsetups.Find('-') then begin
            //Uploade File to folder
            Docname := DocNo;
            Docname := ConvertStr(Docname, ':', '_');
            Docname := ConvertStr(Docname, ':', '_');
            //FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
            FileName2 := '\\192.168.1.121\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
            FileDesc := Docname + '_' + Filer.GetFileName(FileName);
            //Filer.CopyClientFile(FileName, FileName2, true);
            // Filer.MoveFile(FileName2, '\\192.168.1.121\DocumentsPath\' + FileDesc);
            // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
            //Insert Link
            DocLink.Init;
            DocLink."Link ID" := 0;
            DocLink.URL1 := Procurementsetups."SharePoint Site Link" + '/' + Procurementsetups."SharePoint Site Main Library" + '/' + Procurementsetups."SharePoint Document Library" + '/' + Region + '/' + Procurementsetups."Tender Opening Reg DMS Link" + '/'
            + Docname + '/' + FileDesc;
            DocLink.Description := FileDesc;
            DocLink.Type := DocLink.Type::Link;
            DocLink.Company := COMPANYNAME;
            DocLink."User ID" := UserId;
            DocLink.Created := CreateDatetime(Today, Time);
            DocLink."Record ID" := TabID;
            DocLink.Insert;

            //Create Xml Document
            Procurementsetups.Get;
            if Procurementsetups.Find('-') then begin
                XmlFileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
                FileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
                //FileName :=Docname+'.xml';
                // if IsNull(xmlWriter) then
                //xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                //xmlWriter.WriteStartDocument();
                //Create Parent element
                //xmlWriter.WriteStartElement('Columns');
                //xmlWriter.WriteStartElement('Params');
                //xmlWriter.WriteElementString('Library', Procurementsetups."SharePoint Site Main Library");
                //xmlWriter.WriteElementString('Folder', Procurementsetups."SharePoint Document Library" + '/' + Region + '/' + Procurementsetups."Tender Opening Reg DMS Link" + '/' + Docname);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteStartElement('Files');
                //xmlWriter.WriteElementString('Filename', FileDesc);
                //xmlWriter.WriteEndElement();
                //Region Metadata
                //xmlWriter.WriteStartElement('Column');
                // REPEAT
                //Create Child elements
                //xmlWriter.WriteElementString('Title', 'Region');
                //xmlWriter.WriteElementString('Value', '');
                // //xmlWriter.WriteEndElement();
                // UNTIL DocLines.NEXT = 0;
                //End writing top element and XML document
                //xmlWriter.WriteEndElement();
                //Constituency Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Constituency');
                //xmlWriter.WriteElementString('Value', '');
                //xmlWriter.WriteEndElement();
                //Employee Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Employee');
                //xmlWriter.WriteElementString('Value', UserId);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteEndDocument();
                //xmlWriter.Close();
            end;
            // //Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
            // Filer.MoveFile(FileName, '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml');
        end;
        Message('Documents Uploaded Successffully');

    end;

    procedure UploadStandardContractDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Text)
    var
        Procurementsetups: Record "Procurement Setup";
        DocType: Record "DMS Documents";
        DocLines: Record "DMS Document Lines";
        FileName: Text[250];
    // xmlWriter: dotnet XmlTextWriter;
    //EncodingText: dotnet Encoding;
    begin

        Procurementsetups.Get;
        if Procurementsetups.Find('-') then begin
            //Uploade File to folder
            Docname := DocNo;
            Docname := ConvertStr(Docname, ':', '_');
            Docname := ConvertStr(Docname, ':', '_');
            //FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
            FileName2 := '\\192.168.1.121\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
            FileDesc := Docname + '_' + Filer.GetFileName(FileName);
            //Filer.CopyClientFile(FileName, FileName2, true);
            // Filer.MoveFile(FileName2, '\\192.168.1.121\DocumentsPath\' + FileDesc);
            // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
            //Insert Link
            DocLink.Init;
            DocLink."Link ID" := 0;
            DocLink.URL1 := Procurementsetups."SharePoint Site Link" + '/' + Procurementsetups."SharePoint Site Main Library" + '/' + Procurementsetups."SharePoint Document Library" + '/' + Region + '/' + Procurementsetups."Standard Contract DMS Link" + '/'
            + Docname + '/' + FileDesc;
            DocLink.Description := FileDesc;
            DocLink.Type := DocLink.Type::Link;
            DocLink.Company := COMPANYNAME;
            DocLink."User ID" := UserId;
            DocLink.Created := CreateDatetime(Today, Time);
            DocLink."Record ID" := TabID;
            DocLink.Insert;

            //Create Xml Document
            Procurementsetups.Get;
            if Procurementsetups.Find('-') then begin
                XmlFileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
                FileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
                //FileName :=Docname+'.xml';
                // if IsNull(xmlWriter) then
                //xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                //xmlWriter.WriteStartDocument();
                //Create Parent element
                //xmlWriter.WriteStartElement('Columns');
                //xmlWriter.WriteStartElement('Params');
                //xmlWriter.WriteElementString('Library', Procurementsetups."SharePoint Site Main Library");
                //xmlWriter.WriteElementString('Folder', Procurementsetups."SharePoint Document Library" + '/' + Region + '/' + Procurementsetups."Standard Contract DMS Link" + '/' + Docname);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteStartElement('Files');
                //xmlWriter.WriteElementString('Filename', FileDesc);
                //xmlWriter.WriteEndElement();
                //Region Metadata
                //xmlWriter.WriteStartElement('Column');
                // REPEAT
                //Create Child elements
                //xmlWriter.WriteElementString('Title', 'Region');
                //xmlWriter.WriteElementString('Value', '');
                // //xmlWriter.WriteEndElement();
                // UNTIL DocLines.NEXT = 0;
                //End writing top element and XML document
                //xmlWriter.WriteEndElement();
                //Constituency Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Constituency');
                //xmlWriter.WriteElementString('Value', '');
                //xmlWriter.WriteEndElement();
                //Employee Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Employee');
                //xmlWriter.WriteElementString('Value', UserId);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteEndDocument();
                //xmlWriter.Close();
            end;
            // //Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
            // Filer.MoveFile(FileName, '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml');
        end;
        Message('Documents Uploaded Successffully');

    end;

    procedure UploadRoadLinkDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Text): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record "DMS Document Lines";
        FileName: Text[250];
    // xmlWriter: dotnet XmlTextWriter;
    //EncodingText: dotnet Encoding;
    begin
        CashManagementSetup.Get;
        if CashManagementSetup.Find('-') then begin
            //Uploade File to folder
            Docname := DocNo;
            Docname := ConvertStr(Docname, ':', '_');
            Docname := ConvertStr(Docname, ':', '_');
            //FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
            FileName2 := '\\192.168.1.121\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
            FileDesc := Docname + '_' + Filer.GetFileName(FileName);
            //Filer.CopyClientFile(FileName, FileName2, true);
            // Filer.MoveFile(FileName2, '\\192.168.1.121\DocumentsPath\' + FileDesc);
            // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
            //Insert Link
            DocLink.Init;
            DocLink."Link ID" := 0;
            DocLink.URL1 := CashManagementSetup."SharePoint Site Link" + '/' + CashManagementSetup."SharePoint Site Main Library" + '/' + CashManagementSetup."SharePoint Document Library" + '/' + Region + '/' + CashManagementSetup."Payment Voucher DMS Link" + '/'
            + Docname + '/' + FileDesc;
            DocLink.Description := FileDesc;
            DocLink.Type := DocLink.Type::Link;
            DocLink.Company := COMPANYNAME;
            DocLink."User ID" := UserId;
            DocLink.Created := CreateDatetime(Today, Time);
            DocLink."Record ID" := TabID;
            DocLink.Insert;

            //Create Xml Document
            CashManagementSetup.Get;
            if CashManagementSetup.Find('-') then begin
                XmlFileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
                FileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
                //FileName :=Docname+'.xml';
                // if IsNull(xmlWriter) then
                //xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                //xmlWriter.WriteStartDocument();
                //Create Parent element
                //xmlWriter.WriteStartElement('Columns');
                //xmlWriter.WriteStartElement('Params');
                //xmlWriter.WriteElementString('Library', CashManagementSetup."SharePoint Site Main Library");
                //xmlWriter.WriteElementString('Folder', CashManagementSetup."SharePoint Document Library" + '/' + Region + '/' + CashManagementSetup."Payment Voucher DMS Link" + '/' + Docname);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteStartElement('Files');
                //xmlWriter.WriteElementString('Filename', FileDesc);
                //xmlWriter.WriteEndElement();
                //Region Metadata
                //xmlWriter.WriteStartElement('Column');
                // REPEAT
                //Create Child elements
                //xmlWriter.WriteElementString('Title', 'Region');
                //xmlWriter.WriteElementString('Value', '');
                // //xmlWriter.WriteEndElement();
                // UNTIL DocLines.NEXT = 0;
                //End writing top element and XML document
                //xmlWriter.WriteEndElement();
                //Constituency Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Constituency');
                //xmlWriter.WriteElementString('Value', '');
                //xmlWriter.WriteEndElement();
                //Employee Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Employee');
                //xmlWriter.WriteElementString('Value', UserId);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteEndDocument();
                //xmlWriter.Close();
            end;
            // //Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
            // Filer.MoveFile(FileName, '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml');
        end;
        Message('Document Uploaded Successffully');

    end;

    procedure UploadFunctionalProcurementPlanDocs(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Text)
    var
        Procurementsetups: Record "Procurement Setup";
        DocType: Record "DMS Documents";
        DocLines: Record "DMS Document Lines";
        FileName: Text[250];
    // xmlWriter: dotnet XmlTextWriter;
    //EncodingText: dotnet Encoding;
    begin
        CashManagementSetup.Get;
        if CashManagementSetup.Find('-') then begin
            //Uploade File to folder
            Docname := DocNo;
            Docname := ConvertStr(Docname, ':', '_');
            Docname := ConvertStr(Docname, ':', '_');
            //FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
            FileName2 := '\\192.168.1.121\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
            FileDesc := Docname + '_' + Filer.GetFileName(FileName);
            //Filer.CopyClientFile(FileName, FileName2, true);
            // Filer.MoveFile(FileName2, '\\192.168.1.121\DocumentsPath\' + FileDesc);
            // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
            //Insert Link
            DocLink.Init;
            DocLink."Link ID" := 0;
            DocLink.URL1 := CashManagementSetup."SharePoint Site Link" + '/' + CashManagementSetup."SharePoint Site Main Library" + '/' + CashManagementSetup."SharePoint Document Library" + '/' + Region + '/' + CashManagementSetup."Imprest Memo DMS Link" + '/'
            + Docname + '/' + FileDesc;
            DocLink.Description := FileDesc;
            DocLink.Type := DocLink.Type::Link;
            DocLink.Company := COMPANYNAME;
            DocLink."User ID" := UserId;
            DocLink.Created := CreateDatetime(Today, Time);
            DocLink."Record ID" := TabID;
            DocLink.Insert;

            //Create Xml Document
            CashManagementSetup.Get;
            if CashManagementSetup.Find('-') then begin
                XmlFileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
                FileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
                //FileName :=Docname+'.xml';
                // if IsNull(xmlWriter) then
                //xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                //xmlWriter.WriteStartDocument();
                //Create Parent element
                //xmlWriter.WriteStartElement('Columns');
                //xmlWriter.WriteStartElement('Params');
                //xmlWriter.WriteElementString('Library', CashManagementSetup."SharePoint Site Main Library");
                //xmlWriter.WriteElementString('Folder', CashManagementSetup."SharePoint Document Library" + '/' + Region + '/' + CashManagementSetup."Imprest Memo DMS Link" + '/' + Docname);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteStartElement('Files');
                //xmlWriter.WriteElementString('Filename', FileDesc);
                //xmlWriter.WriteEndElement();
                //Region Metadata
                //xmlWriter.WriteStartElement('Column');
                // REPEAT
                //Create Child elements
                //xmlWriter.WriteElementString('Title', 'Region');
                //xmlWriter.WriteElementString('Value', '');
                // //xmlWriter.WriteEndElement();
                // UNTIL DocLines.NEXT = 0;
                //End writing top element and XML document
                //xmlWriter.WriteEndElement();
                //Constituency Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Constituency');
                //xmlWriter.WriteElementString('Value', '');
                //xmlWriter.WriteEndElement();
                //Employee Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Employee');
                //xmlWriter.WriteElementString('Value', UserId);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteEndDocument();
                //xmlWriter.Close();
            end;
            // //Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
            // Filer.MoveFile(FileName, '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml');
        end;
        Message('Documents Uploaded Successffully');

    end;

    procedure UploadConsolidatedProcurementPlanDocs(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Text)
    var
        Procurementsetups: Record "Procurement Setup";
        DocType: Record "DMS Documents";
        DocLines: Record "DMS Document Lines";
        FileName: Text[250];
    // xmlWriter: dotnet XmlTextWriter;
    //EncodingText: dotnet Encoding;
    begin

        Procurementsetups.Get;
        if Procurementsetups.Find('-') then begin
            //Uploade File to folder
            Docname := DocNo;
            Docname := ConvertStr(Docname, ':', '_');
            Docname := ConvertStr(Docname, ':', '_');
            //FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
            FileName2 := '\\192.168.1.121\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
            FileDesc := Docname + '_' + Filer.GetFileName(FileName);
            //Filer.CopyClientFile(FileName, FileName2, true);
            // Filer.MoveFile(FileName2, '\\192.168.1.121\DocumentsPath\' + FileDesc);
            // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
            //Insert Link
            DocLink.Init;
            DocLink."Link ID" := 0;
            DocLink.URL1 := Procurementsetups."SharePoint Site Link" + '/' + Procurementsetups."SharePoint Site Main Library" + '/' + Procurementsetups."SharePoint Document Library" + '/' + Region + '/' + Procurementsetups."Procurement Laws DMS Link" + '/'
            + Docname + '/' + FileDesc;
            DocLink.Description := FileDesc;
            DocLink.Type := DocLink.Type::Link;
            DocLink.Company := COMPANYNAME;
            DocLink."User ID" := UserId;
            DocLink.Created := CreateDatetime(Today, Time);
            DocLink."Record ID" := TabID;
            DocLink.Insert;

            //Create Xml Document
            Procurementsetups.Get;
            if Procurementsetups.Find('-') then begin
                XmlFileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
                FileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
                //FileName :=Docname+'.xml';
                // if IsNull(xmlWriter) then
                //xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                //xmlWriter.WriteStartDocument();
                //Create Parent element
                //xmlWriter.WriteStartElement('Columns');
                //xmlWriter.WriteStartElement('Params');
                //xmlWriter.WriteElementString('Library', Procurementsetups."SharePoint Site Main Library");
                //xmlWriter.WriteElementString('Folder', Procurementsetups."SharePoint Document Library" + '/' + Region + '/' + Procurementsetups."Procurement Laws DMS Link" + '/' + Docname);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteStartElement('Files');
                //xmlWriter.WriteElementString('Filename', FileDesc);
                //xmlWriter.WriteEndElement();
                //Region Metadata
                //xmlWriter.WriteStartElement('Column');
                // REPEAT
                //Create Child elements
                //xmlWriter.WriteElementString('Title', 'Region');
                //xmlWriter.WriteElementString('Value', '');
                // //xmlWriter.WriteEndElement();
                // UNTIL DocLines.NEXT = 0;
                //End writing top element and XML document
                //xmlWriter.WriteEndElement();
                //Constituency Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Constituency');
                //xmlWriter.WriteElementString('Value', '');
                //xmlWriter.WriteEndElement();
                //Employee Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Employee');
                //xmlWriter.WriteElementString('Value', UserId);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteEndDocument();
                //xmlWriter.Close();
            end;
            // //Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
            // Filer.MoveFile(FileName, '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml');
        end;
        Message('Documents Uploaded Successffully');

    end;

    procedure UploadProcurementManualDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Text)
    var
        Procurementsetups: Record "Procurement Setup";
        DocType: Record "DMS Documents";
        DocLines: Record "DMS Document Lines";
        FileName: Text[250];
    // xmlWriter: dotnet XmlTextWriter;
    //EncodingText: dotnet Encoding;
    begin

        Procurementsetups.Get;
        if Procurementsetups.Find('-') then begin
            //Uploade File to folder
            Docname := DocNo;
            Docname := ConvertStr(Docname, ':', '_');
            Docname := ConvertStr(Docname, ':', '_');
            //FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
            FileName2 := '\\192.168.1.121\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
            FileDesc := Docname + '_' + Filer.GetFileName(FileName);
            //Filer.CopyClientFile(FileName, FileName2, true);
            // Filer.MoveFile(FileName2, '\\192.168.1.121\DocumentsPath\' + FileDesc);
            // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
            //Insert Link
            DocLink.Init;
            DocLink."Link ID" := 0;
            DocLink.URL1 := Procurementsetups."SharePoint Site Link" + '/' + Procurementsetups."SharePoint Site Main Library" + '/' + Procurementsetups."SharePoint Document Library" + '/' + Region + '/' + Procurementsetups."Procurement Manual DMS Link" + '/'
            + Docname + '/' + FileDesc;
            DocLink.Description := FileDesc;
            DocLink.Type := DocLink.Type::Link;
            DocLink.Company := COMPANYNAME;
            DocLink."User ID" := UserId;
            DocLink.Created := CreateDatetime(Today, Time);
            DocLink."Record ID" := TabID;
            DocLink.Insert;

            //Create Xml Document
            Procurementsetups.Get;
            if Procurementsetups.Find('-') then begin
                XmlFileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
                FileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
                //FileName :=Docname+'.xml';
                // if IsNull(xmlWriter) then
                //xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                //xmlWriter.WriteStartDocument();
                //Create Parent element
                //xmlWriter.WriteStartElement('Columns');
                //xmlWriter.WriteStartElement('Params');
                //xmlWriter.WriteElementString('Library', Procurementsetups."SharePoint Site Main Library");
                //xmlWriter.WriteElementString('Folder', Procurementsetups."SharePoint Document Library" + '/' + Region + '/' + Procurementsetups."Procurement Manual DMS Link" + '/' + Docname);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteStartElement('Files');
                //xmlWriter.WriteElementString('Filename', FileDesc);
                //xmlWriter.WriteEndElement();
                //Region Metadata
                //xmlWriter.WriteStartElement('Column');
                // REPEAT
                //Create Child elements
                //xmlWriter.WriteElementString('Title', 'Region');
                //xmlWriter.WriteElementString('Value', '');
                // //xmlWriter.WriteEndElement();
                // UNTIL DocLines.NEXT = 0;
                //End writing top element and XML document
                //xmlWriter.WriteEndElement();
                //Constituency Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Constituency');
                //xmlWriter.WriteElementString('Value', '');
                //xmlWriter.WriteEndElement();
                //Employee Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Employee');
                //xmlWriter.WriteElementString('Value', UserId);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteEndDocument();
                //xmlWriter.Close();
            end;
            // //Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
            // Filer.MoveFile(FileName, '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml');
        end;
        Message('Documents Uploaded Successffully');

    end;

    procedure UploadProcurementCircularDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Text)
    var
        Procurementsetups: Record "Procurement Setup";
        DocType: Record "DMS Documents";
        DocLines: Record "DMS Document Lines";
        FileName: Text[250];
    // xmlWriter: dotnet XmlTextWriter;
    //EncodingText: dotnet Encoding;
    begin

        Procurementsetups.Get;
        if Procurementsetups.Find('-') then begin
            //Uploade File to folder
            Docname := DocNo;
            Docname := ConvertStr(Docname, ':', '_');
            Docname := ConvertStr(Docname, ':', '_');
            //FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
            FileName2 := '\\192.168.1.121\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
            FileDesc := Docname + '_' + Filer.GetFileName(FileName);
            //Filer.CopyClientFile(FileName, FileName2, true);
            // Filer.MoveFile(FileName2, '\\192.168.1.121\DocumentsPath\' + FileDesc);
            // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
            //Insert Link
            DocLink.Init;
            DocLink."Link ID" := 0;
            DocLink.URL1 := Procurementsetups."SharePoint Site Link" + '/' + Procurementsetups."SharePoint Site Main Library" + '/' + Procurementsetups."SharePoint Document Library" + '/' + Region + '/' + Procurementsetups."Procurement Circular DMS Link" + '/'
            + Docname + '/' + FileDesc;
            DocLink.Description := FileDesc;
            DocLink.Type := DocLink.Type::Link;
            DocLink.Company := COMPANYNAME;
            DocLink."User ID" := UserId;
            DocLink.Created := CreateDatetime(Today, Time);
            DocLink."Record ID" := TabID;
            DocLink.Insert;

            //Create Xml Document
            Procurementsetups.Get;
            if Procurementsetups.Find('-') then begin
                XmlFileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
                FileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
                //FileName :=Docname+'.xml';
                // if IsNull(xmlWriter) then
                //xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                //xmlWriter.WriteStartDocument();
                //Create Parent element
                //xmlWriter.WriteStartElement('Columns');
                //xmlWriter.WriteStartElement('Params');
                //xmlWriter.WriteElementString('Library', Procurementsetups."SharePoint Site Main Library");
                //xmlWriter.WriteElementString('Folder', Procurementsetups."SharePoint Document Library" + '/' + Region + '/' + Procurementsetups."Procurement Circular DMS Link" + '/' + Docname);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteStartElement('Files');
                //xmlWriter.WriteElementString('Filename', FileDesc);
                //xmlWriter.WriteEndElement();
                //Region Metadata
                //xmlWriter.WriteStartElement('Column');
                // REPEAT
                //Create Child elements
                //xmlWriter.WriteElementString('Title', 'Region');
                //xmlWriter.WriteElementString('Value', '');
                // //xmlWriter.WriteEndElement();
                // UNTIL DocLines.NEXT = 0;
                //End writing top element and XML document
                //xmlWriter.WriteEndElement();
                //Constituency Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Constituency');
                //xmlWriter.WriteElementString('Value', '');
                //xmlWriter.WriteEndElement();
                //Employee Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Employee');
                //xmlWriter.WriteElementString('Value', UserId);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteEndDocument();
                //xmlWriter.Close();
            end;
            // //Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
            // Filer.MoveFile(FileName, '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml');
        end;
        Message('Documents Uploaded Successffully');

    end;

    procedure UpdateLinks(Id: Integer; Url: Text[2048]; "Failure Reason": Text[250])
    begin
        DocLink.Reset;
        DocLink.SetRange("Link ID", Id);
        if DocLink.FindFirst() then begin
            // DocLink.URL2 := Url;
            //  DocLink.Polled := true;
            //DocLink."Uploaded To SharePoint" := true;
            // DocLink."Failure reason" := "Failure Reason";
            DocLink.Modify();
        end;
    end;

    procedure UploadTrainingMgtDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record "DMS Document Lines";
        FileName: Text[250];
        // xmlWriter: dotnet XmlTextWriter;
        //EncodingText: dotnet Encoding;
        Region: Code[100];
    begin
        CashManagementSetup.Get;
        if CashManagementSetup.Find('-') then begin
            //Uploade File to folder
            Docname := DocNo;
            Docname := ConvertStr(Docname, ':', '_');
            Docname := ConvertStr(Docname, ':', '_');
            //Docname:=CONVERTSTR(Docname,' ','_');
            //FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
            FileName2 := '\\192.168.1.121\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
            FileDesc := Docname + '_' + Filer.GetFileName(FileName);
            //Filer.CopyClientFile(FileName, FileName2, true);
            // Filer.MoveFile(FileName2, '\\192.168.1.121\DocumentsPath\' + FileDesc);
            // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
            //Insert Link
            DocLink.Init;
            DocLink."Link ID" := 0;
            DocLink.URL1 := CashManagementSetup."SharePoint Site Link" + '/' + CashManagementSetup."SharePoint Site Main Library" + '/' + CashManagementSetup."SharePoint Document Library" + '/' + Region + '/' + CashManagementSetup."Staff Claims DMS Link" + '/'
            + Docname + '/' + FileDesc;
            DocLink.Description := FileDesc;
            DocLink.Type := DocLink.Type::Link;
            DocLink.Company := COMPANYNAME;
            DocLink."User ID" := UserId;
            DocLink.Created := CreateDatetime(Today, Time);
            DocLink."Record ID" := TabID;
            DocLink.Insert;

            //Create Xml Document
            CashManagementSetup.Get;
            if CashManagementSetup.Find('-') then begin
                XmlFileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
                FileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
                //FileName :=Docname+'.xml';
                // if IsNull(xmlWriter) then
                //xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                //xmlWriter.WriteStartDocument();
                //Create Parent element
                //xmlWriter.WriteStartElement('Columns');
                //xmlWriter.WriteStartElement('Params');
                //xmlWriter.WriteElementString('Library', CashManagementSetup."SharePoint Site Main Library");
                //xmlWriter.WriteElementString('Folder', CashManagementSetup."SharePoint Document Library" + '/' + Region + '/' + CashManagementSetup."Staff Claims DMS Link" + '/' + Docname);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteStartElement('Files');
                //xmlWriter.WriteElementString('Filename', FileDesc);
                //xmlWriter.WriteEndElement();
                //Region Metadata
                //xmlWriter.WriteStartElement('Column');
                // REPEAT
                //Create Child elements
                //xmlWriter.WriteElementString('Title', 'Region');
                //xmlWriter.WriteElementString('Value', '');
                // //xmlWriter.WriteEndElement();
                // UNTIL DocLines.NEXT = 0;
                //End writing top element and XML document
                //xmlWriter.WriteEndElement();
                //Constituency Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Constituency');
                //xmlWriter.WriteElementString('Value', '');
                //xmlWriter.WriteEndElement();
                //Employee Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Employee');
                //xmlWriter.WriteElementString('Value', UserId);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteEndDocument();
                //xmlWriter.Close();
            end;
            // //Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
            // Filer.MoveFile(FileName, '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml');
        end;
        Message('Documents Uploaded Successffully');

    end;

    procedure UploadCPRExportedForImport(DocumentType: Option; DocNo: Code[50]; DocDesc: Text; TabID: RecordID; region: Code[100]): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record "DMS Document Lines";
        FileName: Text[250];
    // xmlWriter: dotnet XmlTextWriter;
    //EncodingText: dotnet Encoding;
    begin
        CashManagementSetup.Get;
        if CashManagementSetup.Find('-') then begin
            //Uploade File to folder
            Docname := DocNo;
            Docname := ConvertStr(Docname, ':', '_');
            Docname := ConvertStr(Docname, ':', '_');
            //FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
            FileName2 := 'C:\QuickPay\ExcelTemplates\TempFilesImport\' + Filer.GetFileName(FileName);
            FileDesc := Filer.GetFileName(FileName);
            //Filer.CopyClientFile(FileName, FileName2, true);
            // Filer.MoveFile(FileName2, 'C:\QuickPay\ExcelTemplates\TempFilesImport\' + FileDesc);
            // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
            //Insert Link
            DocLink.Init;
            DocLink."Link ID" := 0;
            DocLink.URL1 := CashManagementSetup."SharePoint Site Link" + '/' + CashManagementSetup."SharePoint Site Main Library" + '/' + CashManagementSetup."SharePoint Document Library" + '/' + region + '/' + CashManagementSetup."Imprest Surrender DMS Link" + '/'
            + Docname + '/' + FileDesc;
            DocLink.Description := FileDesc;
            DocLink.Type := DocLink.Type::Link;
            DocLink.Company := COMPANYNAME;
            //DocLink."Base URL" := '/' + CashManagementSetup."SharePoint Site Main Library" + '/' + CashManagementSetup."SharePoint Document Library" + '/' + region + '/' + CashManagementSetup."Imprest Surrender DMS Link";
            //DocLink."Document No" := DocNo;
            //DocLink.LocalUrl := FileName2;
            DocLink."User ID" := UserId;
            //DocLink."Fetch To Sharepoint" := true;
            //DocLink."Uploaded To SharePoint" := false;
            //DocLink."SP URL Returned" := '';
            DocLink.Created := CreateDatetime(Today, Time);
            DocLink."Record ID" := TabID;
            DocLink.Insert(true);

            //Create Xml Document
            /* CashManagementSetup.RESET;
             CashManagementSetup.GET;
               IF DocLines.FIND('-') THEN BEGIN
                 XmlFileName:='C:\QuickPay\ExcelTemplates\TempFilesImport\'+FileDesc+'.xml';
                 FileName :='C:\QuickPay\ExcelTemplates\TempFilesImport'+FileDesc+'.xml';
                 //FileName :=Docname+'.xml';
                 // if IsNull(xmlWriter) THEN
                 //xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                 //xmlWriter.WriteStartDocument();
                 //Create Parent element
                 //xmlWriter.WriteStartElement('Columns');
                 //xmlWriter.WriteStartElement('Params');
                 //xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
                 //xmlWriter.WriteElementString('Region',region);
                 //xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+region+'/'+CashManagementSetup."Staff Claims DMS Link"+'/'+Docname);
                 //xmlWriter.WriteEndElement();
                 //xmlWriter.WriteStartElement('Files');
                 //xmlWriter.WriteElementString('Filename',FileDesc);
                 //xmlWriter.WriteEndElement();
                  //Region Metadata
                 //xmlWriter.WriteStartElement('Column');
                 // REPEAT
                 //Create Child elements
                 //xmlWriter.WriteElementString('Title','Region');
                 //xmlWriter.WriteElementString('Value',region);
                 //End writing top element and XML document
                 //xmlWriter.WriteEndElement();
                //Constituency Metadata
                 //xmlWriter.WriteStartElement('Column');
                 //xmlWriter.WriteElementString('Title','Constituency');
                 //xmlWriter.WriteElementString('Value','');
                 //xmlWriter.WriteEndElement();
                 //Employee Metadata
                 //xmlWriter.WriteStartElement('Column');
                 //xmlWriter.WriteElementString('Title','Employee');
                 //xmlWriter.WriteElementString('Value',USERID);
                 //xmlWriter.WriteEndElement();
                 //xmlWriter.WriteEndDocument();
                 //xmlWriter.Close();
                 END;*/
            // //Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
            //Filer.MoveFile(FileName,'C:\QuickPay\ExcelTemplates\TempFilesImport\'+FileDesc+'.xml');
        end;
        Message('Documents Uploaded Successffully');


    end;

    procedure UploadIFSTenderDocuments(DocumentType: Option; DocNo: Code[50]; DocDesc: Text; TabID: RecordID; region: Code[100]): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record "DMS Document Lines";
        FileName: Text[250];
        // xmlWriter: dotnet XmlTextWriter;
        //EncodingText: dotnet Encoding;
        Procurementsetups: Record "Procurement Setup";
    begin
        Procurementsetups.Get;
        if Procurementsetups.Find('-') then begin
            //Uploade File to folder
            Docname := DocNo;
            Docname := ConvertStr(Docname, ':', '_');
            Docname := ConvertStr(Docname, ':', '_');
            //FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF');
            FileName2 := 'C:\DOCS\' + Docname + '_' + Filer.GetFileName(FileName);
            FileDesc := Docname + '_' + Filer.GetFileName(FileName);
            //Filer.CopyClientFile(FileName, FileName2, true);
            // Filer.MoveFile(FileName2, 'C:\DOCS\' + FileDesc);
            // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
            //Insert Link
            DocLink.Init;
            DocLink."Link ID" := 0;
            DocLink.URL1 := Procurementsetups."SharePoint Site Link" + '/' + Procurementsetups."SharePoint Site Main Library" + '/' + Procurementsetups."SharePoint Document Library" + '/' + region + '/' + Procurementsetups."IFS DMS Link" + '/'
            + Docname + '/' + FileDesc;
            DocLink.Description := FileDesc;
            DocLink.Type := DocLink.Type::Link;
            DocLink.Company := COMPANYNAME;
            //DocLink."Base URL" := '/' + Procurementsetups."SharePoint Site Main Library" + '/' + Procurementsetups."SharePoint Document Library" + '/' + region + '/' + Procurementsetups."IFS DMS Link";
            //DocLink."Document No" := DocNo;
            //DocLink.LocalUrl := FileName2;
            DocLink."User ID" := UserId;
            //DocLink."Fetch To Sharepoint" := true;
            //DocLink."Uploaded To SharePoint" := false;
            //DocLink."SP URL Returned" := '';
            DocLink.Created := CreateDatetime(Today, Time);
            DocLink."Record ID" := TabID;
            DocLink.Insert(true);

            //Create Xml Document
            Procurementsetups.Reset;
            Procurementsetups.Get;
            if DocLines.Find('-') then begin
                XmlFileName := 'C:\DOCS\' + FileDesc + '.xml';
                FileName := 'C:\DOCS\' + FileDesc + '.xml';
                //FileName :=Docname+'.xml';
                // if IsNull(xmlWriter) then
                //xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                //xmlWriter.WriteStartDocument();
                //Create Parent element
                //xmlWriter.WriteStartElement('Columns');
                //xmlWriter.WriteStartElement('Params');
                //xmlWriter.WriteElementString('Library', Procurementsetups."SharePoint Site Main Library");
                //xmlWriter.WriteElementString('Region', region);
                //xmlWriter.WriteElementString('Folder', Procurementsetups."SharePoint Document Library" + '/' + region + '/' + Procurementsetups."IFS DMS Link" + '/' + Docname);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteStartElement('Files');
                //xmlWriter.WriteElementString('Filename', FileDesc);
                //xmlWriter.WriteEndElement();
                //Region Metadata
                //xmlWriter.WriteStartElement('Column');
                // REPEAT
                //Create Child elements
                //xmlWriter.WriteElementString('Title', 'Region');
                //xmlWriter.WriteElementString('Value', region);
                //End writing top element and XML document
                //xmlWriter.WriteEndElement();
                //Constituency Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Constituency');
                //xmlWriter.WriteElementString('Value', '');
                //xmlWriter.WriteEndElement();
                //Employee Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Employee');
                //xmlWriter.WriteElementString('Value', UserId);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteEndDocument();
                //xmlWriter.Close();
            end;
            // //Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
            // Filer.MoveFile(FileName, 'C:\DOCS\' + FileDesc + '.xml');
        end;


        Message('Documents Uploaded Successffully');

    end;

    procedure UploadprnrDocuments(DocumentType: Option; DocNo: Code[50]; DocDesc: Text; TabID: RecordID; region: Code[100]): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record "DMS Document Lines";
        FileName: Text[250];
        // xmlWriter: dotnet XmlTextWriter;
        //EncodingText: dotnet Encoding;
        Procurementsetups: Record "Procurement Setup";
    begin
        Procurementsetups.Get;
        if Procurementsetups.Find('-') then begin
            //Uploade File to folder
            Docname := DocNo;
            Docname := ConvertStr(Docname, ':', '_');
            Docname := ConvertStr(Docname, ':', '_');
            //FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
            FileName2 := 'C:\DOCS\' + Docname + '_' + Filer.GetFileName(FileName);
            FileDesc := Docname + '_' + Filer.GetFileName(FileName);
            //Filer.CopyClientFile(FileName, FileName2, true);
            // Filer.MoveFile(FileName2, 'C:\DOCS\' + FileDesc);
            // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
            //Insert Link
            DocLink.Init;
            DocLink."Link ID" := 0;
            DocLink.URL1 := Procurementsetups."SharePoint Site Link" + '/' + Procurementsetups."SharePoint Site Main Library" + '/' + Procurementsetups."SharePoint Document Library" + '/' + region + '/' + Procurementsetups."PRN(Works) DMS Link" + '/'
            + Docname + '/' + FileDesc;
            DocLink.Description := FileDesc;
            DocLink.Type := DocLink.Type::Link;
            DocLink.Company := COMPANYNAME;
            //DocLink."Base URL" := '/' + Procurementsetups."SharePoint Site Main Library" + '/' + Procurementsetups."SharePoint Document Library" + '/' + region + '/' + Procurementsetups."PRN(Works) DMS Link";
            //DocLink."Document No" := DocNo;
            //DocLink.LocalUrl := FileName2;
            DocLink."User ID" := UserId;
            //DocLink."Fetch To Sharepoint" := true;
            //DocLink."Uploaded To SharePoint" := false;
            //DocLink."SP URL Returned" := '';
            DocLink.Created := CreateDatetime(Today, Time);
            DocLink."Record ID" := TabID;
            DocLink.Insert(true);

            //Create Xml Document
            Procurementsetups.Reset;
            Procurementsetups.Get;
            if DocLines.Find('-') then begin
                XmlFileName := 'C:\DOCS\' + FileDesc + '.xml';
                FileName := 'C:\DOCS\' + FileDesc + '.xml';
                //FileName :=Docname+'.xml';
                // if IsNull(xmlWriter) then
                //xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                //xmlWriter.WriteStartDocument();
                //Create Parent element
                //xmlWriter.WriteStartElement('Columns');
                //xmlWriter.WriteStartElement('Params');
                //xmlWriter.WriteElementString('Library', Procurementsetups."SharePoint Site Main Library");
                //xmlWriter.WriteElementString('Region', region);
                //xmlWriter.WriteElementString('Folder', Procurementsetups."SharePoint Document Library" + '/' + region + '/' + Procurementsetups."PRN(Works) DMS Link" + '/' + Docname);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteStartElement('Files');
                //xmlWriter.WriteElementString('Filename', FileDesc);
                //xmlWriter.WriteEndElement();
                //Region Metadata
                //xmlWriter.WriteStartElement('Column');
                // REPEAT
                //Create Child elements
                //xmlWriter.WriteElementString('Title', 'Region');
                //xmlWriter.WriteElementString('Value', region);
                //End writing top element and XML document
                //xmlWriter.WriteEndElement();
                //Constituency Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Constituency');
                //xmlWriter.WriteElementString('Value', '');
                //xmlWriter.WriteEndElement();
                //Employee Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Employee');
                //xmlWriter.WriteElementString('Value', UserId);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteEndDocument();
                //xmlWriter.Close();
            end;
            // //Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
            // Filer.MoveFile(FileName, 'C:\DOCS\' + FileDesc + '.xml');
        end;


        Message('Documents Uploaded Successffully');

    end;

    procedure UploadIFSTenderRespDocuments(DocumentType: Option; DocNo: Code[50]; DocDesc: Text; TabID: RecordID; region: Code[100]): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record "DMS Document Lines";
        FileName: Text[250];
        // xmlWriter: dotnet XmlTextWriter;
        //EncodingText: dotnet Encoding;
        Procurementsetups: Record "Procurement Setup";
    begin
        Procurementsetups.Get;
        if Procurementsetups.Find('-') then begin
            //Uploade File to folder
            Docname := DocNo;
            Docname := ConvertStr(Docname, ':', '_');
            Docname := ConvertStr(Docname, ':', '_');
            //FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
            FileName2 := 'C:\DOCS\' + Docname + '_' + Filer.GetFileName(FileName);
            FileDesc := Docname + '_' + Filer.GetFileName(FileName);
            //Filer.CopyClientFile(FileName, FileName2, true);
            // Filer.MoveFile(FileName2, 'C:\DOCS\' + FileDesc);
            // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
            //Insert Link
            DocLink.Init;
            DocLink."Link ID" := 0;
            DocLink.URL1 := Procurementsetups."SharePoint Site Link" + '/' + Procurementsetups."SharePoint Site Main Library" + '/' + Procurementsetups."SharePoint Document Library" + '/' + region + '/' + Procurementsetups."IFS Bid Response DMS Link" + '/'
            + Docname + '/' + FileDesc;
            DocLink.Description := FileDesc;
            DocLink.Type := DocLink.Type::Link;
            DocLink.Company := COMPANYNAME;
            //DocLink."Base URL" := '/' + Procurementsetups."SharePoint Site Main Library" + '/' + Procurementsetups."SharePoint Document Library" + '/' + region + '/' + Procurementsetups."IFS Bid Response DMS Link";
            //DocLink."Document No" := DocNo;
            //DocLink.LocalUrl := FileName2;
            DocLink."User ID" := UserId;
            //DocLink."Fetch To Sharepoint" := true;
            //DocLink."Uploaded To SharePoint" := false;
            //DocLink."SP URL Returned" := '';
            DocLink.Created := CreateDatetime(Today, Time);
            DocLink."Record ID" := TabID;
            DocLink.Insert(true);

            //Create Xml Document
            Procurementsetups.Reset;
            Procurementsetups.Get;
            if DocLines.Find('-') then begin
                XmlFileName := 'C:\DOCS\' + FileDesc + '.xml';
                FileName := 'C:\DOCS\' + FileDesc + '.xml';
                //FileName :=Docname+'.xml';
                // if IsNull(xmlWriter) then
                //xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                //xmlWriter.WriteStartDocument();
                //Create Parent element
                //xmlWriter.WriteStartElement('Columns');
                //xmlWriter.WriteStartElement('Params');
                //xmlWriter.WriteElementString('Library', Procurementsetups."SharePoint Site Main Library");
                //xmlWriter.WriteElementString('Region', region);
                //xmlWriter.WriteElementString('Folder', Procurementsetups."SharePoint Document Library" + '/' + region + '/' + Procurementsetups."IFS DMS Link" + '/' + Docname);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteStartElement('Files');
                //xmlWriter.WriteElementString('Filename', FileDesc);
                //xmlWriter.WriteEndElement();
                //Region Metadata
                //xmlWriter.WriteStartElement('Column');
                // REPEAT
                //Create Child elements
                //xmlWriter.WriteElementString('Title', 'Region');
                //xmlWriter.WriteElementString('Value', region);
                //End writing top element and XML document
                //xmlWriter.WriteEndElement();
                //Constituency Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Constituency');
                //xmlWriter.WriteElementString('Value', '');
                //xmlWriter.WriteEndElement();
                //Employee Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Employee');
                //xmlWriter.WriteElementString('Value', UserId);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteEndDocument();
                //xmlWriter.Close();
            end;
            // //Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
            // Filer.MoveFile(FileName, 'C:\DOCS\' + FileDesc + '.xml');
        end;


        Message('Documents Uploaded Successffully');

    end;

    procedure UploadEvalReportsrDocuments(DocumentType: Option; DocNo: Code[50]; DocDesc: Text; TabID: RecordID; region: Code[100]): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record "DMS Document Lines";
        FileName: Text[250];
        // xmlWriter: dotnet XmlTextWriter;
        //EncodingText: dotnet Encoding;
        Procurementsetups: Record "Procurement Setup";
    begin
        Procurementsetups.Get;
        if Procurementsetups.Find('-') then begin
            //Uploade File to folder
            Docname := DocNo;
            Docname := ConvertStr(Docname, ':', '_');
            Docname := ConvertStr(Docname, ':', '_');
            //FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
            FileName2 := 'C:\DOCS\' + Docname + '_' + Filer.GetFileName(FileName);
            FileDesc := Docname + '_' + Filer.GetFileName(FileName);
            //Filer.CopyClientFile(FileName, FileName2, true);
            // Filer.MoveFile(FileName2, 'C:\DOCS\' + FileDesc);
            // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
            //Insert Link
            DocLink.Init;
            DocLink."Link ID" := 0;
            DocLink.URL1 := Procurementsetups."SharePoint Site Link" + '/' + Procurementsetups."SharePoint Site Main Library" + '/' + Procurementsetups."SharePoint Document Library" + '/' + region + '/' + Procurementsetups."Evaluation Report DMS Link" + '/'
            + Docname + '/' + FileDesc;
            DocLink.Description := FileDesc;
            DocLink.Type := DocLink.Type::Link;
            DocLink.Company := COMPANYNAME;
            //DocLink."Base URL" := '/' + Procurementsetups."SharePoint Site Main Library" + '/' + Procurementsetups."SharePoint Document Library" + '/' + region + '/' + Procurementsetups."Evaluation Report DMS Link";
            //DocLink."Document No" := DocNo;
            //DocLink.LocalUrl := FileName2;
            DocLink."User ID" := UserId;
            //DocLink."Fetch To Sharepoint" := true;
            //DocLink."Uploaded To SharePoint" := false;
            //DocLink."SP URL Returned" := '';
            DocLink.Created := CreateDatetime(Today, Time);
            DocLink."Record ID" := TabID;
            DocLink.Insert(true);

            //Create Xml Document
            Procurementsetups.Reset;
            Procurementsetups.Get;
            if DocLines.Find('-') then begin
                XmlFileName := 'C:\DOCS\' + FileDesc + '.xml';
                FileName := 'C:\DOCS\' + FileDesc + '.xml';
                //FileName :=Docname+'.xml';
                // if IsNull(xmlWriter) then
                //xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                //xmlWriter.WriteStartDocument();
                //Create Parent element
                //xmlWriter.WriteStartElement('Columns');
                //xmlWriter.WriteStartElement('Params');
                //xmlWriter.WriteElementString('Library', Procurementsetups."SharePoint Site Main Library");
                //xmlWriter.WriteElementString('Region', region);
                //xmlWriter.WriteElementString('Folder', Procurementsetups."SharePoint Document Library" + '/' + region + '/' + Procurementsetups."Evaluation Report DMS Link" + '/' + Docname);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteStartElement('Files');
                //xmlWriter.WriteElementString('Filename', FileDesc);
                //xmlWriter.WriteEndElement();
                //Region Metadata
                //xmlWriter.WriteStartElement('Column');
                // REPEAT
                //Create Child elements
                //xmlWriter.WriteElementString('Title', 'Region');
                //xmlWriter.WriteElementString('Value', region);
                //End writing top element and XML document
                //xmlWriter.WriteEndElement();
                //Constituency Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Constituency');
                //xmlWriter.WriteElementString('Value', '');
                //xmlWriter.WriteEndElement();
                //Employee Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Employee');
                //xmlWriter.WriteElementString('Value', UserId);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteEndDocument();
                //xmlWriter.Close();
            end;
            // //Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
            // Filer.MoveFile(FileName, 'C:\DOCS\' + FileDesc + '.xml');
        end;


        Message('Documents Uploaded Successffully');

    end;

    procedure UploadOpinionDocuments(DocumentType: Option; DocNo: Code[50]; DocDesc: Text; TabID: RecordID; region: Code[100]): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record "DMS Document Lines";
        FileName: Text[250];
        // xmlWriter: dotnet XmlTextWriter;
        //EncodingText: dotnet Encoding;
        Procurementsetups: Record "Procurement Setup";
    begin
        Procurementsetups.Get;
        if Procurementsetups.Find('-') then begin
            //Uploade File to folder
            Docname := DocNo;
            Docname := ConvertStr(Docname, ':', '_');
            Docname := ConvertStr(Docname, ':', '_');
            //FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
            FileName2 := 'C:\DOCS\' + Docname + '_' + Filer.GetFileName(FileName);
            FileDesc := Docname + '_' + Filer.GetFileName(FileName);
            //Filer.CopyClientFile(FileName, FileName2, true);
            // Filer.MoveFile(FileName2, 'C:\DOCS\' + FileDesc);
            // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
            //Insert Link
            DocLink.Init;
            DocLink."Link ID" := 0;
            DocLink.URL1 := Procurementsetups."SharePoint Site Link" + '/' + Procurementsetups."SharePoint Site Main Library" + '/' + Procurementsetups."SharePoint Document Library" + '/' + region + '/' + Procurementsetups."Professional Opinion DMS Link" + '/'
            + Docname + '/' + FileDesc;
            DocLink.Description := FileDesc;
            DocLink.Type := DocLink.Type::Link;
            DocLink.Company := COMPANYNAME;
            //DocLink."Base URL" := '/' + Procurementsetups."SharePoint Site Main Library" + '/' + Procurementsetups."SharePoint Document Library" + '/' + region + '/' + Procurementsetups."Professional Opinion DMS Link";
            //DocLink."Document No" := DocNo;
            //DocLink.LocalUrl := FileName2;
            DocLink."User ID" := UserId;
            //DocLink."Fetch To Sharepoint" := true;
            //DocLink."Uploaded To SharePoint" := false;
            //DocLink."SP URL Returned" := '';
            DocLink.Created := CreateDatetime(Today, Time);
            DocLink."Record ID" := TabID;
            DocLink.Insert(true);

            //Create Xml Document
            Procurementsetups.Reset;
            Procurementsetups.Get;
            if DocLines.Find('-') then begin
                XmlFileName := 'C:\DOCS\' + FileDesc + '.xml';
                FileName := 'C:\DOCS\' + FileDesc + '.xml';
                //FileName :=Docname+'.xml';
                // if IsNull(xmlWriter) then
                //xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                //xmlWriter.WriteStartDocument();
                //Create Parent element
                //xmlWriter.WriteStartElement('Columns');
                //xmlWriter.WriteStartElement('Params');
                //xmlWriter.WriteElementString('Library', Procurementsetups."SharePoint Site Main Library");
                //xmlWriter.WriteElementString('Region', region);
                //xmlWriter.WriteElementString('Folder', Procurementsetups."SharePoint Document Library" + '/' + region + '/' + Procurementsetups."Professional Opinion DMS Link" + '/' + Docname);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteStartElement('Files');
                //xmlWriter.WriteElementString('Filename', FileDesc);
                //xmlWriter.WriteEndElement();
                //Region Metadata
                //xmlWriter.WriteStartElement('Column');
                // REPEAT
                //Create Child elements
                //xmlWriter.WriteElementString('Title', 'Region');
                //xmlWriter.WriteElementString('Value', region);
                //End writing top element and XML document
                //xmlWriter.WriteEndElement();
                //Constituency Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Constituency');
                //xmlWriter.WriteElementString('Value', '');
                //xmlWriter.WriteEndElement();
                //Employee Metadata
                //xmlWriter.WriteStartElement('Column');
                //xmlWriter.WriteElementString('Title', 'Employee');
                //xmlWriter.WriteElementString('Value', UserId);
                //xmlWriter.WriteEndElement();
                //xmlWriter.WriteEndDocument();
                //xmlWriter.Close();
            end;
            // //Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
            // Filer.MoveFile(FileName, 'C:\DOCS\' + FileDesc + '.xml');
        end;


        Message('Documents Uploaded Successffully');

    end;

    procedure UploadEvalReportsAppendix1(DocumentType: Option; DocNo: Code[50]; DocDesc: Text; TabID: RecordID; region: Code[100]; IFSCode: Code[10]): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record "DMS Document Lines";
        FileName: Text[250];
        // xmlWriter: dotnet XmlTextWriter;
        //EncodingText: dotnet Encoding;
        Procurementsetups: Record "Procurement Setup";
    begin
        Procurementsetups.Get;
        if Procurementsetups.Find('-') then begin
            //Uploade File to folder
            Docname := DocNo;
            Docname := ConvertStr(Docname, ':', '_');
            Docname := ConvertStr(Docname, ':', '_');
            //FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
            FileName2 := 'C:\SCM\Tender\' + Docname + '_' + Filer.GetFileName(FileName);
            FileDesc := IFSCode + 'Executive.pdf';
            //FileDesc:=Docname+'_'+Filer.GetFileName(FileName);
            //Filer.CopyClientFile(FileName, FileName2, true);
            // Filer.MoveFile(FileName2, 'C:\SCM\Tender\' + FileDesc);
            // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
            //Insert Link
            DocLink.Init;
            DocLink."Link ID" := 0;
            DocLink.URL1 := Procurementsetups."SharePoint Site Link" + '/' + Procurementsetups."SharePoint Site Main Library" + '/' + Procurementsetups."SharePoint Document Library" + '/' + region + '/' + Procurementsetups."Evaluation Report DMS Link" + '/'
            + Docname + '/' + FileDesc;
            DocLink.Description := FileDesc;
            DocLink.Type := DocLink.Type::Link;
            DocLink.Company := COMPANYNAME;
            //DocLink."Base URL" := '/' + Procurementsetups."SharePoint Site Main Library" + '/' + Procurementsetups."SharePoint Document Library" + '/' + region + '/' + Procurementsetups."Evaluation Report DMS Link";
            //DocLink."Document No" := DocNo;
            //DocLink.LocalUrl := FileName2;
            DocLink."User ID" := UserId;
            //DocLink."Fetch To Sharepoint" := true;
            //DocLink."Uploaded To SharePoint" := false;
            //DocLink."SP URL Returned" := '';
            DocLink.Created := CreateDatetime(Today, Time);
            DocLink."Record ID" := TabID;
            DocLink.Insert(true);

            //Create Xml Document
            //        Procurementsetups.RESET;
            //        Procurementsetups.GET;
            //          IF DocLines.FIND('-') THEN BEGIN
            //            XmlFileName:='C:\DOCS\'+FileDesc+'.xml';
            //            FileName :='C:\DOCS\'+FileDesc+'.xml';
            //            //FileName :=Docname+'.xml';
            //            // if IsNull(xmlWriter) THEN
            //            //xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
            //            //xmlWriter.WriteStartDocument();
            //            //Create Parent element
            //            //xmlWriter.WriteStartElement('Columns');
            //            //xmlWriter.WriteStartElement('Params');
            //            //xmlWriter.WriteElementString('Library',Procurementsetups."SharePoint Site Main Library");
            //            //xmlWriter.WriteElementString('Region',region);
            //            //xmlWriter.WriteElementString('Folder',Procurementsetups."SharePoint Document Library"+'/'+region+'/'+Procurementsetups."Evaluation Report DMS Link"+'/'+Docname);
            //            //xmlWriter.WriteEndElement();
            //            //xmlWriter.WriteStartElement('Files');
            //            //xmlWriter.WriteElementString('Filename',FileDesc);
            //            //xmlWriter.WriteEndElement();
            //             //Region Metadata
            //            //xmlWriter.WriteStartElement('Column');
            //            // REPEAT
            //            //Create Child elements
            //            //xmlWriter.WriteElementString('Title','Region');
            //            //xmlWriter.WriteElementString('Value',region);
            //            //End writing top element and XML document
            //            //xmlWriter.WriteEndElement();
            //           //Constituency Metadata
            //            //xmlWriter.WriteStartElement('Column');
            //            //xmlWriter.WriteElementString('Title','Constituency');
            //            //xmlWriter.WriteElementString('Value','');
            //            //xmlWriter.WriteEndElement();
            //            //Employee Metadata
            //            //xmlWriter.WriteStartElement('Column');
            //            //xmlWriter.WriteElementString('Title','Employee');
            //            //xmlWriter.WriteElementString('Value',USERID);
            //            //xmlWriter.WriteEndElement();
            //            //xmlWriter.WriteEndDocument();
            //            //xmlWriter.Close();
            //            END;
            //           // //Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
            //           // Filer.MoveFile(FileName,'C:\DOCS\'+FileDesc+'.xml');
        end;


        Message('Documents Uploaded Successffully');

    end;

    procedure UploadEvalReportsAppendix2(DocumentType: Option; DocNo: Code[50]; DocDesc: Text; TabID: RecordID; region: Code[100]; IFSCode: Code[10]): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record "DMS Document Lines";
        FileName: Text[250];
        // xmlWriter: dotnet XmlTextWriter;
        //EncodingText: dotnet Encoding;
        Procurementsetups: Record "Procurement Setup";
    begin
        Procurementsetups.Get;
        if Procurementsetups.Find('-') then begin
            //Uploade File to folder
            Docname := DocNo;
            Docname := ConvertStr(Docname, ':', '_');
            Docname := ConvertStr(Docname, ':', '_');
            //FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
            FileName2 := 'C:\SCM\Tender\' + IFSCode + '\' + Docname + '_' + Filer.GetFileName(FileName);
            FileDesc := IFSCode + '_7_Appendix.pdf';
            //FileDesc:=Docname+'_'+Filer.GetFileName(FileName);
            //Filer.CopyClientFile(FileName, FileName2, true);
            // Filer.MoveFile(FileName2, 'C:\SCM\Tender\' + IFSCode + '\' + FileDesc);
            // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
            //Insert Link
            DocLink.Init;
            DocLink."Link ID" := 0;
            DocLink.URL1 := Procurementsetups."SharePoint Site Link" + '/' + Procurementsetups."SharePoint Site Main Library" + '/' + Procurementsetups."SharePoint Document Library" + '/' + region + '/' + Procurementsetups."Evaluation Report DMS Link" + '/'
            + Docname + '/' + FileDesc;
            DocLink.Description := FileDesc;
            DocLink.Type := DocLink.Type::Link;
            DocLink.Company := COMPANYNAME;
            //DocLink."Base URL" := '/' + Procurementsetups."SharePoint Site Main Library" + '/' + Procurementsetups."SharePoint Document Library" + '/' + region + '/' + Procurementsetups."Evaluation Report DMS Link";
            //DocLink."Document No" := DocNo;
            //DocLink.LocalUrl := FileName2;
            DocLink."User ID" := UserId;
            //DocLink."Fetch To Sharepoint" := true;
            //DocLink."Uploaded To SharePoint" := false;
            //DocLink."SP URL Returned" := '';
            DocLink.Created := CreateDatetime(Today, Time);
            DocLink."Record ID" := TabID;
            DocLink.Insert(true);

            //Create Xml Document
            //        Procurementsetups.RESET;
            //        Procurementsetups.GET;
            //          IF DocLines.FIND('-') THEN BEGIN
            //            XmlFileName:='C:\DOCS\'+FileDesc+'.xml';
            //            FileName :='C:\DOCS\'+FileDesc+'.xml';
            //            //FileName :=Docname+'.xml';
            //            // if IsNull(xmlWriter) THEN
            //            //xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
            //            //xmlWriter.WriteStartDocument();
            //            //Create Parent element
            //            //xmlWriter.WriteStartElement('Columns');
            //            //xmlWriter.WriteStartElement('Params');
            //            //xmlWriter.WriteElementString('Library',Procurementsetups."SharePoint Site Main Library");
            //            //xmlWriter.WriteElementString('Region',region);
            //            //xmlWriter.WriteElementString('Folder',Procurementsetups."SharePoint Document Library"+'/'+region+'/'+Procurementsetups."Evaluation Report DMS Link"+'/'+Docname);
            //            //xmlWriter.WriteEndElement();
            //            //xmlWriter.WriteStartElement('Files');
            //            //xmlWriter.WriteElementString('Filename',FileDesc);
            //            //xmlWriter.WriteEndElement();
            //             //Region Metadata
            //            //xmlWriter.WriteStartElement('Column');
            //            // REPEAT
            //            //Create Child elements
            //            //xmlWriter.WriteElementString('Title','Region');
            //            //xmlWriter.WriteElementString('Value',region);
            //            //End writing top element and XML document
            //            //xmlWriter.WriteEndElement();
            //           //Constituency Metadata
            //            //xmlWriter.WriteStartElement('Column');
            //            //xmlWriter.WriteElementString('Title','Constituency');
            //            //xmlWriter.WriteElementString('Value','');
            //            //xmlWriter.WriteEndElement();
            //            //Employee Metadata
            //            //xmlWriter.WriteStartElement('Column');
            //            //xmlWriter.WriteElementString('Title','Employee');
            //            //xmlWriter.WriteElementString('Value',USERID);
            //            //xmlWriter.WriteEndElement();
            //            //xmlWriter.WriteEndDocument();
            //            //xmlWriter.Close();
            //            END;
            //           // //Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
            //           // Filer.MoveFile(FileName,'C:\DOCS\'+FileDesc+'.xml');
        end;


        Message('Documents Uploaded Successffully');

    end;

    procedure CreateEvaluationReportLink(DocNo: Code[50]; tab: RecordId; IFSCode: Code[10]; Version: Text[10]): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record "DMS Document Lines";
        FileName: Text[250];
        // xmlWriter: dotnet XmlTextWriter;
        //EncodingText: dotnet Encoding;
        Procurementsetups: Record "Procurement Setup";
        FileDirectory: Text[250];
    begin
        FileDirectory := 'C:\SCM\Tender\';
        FileDesc := IFSCode + '_F' + Version + '_FinalEvaluationRprt.pdf';
        FileName := '\\192.168.1.34\SCM\Tender\' + IFSCode + '\' + FileDesc;
        DocLink.Init;
        DocLink."Link ID" := 0;
        DocLink.URL1 := FileName;
        DocLink.Description := FileDesc;
        DocLink.Type := DocLink.Type::Link;
        DocLink.Company := COMPANYNAME;
        //DocLink."Base URL" := FileName;
        //DocLink."Document No" := DocNo;
        //DocLink.LocalUrl := FileName;
        DocLink."User ID" := UserId;
        //DocLink."Fetch To Sharepoint" := true;
        //DocLink."Uploaded To SharePoint" := false;
        //DocLink."SP URL Returned" := '';
        DocLink.Created := CreateDatetime(Today, Time);
        DocLink."Record ID" := Tab;
        DocLink.Insert(true);
        Message('Document Link Created Successfully');

    end;

    procedure UploadContractDocuments(DocumentType: Option; DocNo: Code[50]; DocDesc: Text; TabID: RecordID; region: Code[100]; IFSCode: Code[10]): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record "DMS Document Lines";
        FileName: Text[250];
        // xmlWriter: dotnet XmlTextWriter;
        //EncodingText: dotnet Encoding;
        Procurementsetups: Record "Procurement Setup";
    begin
        Procurementsetups.Get;
        if Procurementsetups.Find('-') then begin
            //Uploade File to folder
            Docname := DocNo;
            Docname := ConvertStr(Docname, ':', '_');
            Docname := ConvertStr(Docname, ':', '_');
            //FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
            FileName2 := 'C:\SCM\Contract\' + IFSCode + '\' + Docname + '_' + Filer.GetFileName(FileName);
            FileDesc := IFSCode + '_7_Appendix.pdf';
            //FileDesc:=Docname+'_'+Filer.GetFileName(FileName);
            //Filer.CopyClientFile(FileName, FileName2, true);
            // Filer.MoveFile(FileName2, 'C:\SCM\Contract\' + IFSCode + '\' + FileDesc);
            // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
            //Insert Link
            /*     DocLink.INIT;
                 DocLink."Link ID":=0;
                 DocLink.URL1:=Procurementsetups."SharePoint Site Link"+'/'+Procurementsetups."SharePoint Site Main Library"+'/'+Procurementsetups."SharePoint Document Library"+'/'+region+'/'+Procurementsetups."Evaluation Report DMS Link"+'/'
                 +Docname+'/'+FileDesc;
                 DocLink.Description:=FileDesc;
                 DocLink.Type:=DocLink.Type::Link;
                 DocLink.Company:=COMPANYNAME;
                 DocLink."Base URL":='/'+Procurementsetups."SharePoint Site Main Library"+'/'+Procurementsetups."SharePoint Document Library"+'/'+region+'/'+Procurementsetups."Evaluation Report DMS Link";
                 DocLink."Document No":=DocNo;
                 DocLink.LocalUrl:=FileName2;
                 DocLink."User ID":=USERID;
                 DocLink."Fetch To Sharepoint":=TRUE;
                 DocLink."Uploaded To SharePoint":=FALSE;
                 DocLink."SP URL Returned":='';
                 DocLink.Created:=CREATEDATETIME(TODAY,TIME);
                 DocLink."Record ID":=TabID;
                 DocLink.INSERT(TRUE);*/

        end;


        Message('Documents Uploaded Successffully');


    end;

    procedure UploadContractDocs(DocNo: Code[50]; DocDesc: Text[2000]; TabID: RecordID; IFSCode: Code[10]; ContractIndex: Integer; DocumentID: Code[50]): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record "DMS Document Lines";
        FileName: Text[250];
        // xmlWriter: dotnet XmlTextWriter;
        //EncodingText: dotnet Encoding;
        Procurementsetups: Record "Procurement Setup";
        ContractIssuance: Record "Contract Issuance Requirements";
        FileLink: Text[2000];
        Indec: Text[30];
    begin
        Procurementsetups.Get;
        if Procurementsetups.Find('-') then begin
            //Uploade File to folder
            Docname := DocNo;
            Docname := ConvertStr(Docname, ':', '_');
            Docname := ConvertStr(Docname, ':', '_');
            DocDesc := ConvertStr(DocDesc, ':', '_');
            DocDesc := ConvertStr(DocDesc, '\', '_');
            DocDesc := ConvertStr(DocDesc, '/', '_');
            if ContractIndex < 10 then begin
                Indec := '0' + Format(ContractIndex)
            end else begin
                Indec := Format(ContractIndex)
            end;
            //FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
            FileName2 := 'C:\SCM\Contract\' + IFSCode + '\' + Docname + '_' + Filer.GetFileName(FileName);
            FileDesc := IFSCode + '_' + Indec + '_' + DocNo + '_' + DocDesc + '.pdf';
            //Filer.CopyClientFile(FileName, FileName2, true);
            // Filer.MoveFile(FileName2, 'C:\SCM\Contract\' + IFSCode + '\' + FileDesc);
        end;


        FileLink := '\\192.168.1.187\SCM\Contract\' + IFSCode + '\' + FileDesc;
        ContractIssuance.Reset;
        ContractIssuance.SetRange("PRN No", IFSCode);
        ContractIssuance.SetRange("Procurement Document Type", DocNo);
        ContractIssuance.SetRange("Document ID", DocumentID);
        if ContractIssuance.FindSet then begin
            ContractIssuance."Document Link" := FileLink;
            ContractIssuance.Modify(true);
        end;
        //   MESSAGE('Document Link Created Successfully %1',FileLink);
        Message('Documents Uploaded Successffully');
    end;

    procedure CreateContractLinks(DocNo: Code[50]; IFSCode: Code[10]; FileLink: Text[250]): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record "DMS Document Lines";
        FileName: Text[250];
        // xmlWriter: dotnet XmlTextWriter;
        //EncodingText: dotnet Encoding;
        Procurementsetups: Record "Procurement Setup";
        FileDirectory: Text[250];
        ContractIssuance: Record "Contract Issuance Requirements";
    begin
        //FileDirectory:='C:\SCM\Tender\';
        //FileDesc:=FileLink;
        FileName := '\\192.168.1.187\SCM\Contract\' + IFSCode + '\' + FileLink;
        ContractIssuance.Reset;
        ContractIssuance.SetRange("Document ID", IFSCode);
        ContractIssuance.SetRange("Procurement Document Type", DocNo);
        if ContractIssuance.FindSet then begin
            ContractIssuance."Document ID" := FileName;
            ContractIssuance.Modify(true);
        end;
        Message('Document Link Created Successfully');

    end;

    procedure CreateContractReportLink(DocNo: Code[50]; TabID: RecordID; IFSCode: Code[10]): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record "DMS Document Lines";
        FileName: Text[250];
        // xmlWriter: dotnet XmlTextWriter;
        //EncodingText: dotnet Encoding;
        Procurementsetups: Record "Procurement Setup";
        FileDirectory: Text[250];
    begin
        //FileDirectory:='C:\SCM\Tender\';
        FileDesc := IFSCode + 'FinalContract.pdf';
        FileName := '\\192.168.1.187\SCM\Contract\' + IFSCode + '\' + FileDesc;
        DocLink.Init;
        DocLink."Link ID" := 0;
        DocLink.URL1 := FileName;
        DocLink.Description := FileDesc;
        DocLink.Type := DocLink.Type::Link;
        DocLink.Company := COMPANYNAME;
        //DocLink."Base URL" := FileName;
        //DocLink."Document No" := DocNo;
        //DocLink.LocalUrl := FileName;
        DocLink."User ID" := UserId;
        //DocLink."Fetch To Sharepoint" := true;
        //DocLink."Uploaded To SharePoint" := false;
        //DocLink."SP URL Returned" := '';
        DocLink.Created := CreateDatetime(Today, Time);
        DocLink."Record ID" := TabID;
        DocLink.Insert(true);
        Message('Document Link Created Successfully');

    end;
}

