#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 70141 "IFS Tender Committee"
{
    DrillDownPageID = "IFS Tender Committee";
    LookupPageID = "IFS Tender Committee";

    fields
    {
        field(1; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Linked to E-Procurement No. Series (Procurement Standing Committee No. Series field)';

            trigger OnValidate()
            begin
                if "Document No." <> '' then begin

                    ProcurementSetup.TestField("IFS Tender Committee No.");
                    NoMgt.TestManual(ProcurementSetup."IFS Tender Committee No.");
                    "No. Series" := ''
                end;
            end;
        }
        field(2; "Committee Type"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Committee Types"."Committee Type";

            trigger OnValidate()
            begin
                ProcCommType.Reset;
                ProcCommType.SetRange("Committee Type", ProcCommType."Committee Type");
                if ProcCommType.FindSet then begin
                    ProcCommType.CalcFields("Min. No. of Members");
                    Description := ProcCommType.Description;
                    "Min Required No. of Members" := ProcCommType."Min. No. of Members";
                end;
            end;
        }
        field(3; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Appointment Effective Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Appointing Authority"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation ="Company Positions"."Position ID";
        }
        field(6; "Tender Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Approval Status";Enum "App Status")
        {
            Editable =false;
            DataClassification = ToBeClassified;
            // OptionCaption = 'Open,Pending Approval,Released';
            // OptionMembers = Open,"Pending Approval",Released;
        }
        field(8; "Primary Region"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Region));
        }
        field(9; "Primary Directorate"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(10; "Primary Department"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const("Department/Center"),
                                                                "Direct Reports To" = field("Primary Directorate"));
        }
        field(11; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "No. Series"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Created By"; Code[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(14; "Created Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(15; "Created Time"; Time)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16; "IFS Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Document Type" = filter(IFS)) "Standard Purchase Code".Code where(Published = const(true),
                                                                                                  Status = const(Released));
            // "Requesting Region" = field("Primary Region"));

            trigger OnValidate()
            begin
                ifs.Reset;
                ifs.SetRange(ifs.Code, "IFS Code");
                if ifs.FindSet then begin
                    ProcCommType.Reset;
                    ProcCommType.SetRange("Committee Type", "Committee Type");
                    if ProcCommType.FindSet then begin
                        Description := "IFS Code" + '_' + ProcCommType.Description;

                    end;
                    "Document Date" := Today;
                    "External Document No" := ifs.Code;
                    "Appointment Effective Date" := Today;
                    "Tender Name" := ifs."Tender Name";
                    CompanyInfo.Get;
                    "Appointing Authority" := CompanyInfo."Headed By";
                end;

                if "IFS Code" <> '' then begin
                    IFSTenderEntry.Reset;
                    IFSTenderEntry.SetRange("Document No.", "Document No.");
                    IFSTenderEntry.SetRange("IFS Code", "IFS Code");
                    if not IFSTenderEntry.FindSet then begin
                        IFSTenderEntry.Init;
                        IFSTenderEntry.Validate("Document No.", "Document No.");
                        IFSTenderEntry.Validate("IFS Code", "IFS Code");
                        IFSTenderEntry.Insert(true);
                    end;
                end;
            end;
        }
        field(17; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Document Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Active,Cancelled,Submitted';
            OptionMembers = Active,Cancelled,Submitted;
        }
        field(19; "Contract No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Header"."No." where("Document Type" = const("Blanket Order"));
            trigger OnValidate()
            var
                Jobs: Record Job;
            begin
                Jobs.Reset();
                Jobs.SetRange("Project Funding Contract No", Rec."Contract No.");
                if Jobs.FindFirst() then
                    Rec.Validate("Project ID", Jobs."No.");
            end;
        }
        field(20; "External Document No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Raised By"; Code[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(22; Name; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(23; "Staff Id"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(24; Designation; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Min Required No. of Members"; Decimal)
        {
            Description = 'Minimum Required No. of Members';
            Editable = false;
        }
        field(26; "Actual No. of Committee Memb"; Integer)
        {
            CalcFormula = count("IFS Tender Committee Member" where("Document No." = field("Document No.")));
            Caption = 'Actual No. of Committee Members';
            FieldClass = FlowField;
        }
        field(27; Duration; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(28; Location; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(29; "Imprest Created"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(30; "Memo No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(31; "Road Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Inventory";
        }
        field(32; "Road Section No."; Text[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Section"."Road Section No.";
        }
        field(33; "Measurement Sheets"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Inspection & Payment Header";
        }
        field(34; Inspection; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(35; Type; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Individual,Clustered';
            OptionMembers = Individual,Clustered;
        }
        field(36; "Previous Appointed Committee"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "IFS Tender Committee"."Document No." where("Approval Status" = const(Approved),
                                                                         "Committee Type" = field("Committee Type"));

            trigger OnValidate()
            begin
                IFSTenderCommitte.Reset;
                IFSTenderCommitte.SetRange("Document No.", "Previous Appointed Committee");
                if IFSTenderCommitte.FindSet then begin
                    Validate("IFS Code", IFSTenderCommitte."IFS Code");

                end;
            end;
        }
        field(37; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,IFP,IFS,Order,Contract';
            OptionMembers = " ",IFP,IFS,"Order",Contract;
        }
        field(38; "Opening Time"; Time)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(39; "IFP Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Request For Information".Code where(Type = const("Sub IFP"),
                                                                  "Responsibility Centre" = field("Primary Region"),
                                                                  Status = const(Released));

            trigger OnValidate()
            begin
                RequestForInformation.Reset;
                RequestForInformation.SetRange(Code, "IFP Code");
                if RequestForInformation.FindSet then
                    Description := RequestForInformation.Description;
            end;
        }
        field(40; "Reference Number"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(41; "Project ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";

            trigger OnValidate()
            begin
                Job.Reset;
                Job.SetRange(Job."No.", "Project ID");
                if Job.FindSet then begin
                    "Project Name" := Job.Description;
                    //Description := 'CIT Committee appointment for project '+ Rec."Project ID";
                    "Contract No." := Job."Purchase Contract ID";
                    Validate("Contract No.");
                end;

                ProcurementCommitteeTypes.Reset;
                ProcurementCommitteeTypes.SetRange(ProcurementCommitteeTypes."Committee Type", "Committee Type");
                if ProcurementCommitteeTypes.FindSet then begin
                    Description := ProcurementCommitteeTypes.Description + ' for ' + "Project Name";
                end;
            end;
        }
        field(42; "Project Name"; Text[500])
        {
            DataClassification = ToBeClassified;
        }
        field(43; "Inspection Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(44; "Inspection Venue"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(45; "Application Area"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Sourcing,Inspection';
            OptionMembers = " ",Sourcing,Inspection;
        }
        field(46; "Dimension Set ID"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(47; "Shortcut Dimension 1 Code"; Code[40])
        {
            CaptionClass = '1,2,1';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = filter(1));
        }
        field(48; "Shortcut Dimension 2 Code"; Code[40])
        {
            CaptionClass = '1,2,2';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = filter(2));
        }
        field(49; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            TableRelation = "Responsibility Center";
        }
    }

    keys
    {
        key(Key1; "Document No.", "Committee Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Document No.", "Committee Type", Description)
        {
        }
        fieldgroup(Brick; "Document No.", "Committee Type", Description)
        {
        }
    }

    trigger OnInsert()
    var
    Docno: Text[30];
        Text01: Text[30];
        Text02: Text[30];
        Committee: Record "IFS Tender Committee";
    begin
        if "Document No." = '' then begin
            ProcurementSetup.Get;
            ProcurementSetup.TestField("IFS Tender Committee No.");
            NoMgt.InitSeries(ProcurementSetup."IFS Tender Committee No.", xRec."No. Series", 0D, "Document No.", "No. Series");
        end;

        "Created By" := UserId;
        "Created Date" := Today;
        "Created Time" := Time;
        UserSetup.Reset;
        UserSetup.SetRange("User ID", UserId);
        if UserSetup.FindFirst() then begin
            "Raised By" := UserId;
            Name := UserSetup."Employee Name";
            "Staff Id" := UserSetup."Employee No.";
            "Primary Region" := UserSetup."Region Code";
            "Responsibility Center" := UserSetup."Responsibility Center";
            Emp.Reset;
            Emp.SetRange("No.", UserSetup."Employee No.");
            if Emp.FindSet then
                "Primary Department" := Emp."Department Code";
            "Primary Directorate" := Emp."Directorate Code";
            //Emp.CalcFields("Job Title");
            Designation := Emp."Job Title";

        end;
        Committee.Reset();
        Committee.SetRange("Responsibility Center", "Responsibility Center");
       // Committee.SetRange("Procurement Method", "Procurement Method");
        if Committee.FindLast() then begin
            Text02 := IncStr(Committee."Reference Number");
            Docno := 'KURA/COMM/' + "Responsibility Center" + '/' + Text01 + '/001';
            if CopyStr(Text02, 1, 17) <> CopyStr(Docno, 1, 17) then
                Text02 := Docno;
            if CopyStr(Text02, 1, 17) <> CopyStr(Committee."Reference Number" , 1, 17) then
                Text02 := 'KURA/COMM/' + "Responsibility Center" + '/' + Text01 + '/001';
        end else begin
            Text02 := 'KURA/COMM/' + "Responsibility Center" + '/' + Text01 + '/001';
        end;
        "Reference Number" := Text02;
    end;

    var
        ProcurementSetup: Record "Procurement Setup";
        NoMgt: Codeunit NoSeriesManagement;
        Emp: Record Employee;
        UserSetup: Record "User Setup";
        ProcCommType: Record "Procurement Committee Types";
        ifs: Record "Standard Purchase Code";
        CompanyInfo: Record "Company Information";
        IFSTenderEntry: Record "IFS Tender Committe Entry";
        IFSTenderCommitte: Record "IFS Tender Committee";
        RequestForInformation: Record "Request For Information";
        Job: Record Job;
        ProcurementCommitteeTypes: Record "Procurement Committee Types";
        DimMgt: Codeunit DimensionManagement;
        Text051: label 'You may have changed a dimension.\\Do you want to update the lines?';
        Text052: label 'The %1 field on the purchase order %2 must be the same as on sales order %3.';
        IFSTenderCommitteeMember: Record "IFS Tender Committee Member";

    procedure ShowDocDim()
    var
        OldDimSetID: Integer;
    begin
        OldDimSetID := "Dimension Set ID";
        //"Dimension Set ID" :=
        // DimMgt.EditDimensionSet2(
        //  "Dimension Set ID ",StrSubstNo('%1 %2 "Document Type", ","Document No."),
        //  "Shortcut Dimension 1 Code ","Shortcut Dimension 2 Code");

        if OldDimSetID <> "Dimension Set ID" then begin
            Modify;
            if PurchLinesExist then
                UpdateAllLineDim("Dimension Set ID", OldDimSetID);
        end;
    end;

    procedure UpdateAllLineDim(NewParentDimSetID: Integer; OldParentDimSetID: Integer)
    var
        ConfirmManagement: Codeunit "Confirm Management";
        NewDimSetID: Integer;
        ReceivedShippedItemLineDimChangeConfirmed: Boolean;
    begin
        // Update all lines with changed dimensions.

        //     if NewParentDimSetID = OldParentDimSetID then
        //         exit;
        //    // if not ConfirmManagement.ConfirmProcess(Text05 1,true) then
        //     //    exit;

        //    // IFSTenderCommitteeMember.Reset;
        //     //IFSTenderCommitteeMember.SETRANGE("Document Type","Document Type");
        //     IFSTenderCommitteeMember.SetRange("Document No.", "Document No.");
        //     IFSTenderCommitteeMember.LockTable;
        //     if IFSTenderCommitteeMember.Find('-') then
        //         repeat
        //             NewDimSetID := DimMgt.GetDeltaDimSetID(IFSTenderCommitteeMember."Dimension Set ID", NewParentDimSetID, OldParentDimSetID);
        //             if IFSTenderCommitteeMember."Dimension Set ID" <> NewDimSetID then begin
        //                 IFSTenderCommitteeMember."Dimension Set ID" := NewDimSetID;


        //                 DimMgt.UpdateGlobalDimFromDimSetID(
        //                   IFSTenderCommitteeMember."Dimension Set ID", IFSTenderCommitteeMember."Shortcut Dimension 1 Code", IFSTenderCommitteeMember."Shortcut Dimension 2 Code");
        //                 IFSTenderCommitteeMember.Modify;
        //             end;
        //         until IFSTenderCommitteeMember.Next = 0;

    end;

    procedure PurchLinesExist(): Boolean
    begin
        IFSTenderCommitteeMember.Reset;
        //IFSTenderCommitteeMember.SETRANGE("Document Type","Document Type");
        IFSTenderCommitteeMember.SetRange("Document No.", "Document No.");
        exit(not IFSTenderCommitteeMember.IsEmpty);
    end;
}

