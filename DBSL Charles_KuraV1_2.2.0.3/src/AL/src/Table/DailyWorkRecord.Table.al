#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72238 "Daily Work Record"
{
    // DrillDownPageID = "Daily Work Record Labours";
    // LookupPageID = "Daily Work Record Labours";

    fields
    {
        field(1; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3; "Work Execution Programme ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Mobilization Header"."Document No." where("Document Type" = filter("Work Execution Programme"),
                                                                                    Status = filter(Released));

            trigger OnValidate()
            begin
                ProjectMobilizationHeader.Reset;
                ProjectMobilizationHeader.SetRange(ProjectMobilizationHeader."Document No.", "Work Execution Programme ID");
                if ProjectMobilizationHeader.FindSet then begin
                    "Project ID" := ProjectMobilizationHeader."Project ID";
                    Validate("Project ID");
                end;
            end;
        }
        field(4; "Project ID"; Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";// where (Status=filter("Completed/Under DLP"));

            trigger OnValidate()
            begin
                ObjJob.Reset;
                ObjJob.SetRange(ObjJob."No.", "Project ID");
                if ObjJob.FindSet then begin
                    "Road Code" := ObjJob."Road Code";
                    Description := 'Daily Work Record' + ' - ' + "Project ID";
                    "Purchase Contract ID" := ObjJob."Purchase Contract ID";
                    "Contractor No." := ObjJob."Contractor No.";
                    "Contractor Name" := ObjJob."Contractor Name";
                    "Road Section No." := ObjJob."Road Section No";
                    "Region ID" := ObjJob."Region ID";
                    "Directorate ID" := ObjJob."Directorate Code";
                    "Works Start Chainage" := ObjJob."Section Start Chainage(Km)";
                    "Works End Chainage" := ObjJob."Section End Chainage(KM)";
                    "Department ID" := ObjJob."Department ID"
                end;
            end;
        }
        field(5; Description; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Working Start Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Working End Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Works Start Chainage"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Works End Chainage"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "No. of Casual Staff"; Integer)
        {
            CalcFormula = sum("Daily Work Record Labor"."Total No. of Staff" where("Document No." = field("Document No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(11; "Average Temperature"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Rainfall (mm)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Other Weather Condition"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Purchase Contract ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Header"."No." where("Document Type" = filter("Blanket Order"));
        }
        field(15; "Contractor No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";

            trigger OnValidate()
            begin
                if ObjVendor.Get("Contractor No.") then
                    "Contractor Name" := ObjVendor.Name;
            end;
        }
        field(16; "Contractor Name"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Road Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Inventory"."Road Code" where(Blocked = filter(false));
        }
        field(18; "Road Section No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Section"."Road Section No." where("Road Code" = field("Road Code"),
                                                                         Blocked = filter(false));
        }
        field(19; "Region ID"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Region));
        }
        field(20; "Directorate ID"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Directorate));
        }
        field(21; "Department ID"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter("Department/Center"));
        }
        field(22; Status; Option)
        {
            DataClassification = ToBeClassified;
            Editable = true;
            OptionCaption = ' ,Open,Pending Approval,Released';
            OptionMembers = " ",Open,"Pending Approval",Released;
        }
        field(23; "Created By"; Code[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(24; "Created Date/Time"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(25; Posted; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(26; "No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Dimension Set ID"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(28; "Shortcut Dimension 1 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = filter(1));
        }
        field(29; "Shortcut Dimension 2 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = filter(1));
        }
        field(30; "Acknowledgement Status"; Option)
        {
            DataClassification = ToBeClassified;
            InitValue = Pending;
            OptionCaption = ' ,Pending,Acknowledged';
            OptionMembers = " ",Pending,Acknowledged;
        }
        field(31; "Acknowledgement DateTime"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(32; "Acknowledged By"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(33; "Representative ID"; Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Contract Signatory"."Entry No" where("Document Type" = filter("Blanket Order"),
                                                                                "Signatory Type" = filter("Vendor Authorizer" | "Vendor Witness"),
                                                                                No = field("Purchase Contract ID"));

            trigger OnValidate()
            begin
                PurchaseContractSignatory.Reset;
                PurchaseContractSignatory.SetRange(PurchaseContractSignatory."Entry No", "Representative ID");
                if PurchaseContractSignatory.FindSet then begin
                    "Representative Name" := PurchaseContractSignatory."Representative Name";
                    "Contract Signing Role" := PurchaseContractSignatory."Contract Signing Role";
                    Email := PurchaseContractSignatory.Email;
                    "Acknowledged By" := "Representative Name";
                end;
            end;
        }
        field(34; "Representative Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(35; "Contract Signing Role"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(36; Email; Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        "Document Date" := Today;
        Status := Status::Open;
        "Created By" := UserId;
        "Created Date/Time" := CreateDatetime(Today, Time);
        if "Document No." = '' then begin
            RoadManagementSetup.Get();
            RoadManagementSetup.TestField("Daily Work Record Nos");
            NoSeriesManagement.InitSeries(RoadManagementSetup."Daily Work Record Nos", xRec."No. Series", Today, "Document No.", "No. Series");
        end;
    end;

    var
        NoSeriesManagement: Codeunit NoSeriesManagement;
        RoadManagementSetup: Record "Road Management Setup";
        ProjectMobilizationHeader: Record "Project Mobilization Header";
        ObjJob: Record Job;
        ObjVendor: Record Vendor;
        DimMgt: Codeunit DimensionManagement;
        DailyWorkRecordExecution: Record "Daily Work Record Execution";
        Text051: label 'You may have changed a dimension.\\Do you want to update the lines?';
        PurchaseContractSignatory: Record "Purchase Contract Signatory";

    procedure ShowDocDim()
    var
        OldDimSetID: Integer;
    begin
        // OldDimSetID := "Dimension Set ID";
        // "Dimension Set ID" :=
        //   DimMgt.EditDimensionSet2(
        //     "Dimension Set ID",StrSubstNo('%1 %2','',"Document No."),
        //     "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");

        // if OldDimSetID <> "Dimension Set ID" then begin
        //   Modify;
        //   if DWRLinesExist then
        //     UpdateAllLineDim("Dimension Set ID",OldDimSetID);
        // end;
    end;

    procedure DWRLinesExist(): Boolean
    begin
        DailyWorkRecordExecution.Reset;
        DailyWorkRecordExecution.SetRange(DailyWorkRecordExecution."Document No.", "Document No.");
        exit(not DailyWorkRecordExecution.IsEmpty);
    end;

    procedure UpdateAllLineDim(NewParentDimSetID: Integer; OldParentDimSetID: Integer)
    var
        ConfirmManagement: Codeunit "Confirm Management";
        NewDimSetID: Integer;
        ReceivedShippedItemLineDimChangeConfirmed: Boolean;
    begin
        // Update all lines with changed dimensions.

        // if NewParentDimSetID = OldParentDimSetID then
        //     exit;
        // // if not ConfirmManagement.ConfirmProcess(Text051,true) then
        // //   exit;

        // DailyWorkRecordExecution.Reset;
        // DailyWorkRecordExecution.SetRange(DailyWorkRecordExecution."Document No.", "Document No.");
        // DailyWorkRecordExecution.LockTable;
        // if DailyWorkRecordExecution.Find('-') then
        //     repeat
        //         NewDimSetID := DimMgt.GetDeltaDimSetID(DailyWorkRecordExecution."Dimension Set ID", NewParentDimSetID, OldParentDimSetID);
        //         if DailyWorkRecordExecution."Dimension Set ID" <> NewDimSetID then begin
        //             DailyWorkRecordExecution."Dimension Set ID" := NewDimSetID;

        //             DimMgt.UpdateGlobalDimFromDimSetID(
        //          DailyWorkRecordExecution."Dimension Set ID", DailyWorkRecordExecution."Shortcut Dimension 1 Code", DailyWorkRecordExecution."Shortcut Dimension 2 Code");
        //             DailyWorkRecordExecution.Modify;
        //         end;
        //     until DailyWorkRecordExecution.Next = 0;
    end;
}

