#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72331 "Project Evaluation Header"
{

    fields
    {
        field(1; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Evaluation Report,Professional Opinion,Notice of Award';
            OptionMembers = "Evaluation Report","Professional Opinion","Notice of Award";
        }
        field(2; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4; "Project ID"; Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No." where(Status = filter("Completed/Under DLP"));

            trigger OnValidate()
            begin
                Description := Format("Document Type") + ' - ' + "Project ID";

                ObjJob.Reset;
                ObjJob.SetRange(ObjJob."No.", "Project ID");
                if ObjJob.FindSet then begin
                    "Project Name" := ObjJob.Description;
                    "Road Code" := ObjJob."Road Code";
                    "Road Section No." := ObjJob."Road Section No";
                    "Region ID" := ObjJob."Region ID";
                    "Directorate ID" := ObjJob."Directorate Code";
                    "Department ID" := ObjJob."Directorate Code";
                    "Purchase Contract ID" := ObjJob."Purchase Contract ID";
                    Validate("Purchase Contract ID");
                    "External Contract Reference" := ObjJob."IFS Code";
                    "Contractor No." := ObjJob."Contractor No.";
                    "Contractor Name" := ObjJob."Contractor Name";
                    "Original Project Starting Date" := ObjJob."Starting Date";
                    "Original Project Ending Date" := ObjJob."Ending Date";
                    "Award Tender Sum Inc Taxes" := ObjJob."Tender Sum Inc Taxes (LCY)";
                    "Total Project Cost Excl. VAT" := ObjJob."Total Project Cost Excl. VAT";
                    "Total Project Cost Incl. VAT" := ObjJob."Total Project Cost Incl. VAT";
                    "Variation of Price Amount" := ObjJob."Variation of Price Amount";
                    "Contingency Amount" := ObjJob."Contingency Amount";

                    "Variation Order No" := ObjJob."Last Variation Request No." + 1;
                end;

                InternalProjectResource.Reset;
                InternalProjectResource.SetRange(InternalProjectResource."Project ID", "Project ID");
                InternalProjectResource.SetRange(InternalProjectResource."Project Manager", true);
                if InternalProjectResource.FindSet then begin
                    "Project Manager" := InternalProjectResource."User ID";
                    "Project Engineer No." := InternalProjectResource."Resource No.";
                end
                else
                    if not InternalProjectResource.FindSet then begin
                        Error('No resource attached to %1', "Project ID");
                    end;

                JobPlanningLine.Reset;
                JobPlanningLine.SetRange(JobPlanningLine."Job No.", "Project ID");
                if JobPlanningLine.FindSet then
                    repeat
                        ProjectVariationLine.Init;
                        ProjectVariationLine."Document No." := "Document No.";
                        ProjectVariationLine."Document Type" := "Document Type";
                        ProjectVariationLine."Job No." := "Project ID";
                        ProjectVariationLine."Job Task No." := JobPlanningLine."Job Task No.";
                        ProjectVariationLine."Line No." := JobPlanningLine."Line No.";
                        ProjectVariationLine.Validate("Line No.");
                        ProjectVariationLine.Type := JobPlanningLine.Type;
                        ProjectVariationLine."No." := JobPlanningLine."No.";
                        ProjectVariationLine.Description := JobPlanningLine.Description;
                        if not ProjectVariationLine.Insert(true) then
                            ProjectVariationLine.Modify(true);
                    until JobPlanningLine.Next = 0;
            end;
        }
        field(5; Description; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Extension Reason Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Extension Reason Code".Code where(Blocked = filter(false));

            trigger OnValidate()
            begin
                ExtensionReasonCode.Reset;
                ExtensionReasonCode.SetRange(ExtensionReasonCode.Code, "Extension Reason Code");
                if ExtensionReasonCode.FindSet then begin
                    "Executive Summary" := ExtensionReasonCode.Description;
                end;
            end;
        }
        field(7; "Variation Reason Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Variation Reason Code".Code;

            trigger OnValidate()
            begin
                VariationReasonCode.Reset;
                VariationReasonCode.SetRange(VariationReasonCode.Code, "Variation Reason Code");
                if VariationReasonCode.FindSet then begin
                    "Executive Summary" := VariationReasonCode.Description;
                end;
            end;
        }
        field(8; "Executive Summary"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Original Value of Work (LCY)"; Decimal)
        {
            CalcFormula = sum("Project Evaluation Lines"."Original Total Cost (LCY)" where("Document Type" = field("Document Type"),
                                                                                            "Document No." = field("Document No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(10; "New Varied Works Value (LCY)"; Decimal)
        {
            CalcFormula = sum("Project Evaluation Lines"."New Total Cost (LCY)" where("Document Type" = field("Document Type"),
                                                                                       "Document No." = field("Document No.")));
            Editable = false;
            FieldClass = FlowField;

            trigger OnValidate()
            begin
                CalcFields("New Varied Works Value (LCY)", "Original Value of Work (LCY)");
                "Variation Percentage(%)" := ROUND("New Varied Works Value (LCY)" / "Original Value of Work (LCY)" * 100, 0.01, '>');
            end;
        }
        field(11; "Net Change Value of Work (LCY)"; Decimal)
        {
            CalcFormula = sum("Project Evaluation Lines"."Net Change (Total Cost LCY)" where("Document Type" = field("Document Type"),
                                                                                              "Document No." = field("Document No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(12; "Project Name"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Road Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Inventory"."Road Code" where(Blocked = filter(false));
        }
        field(14; "Road Section No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Section"."Road Section No." where("Road Code" = field("Road Code"),
                                                                     Blocked = filter(false));
        }
        field(15; "Region ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Region),
                                                                Blocked = filter(false));
        }
        field(16; "Directorate ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Directorate),
                                                                Blocked = filter(false));
        }
        field(17; "Department ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter("Department/Center"),
                                                                Blocked = filter(false));
        }
        field(18; "Purchase Contract ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Header"."No." where("Document Type" = filter("Blanket Order"));

            trigger OnValidate()
            begin
                PurchaseHeader.Reset;
                PurchaseHeader.SetRange(PurchaseHeader."No.", "Purchase Contract ID");
                if PurchaseHeader.FindSet then begin
                    "External Contract Reference" := PurchaseHeader."Your Reference";
                    "Contractor No." := PurchaseHeader."Contract No.";
                    "Contractor Name" := PurchaseHeader."Contract Name";
                    "Award Tender Sum Inc Taxes" := PurchaseHeader."Read-out Bid Price (A)";
                end;

                PurchaseContractSignatory.Reset;
                PurchaseContractSignatory.SetRange(PurchaseContractSignatory.No, "Purchase Contract ID");
                if PurchaseContractSignatory.FindSet then begin
                    "Contractor Representative" := PurchaseContractSignatory."Representative Name";
                    "Contractor Rep Email" := PurchaseContractSignatory.Email;
                end;
            end;
        }
        field(19; "External Contract Reference"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(20; "Contractor No."; Code[20])
        {
            Caption = 'Contracting Vendor No.';
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";

            trigger OnValidate()
            begin
                if Vendor.Get("Contractor No.") then
                    "Contractor Name" := Vendor.Name;
            end;
        }
        field(21; "Contractor Name"; Text[500])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(22; "Contractor Representative"; Text[500])
        {
            Caption = 'Primary Contractor Representative';
            DataClassification = ToBeClassified;
        }
        field(23; "Contractor Rep Email"; Text[100])
        {
            Caption = 'Contractor Representative Email';
            DataClassification = ToBeClassified;
            ExtendedDatatype = EMail;
        }
        field(24; "Award Tender Sum Inc Taxes"; Decimal)
        {
            Caption = 'Award Tender Sum Inc Taxes (LCY)';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(25; "Original Project Starting Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(26; "Original Project Ending Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;

            trigger OnValidate()
            begin
                "Extended Project End Date" := "Original Project Ending Date";
            end;
        }
        field(27; "Requested Extension Period"; DateFormula)
        {
            Caption = 'Requested Extension Period (Days)';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "Extended Project End Date" := CalcDate("Requested Extension Period", "Original Project Ending Date");
            end;
        }
        field(28; "Extended Project End Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(29; Status; Option)
        {
            DataClassification = ToBeClassified;
            Editable = true;
            OptionCaption = ' ,Open,Pending Approval,Released';
            OptionMembers = " ",Open,"Pending Approval",Released;

            trigger OnValidate()
            begin
                if "Document Type" = "document type"::"Evaluation Report" then begin
                    if Status = Status::Released then begin
                        // ProcurementProcessing.FnNotifyDirectorProfessionalOpinion(Rec);
                        ProcurementProcessing.FnSendProfessionalOpinionToProc(Rec);
                    end;
                end;

                if "Document Type" = "document type"::"Professional Opinion" then begin
                    if Status = Status::Released then begin
                        //ProcurementProcessing.FnSendProfessionalOpinionToProc(Rec);
                        //ProcurementProcessing.FnGenerateICM(Rec);
                    end;
                end;

                if "Document Type" = "document type"::"Professional Opinion" then begin
                    if Status = Status::Released then begin
                        //ProcurementProcessing.FnSendProfessionalOpinionToProc(Rec);
                        ProcurementProcessing.FnNotifyContractorProjectProfessionalOpinion(Rec);
                    end;
                end;
            end;
        }
        field(30; "Created By"; Code[200])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(31; "Created Date/Time"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(32; Posted; Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'Contractor Variation Req No.';
            Editable = false;
        }
        field(33; "Contractor Variation Req No."; Code[20])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                ProjectVariationHeader.Reset;
                //ProjectVariationHeader.SETRANGE(ProjectVariationHeader."Document Type",ProjectVariationHeader."Document Type"::"Contractor Variation Request");
                ProjectVariationHeader.SetRange(ProjectVariationHeader."Document No.", "Contractor Variation Req No.");
                if ProjectVariationHeader.FindSet then begin
                    "Project ID" := ProjectVariationHeader."Project ID";
                    Validate("Project ID");
                    Description := ProjectVariationHeader.Description;
                    "Variation Reason Code" := ProjectVariationHeader."Variation Reason Code";
                    "Executive Summary" := ProjectVariationHeader."Executive Summary";
                    "Project Name" := ProjectVariationHeader."Project Name";
                    "Road Code" := ProjectVariationHeader."Road Code";
                    "Road Section No." := ProjectVariationHeader."Road Section No.";
                    "Region ID" := ProjectVariationHeader."Region ID";
                    "Directorate ID" := ProjectVariationHeader."Directorate ID";
                    "Department ID" := ProjectVariationHeader."Department ID";
                    "Purchase Contract ID" := ProjectVariationHeader."Purchase Contract ID";
                    "Contractor No." := ProjectVariationHeader."Contractor No.";
                    Validate("Contractor No.");
                    "Contractor Name" := ProjectVariationHeader."Contractor Name";
                    "Contractor Representative" := ProjectVariationHeader."Contractor Representative";
                    "Contractor Rep Email" := ProjectVariationHeader."Contractor Rep Email";
                end;

                //Populate the Project Variation Line
                ObjProjectVariationLine.Reset;
                //ObjProjectVariationLine.SETRANGE(ObjProjectVariationLine."Document Type",ObjProjectVariationLine."Document Type"::"Contractor Variation Request");
                ObjProjectVariationLine.SetRange(ObjProjectVariationLine."Document No.", "Contractor Variation Req No.");
                if ObjProjectVariationLine.FindSet then
                    repeat
                        ProjectVariationLine.Init;
                        ProjectVariationLine.TransferFields(ObjProjectVariationLine);
                        ProjectVariationLine."Document Type" := "Document Type";
                        ProjectVariationLine."Document No." := "Document No.";
                        if not ProjectVariationLine.Insert(true) then
                            ProjectVariationLine.Modify(true);
                    until ObjProjectVariationLine.Next = 0;


                //Populate the Project variation section
                ObjProjectVariationSection.Reset;
                //ObjProjectVariationSection.SETRANGE(ObjProjectVariationSection."Document Type",ObjProjectVariationSection."Document Type"::"Contractor Variation Request");
                ObjProjectVariationSection.SetRange(ObjProjectVariationSection."Document No.", "Contractor Variation Req No.");
                if ObjProjectVariationSection.FindSet then
                    repeat
                        ProjectVariationSection.Init;
                        ProjectVariationSection.TransferFields(ObjProjectVariationSection);
                        ProjectVariationSection."Document Type" := "Document Type";
                        ProjectVariationSection."Document No." := "Document No.";
                        if not ProjectVariationSection.Insert(true) then
                            ProjectVariationSection.Modify(true);
                    until ObjProjectVariationSection.Next = 0;
            end;
        }
        field(34; "Value of Work Added"; Decimal)
        {
            CalcFormula = sum("Project Evaluation Lines"."Net Change (Total Cost LCY)" where("Document Type" = field("Document Type"),
                                                                                              "Document No." = field("Document No."),
                                                                                              "Net Change (Total Cost LCY)" = filter(> 0)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(35; "Value of Work Omitted"; Decimal)
        {
            CalcFormula = sum("Project Evaluation Lines"."Net Change (Total Cost LCY)" where("Document Type" = field("Document Type"),
                                                                                              "Document No." = field("Document No."),
                                                                                              "Net Change (Total Cost LCY)" = filter(< 0)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(36; "Project Engineer No."; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Internal Project Resource"."Resource No.";

            trigger OnValidate()
            begin
                InternalProjectResource.Reset;
                InternalProjectResource.SetRange(InternalProjectResource."Project ID", "Project ID");
                InternalProjectResource.SetRange(InternalProjectResource."Project Manager", true);
                InternalProjectResource.SetRange(InternalProjectResource."Resource No.", "Project Engineer No.");
                if InternalProjectResource.FindSet then begin
                    "Project Manager" := InternalProjectResource."User ID";
                    //"Project Engineer No.":=InternalProjectResource."Resource No.";
                end;
            end;
        }
        field(37; "Project Manager"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(38; "Review Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Approved,Declined';
            OptionMembers = " ",Approved,Declined;
        }
        field(39; "Review Rejection Notes"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(40; "Project Variation Order No."; Code[20])
        {
            CalcFormula = lookup("Project Variation Header"."Document No." where("Document Type" = filter("Project Variation Order"),
                                                                                  "Contractor Variation Req No." = field("Document No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(41; "No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(42; "Dimension Set ID"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(43; "Shortcut Dimension 1 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(44; "Shortcut Dimension 2 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(45; "Variation Percentage(%)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = '%ge of the contract sum';
            Editable = false;
        }
        field(46; "Total Project Cost Excl. VAT"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(47; "Total Project Cost Incl. VAT"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(48; "Contingency Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(49; "Variation of Price Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50; "Variation Order No"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(51; "Contract Sum Variation %"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(52; "Grounds For EOT Request"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(53; "Document Status"; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = 'Draft,Submitted,Rejected,Approved';
            OptionMembers = Draft,Submitted,Rejected,Approved;
        }
        field(54; "Evaluation Remarks"; Text[2000])
        {
            DataClassification = ToBeClassified;
        }
        field(55; "Professional Opinion"; Text[2000])
        {
            DataClassification = ToBeClassified;
        }
        field(56; "EOT No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(57; "DG Comments"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(58; "Approved Extension Period"; Decimal)
        {
            CalcFormula = sum("Project Evaluation Lines"."EOT Recommended Days" where("Document No." = field("Document No.")));
            FieldClass = FlowField;
        }
        field(59; "Revised Project End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(60; "Variation Request No"; Code[30])
        {
            DataClassification = ToBeClassified;
            Description = 'Contractor/Engineer Variation Request No';
        }
        field(61; "Cost Claim No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(62; "Variation Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,EOT,CVR,EVR,CC,SUB';
            OptionMembers = " ",EOT,CVR,EVR,CC,SUB;
        }
        field(63; "Acknowledged By"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(64; "Acknowledgement DateTime"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(65; "Acknowledgement Comments"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(66; "Cost Claim Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(67; "Approved Net Change(LCY)"; Decimal)
        {
            CalcFormula = sum("Project Evaluation Lines"."Approved Total Cost(LCY)" where("Document Type" = field("Document Type"),
                                                                                           "Document No." = field("Document No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(68; "Maximum Allowed Variation %"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(69; "Maximum Variation Of Works"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(70; "Main Contractor No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";

            trigger OnValidate()
            begin
                ObjVendor.Reset;
                ObjVendor.SetRange(ObjVendor."No.", "Main Contractor No.");
                if ObjVendor.FindSet then
                    "Main Contractor Name" := ObjVendor.Name;
            end;
        }
        field(71; "Main Contractor Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(72; "Subcontractor No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";

            trigger OnValidate()
            begin
                ObjVendor.Reset;
                ObjVendor.SetRange(ObjVendor."No.", "Subcontractor No");
                if ObjVendor.FindSet then
                    "Subcontractor Name" := ObjVendor.Name;
                if "Subcontractor No" = "Main Contractor No." then
                    Error('Please choose a different contractor');
            end;
        }
        field(73; "Subcontractor Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = true;
        }
        field(74; "Date Subcontracted"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(75; "Request Justification"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        Status := Status::Open;
        "Document Date" := Today;
        "Created By" := UserId;
        "Created Date/Time" := CreateDatetime(Today, Time);

        if "Document No." = '' then begin
            RoadManagementSetup.Get();
            case "Document Type" of
                "document type"::"Evaluation Report":
                    begin
                        RoadManagementSetup.TestField("Project Evaluation Report Nos");
                        NoSeriesManagement.InitSeries(RoadManagementSetup."Project Evaluation Report Nos", xRec."No. Series", Today, "Document No.", "No. Series");
                    end;

                "document type"::"Notice of Award":
                    begin
                        RoadManagementSetup.TestField("Contractor Variation Req Nos");
                        NoSeriesManagement.InitSeries(RoadManagementSetup."Contractor Variation Req Nos", xRec."No. Series", Today, "Document No.", "No. Series");
                    end;

                "document type"::"Professional Opinion":
                    begin
                        RoadManagementSetup.TestField("Project Opinion Nos");
                        NoSeriesManagement.InitSeries(RoadManagementSetup."Project Opinion Nos", xRec."No. Series", Today, "Document No.", "No. Series");
                    end;
            //    "Document Type"::"4":
            //      BEGIN
            //         RoadManagementSetup.TESTFIELD("Budget Reallocation Nos");
            //         NoSeriesManagement.InitSeries(RoadManagementSetup."Budget Reallocation Nos",xRec."No. Series",TODAY,"Document No.","No. Series");
            //        END;
            //
            //    "Document Type"::"5":
            //      BEGIN
            //         RoadManagementSetup.TESTFIELD("Engineer Variation Request Nos");
            //         NoSeriesManagement.InitSeries(RoadManagementSetup."Engineer Variation Request Nos",xRec."No. Series",TODAY,"Document No.","No. Series");
            //        END;
            end;
        end;
    end;

    var
        ProjectVariationHeader: Record "Project Variation Header";
        ProjectVariationLine: Record "Project Variation Line";
        ProjectVariationSection: Record "Project Variation Section";
        ObjProjectVariationLine: Record "Project Variation Line";
        ObjProjectVariationSection: Record "Project Variation Section";
        ObjJob: Record Job;
        PurchaseHeader: Record "Purchase Header";
        PurchaseContractSignatory: Record "Purchase Contract Signatory";
        Vendor: Record Vendor;
        RoadManagementSetup: Record "Road Management Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        DimMgt: Codeunit DimensionManagement;
        Text051: label 'You may have changed a dimension.\\Do you want to update the lines?';
        Text052: label 'The %1 field on the purchase order %2 must be the same as on sales order %3.';
        ExtensionofTimeLine: Record "Extension of Time Line";
        ExtensionReasonCode: Record "Extension Reason Code";
        VariationReasonCode: Record "Variation Reason Code";
        InternalProjectResource: Record "Internal Project Resource";
        JobPlanningLine: Record "Job Planning Line";
        ResponsibilityCenter: Record "Responsibility Center";
        ProcurementProcessing: Codeunit "Procurement Processing";
        ObjVendor: Record Vendor;

    procedure ShowDocDim()
    var
        OldDimSetID: Integer;
    begin
        // OldDimSetID := "Dimension Set ID";
        // "Dimension Set ID" :=
        //   DimMgt.EditDimensionSet2(
        //     "Dimension Set ID",StrSubstNo('%1 %2',"Document Type","Document No."),
        //     "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");

        // if OldDimSetID <> "Dimension Set ID" then begin
        //   Modify;
        //   if PurchLinesExist then
        //     UpdateAllLineDim("Dimension Set ID",OldDimSetID);
        // end;
    end;

    procedure UpdateAllLineDim(NewParentDimSetID: Integer; OldParentDimSetID: Integer)
    var
        ConfirmManagement: Codeunit "Confirm Management";
        NewDimSetID: Integer;
        ReceivedShippedItemLineDimChangeConfirmed: Boolean;
    begin
        // Update all lines with changed dimensions.

        // if NewParentDimSetID = OldParentDimSetID then
        //   exit;
        // if not ConfirmManagement.ConfirmProcess(Text051,true) then
        //   exit;

        // ExtensionofTimeLine.Reset;
        // ExtensionofTimeLine.SetRange("Document Type","Document Type");
        // ExtensionofTimeLine.SetRange("Document No.","Document No.");
        // ExtensionofTimeLine.LockTable;
        // if ExtensionofTimeLine.Find('-') then
        //   repeat
        //     NewDimSetID := DimMgt.GetDeltaDimSetID(ExtensionofTimeLine."Dimension Set ID",NewParentDimSetID,OldParentDimSetID);
        //     if ExtensionofTimeLine."Dimension Set ID" <> NewDimSetID then begin
        //       ExtensionofTimeLine."Dimension Set ID" := NewDimSetID;


        //       DimMgt.UpdateGlobalDimFromDimSetID(
        //         ExtensionofTimeLine."Dimension Set ID",ExtensionofTimeLine."Shortcut Dimension 1 Code",ExtensionofTimeLine."Shortcut Dimension 2 Code");
        //       ExtensionofTimeLine.Modify;
        //     end;
        //   until ExtensionofTimeLine.Next = 0;
    end;

    procedure PurchLinesExist(): Boolean
    begin
        ExtensionofTimeLine.Reset;
        ExtensionofTimeLine.SetRange("Document Type", "Document Type");
        ExtensionofTimeLine.SetRange("Document No.", "Document No.");
        exit(not ExtensionofTimeLine.IsEmpty);
    end;
}

