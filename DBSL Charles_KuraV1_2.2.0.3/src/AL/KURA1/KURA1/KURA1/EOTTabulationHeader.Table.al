#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72326 "EOT Tabulation Header"
{

    fields
    {
        field(1;"Code";Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;

            trigger OnValidate()
            begin
                if Code<>'' then
                  begin
                    if "Document Type"="document type"::" " then begin
                    ProcurementSetup.TestField("Final Evaluation Report Nos");
                    NoMgt.TestManual(ProcurementSetup."Final Evaluation Report Nos");
                    end;
                     if "Document Type"="document type"::"Evaluation Report" then begin
                    ProcurementSetup.TestField("Proffesional Opinion Nos");
                    NoMgt.TestManual(ProcurementSetup."Proffesional Opinion Nos");
                    end;
                     if "Document Type"="document type"::"Professional Opinion" then begin
                    ProcurementSetup.TestField("Notice of Award");
                    NoMgt.TestManual(ProcurementSetup."Notice of Award");
                    end;
                     "No. Series":=''
                end;
            end;
        }
        field(2;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = ' ,Evaluation Report,Professional Opinion,Notice of Award';
            OptionMembers = " ","Evaluation Report","Professional Opinion","Notice of Award";
        }
        field(3;"IFS Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Standard Purchase Code".Code;
        }
        field(4;"Document Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Final Evaluation Report ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bid Tabulation Header".Code where ("Document Type"=const("Evaluation Report"));

            trigger OnValidate()
            begin
                //Procurement.SuggestProffesionOpinion(Rec);
            end;
        }
        field(6;Description;Text[440])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Tender Name";Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8;"Raised By";Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9;Name;Text[80])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10;"Tender Committee Role";Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = ' ,Member,Chairperson,Secretary,Consultant';
            OptionMembers = " ",Member,Chairperson,Secretary,Consultant;
        }
        field(11;"Designation/Title";Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12;"Annual Procurement Plan ID";Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = true;
        }
        field(13;"Procurement Plan Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Financial Year Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Budget Name".Name;
        }
        field(15;"Procurement Plan Line No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Procurement Plan Entry No";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(17;"Available Procurement Budget";Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Available Procurement Budget (LCY)';
        }
        field(18;"Budget Narration";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(19;"Bid Opening Date";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(20;"Evaluation Completion Date";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(21;"Appointed Bid Opening Comm";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Appointed Bid Opening Committee';
            Editable = false;

            trigger OnValidate()
            begin
                BidCommitte.Reset;
                BidCommitte.SetRange("Appointed Bid Opening Com","Appointed Bid Opening Comm");
                BidCommitte.SetRange(Type,BidCommitte.Type::"Bid Opening");
                BidCommitte.SetRange("Document No.",Code);
                if BidCommitte.FindSet then begin
                  BidCommitte.DeleteAll;
                end;
                
                
                IFSTenderCommitte.Reset;
                IFSTenderCommitte.SetRange("Document No.","Appointed Bid Opening Comm");
                if IFSTenderCommitte.FindSet then begin
                repeat
                
                BidCommitte.Init;
                BidCommitte."Document No.":=Code;
                BidCommitte."Line No":=IFSTenderCommitte."Line No";
                BidCommitte."Appointed Bid Opening Com":="Appointed Bid Opening Comm";
                BidCommitte."Role Type":=IFSTenderCommitte.Role;
                BidCommitte.Type:=BidCommitte.Type::"Bid Opening";
                BidCommitte."Member No.":=IFSTenderCommitte."Member No.";
                BidCommitte."Member Name":=IFSTenderCommitte."Member Name";
                /*IF BidCommitte."Role Type"=BidCommitte."Role Type"::Chairperson THEN BEGIN
                "Evaluation Lead":=BidCommitte."Member No.";
                "Evaluation Lead Name":=BidCommitte."Member Name";
                END;*/
                BidCommitte.Designation:=IFSTenderCommitte.Designation;
                BidCommitte."ID/Passport No":=IFSTenderCommitte."ID/Passport No";
                BidCommitte."Tax Registration (PIN) No.":=IFSTenderCommitte."Tax Registration (PIN) No.";
                BidCommitte.Email:=IFSTenderCommitte."Member Email";
                BidCommitte."Telephone No.":=IFSTenderCommitte."Telephone No.";
                BidCommitte."Staff  No.":=IFSTenderCommitte."Staff  No.";
                BidCommitte."IFS Code":="IFS Code";
                BidCommitte.Insert(true);
                
                until IFSTenderCommitte.Next=0;
                end;

            end;
        }
        field(22;"Appointed Bid Evaluation Com";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Appointed Bid Evaluation Committee';
            Editable = false;

            trigger OnValidate()
            begin
                BidCommitte.Reset;
                BidCommitte.SetRange("Appointed Bid Opening Com","Appointed Bid Evaluation Com");
                BidCommitte.SetRange(Type,BidCommitte.Type::Evaluation);
                BidCommitte.SetRange("Document No.",Code);
                if BidCommitte.FindSet then begin
                  BidCommitte.DeleteAll;
                end;
                
                
                IFSTenderCommitte.Reset;
                IFSTenderCommitte.SetRange("Document No.","Appointed Bid Evaluation Com");
                if IFSTenderCommitte.FindSet then begin
                repeat
                
                BidCommitte.Init;
                BidCommitte."Document No.":=Code;
                BidCommitte."Line No":=IFSTenderCommitte."Line No";
                BidCommitte."Appointed Bid Opening Com":="Appointed Bid Evaluation Com";
                BidCommitte."Role Type":=IFSTenderCommitte.Role;
                BidCommitte.Type:=BidCommitte.Type::Evaluation;
                BidCommitte."Member No.":=IFSTenderCommitte."Member No.";
                BidCommitte."Member Name":=IFSTenderCommitte."Member Name";
                /*IF BidCommitte."Role Type"=BidCommitte."Role Type"::Chairperson THEN BEGIN
                "Evaluation Lead":=BidCommitte."Member No.";
                "Evaluation Lead Name":=BidCommitte."Member Name";
                END;*/
                BidCommitte.Designation:=IFSTenderCommitte.Designation;
                BidCommitte."ID/Passport No":=IFSTenderCommitte."ID/Passport No";
                BidCommitte."Tax Registration (PIN) No.":=IFSTenderCommitte."Tax Registration (PIN) No.";
                BidCommitte.Email:=IFSTenderCommitte."Member Email";
                BidCommitte."Telephone No.":=IFSTenderCommitte."Telephone No.";
                BidCommitte."Staff  No.":=IFSTenderCommitte."Staff  No.";
                BidCommitte."IFS Code":="IFS Code";
                BidCommitte.Insert(true);
                
                until IFSTenderCommitte.Next=0;
                end;

            end;
        }
        field(23;"Primary Region";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(24;"Approval Status";Option)
        {
            DataClassification = ToBeClassified;
            Editable = true;
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(25;"Professional Opinion ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bid Tabulation Header".Code where ("Document Type"=const("Professional Opinion"));

            trigger OnValidate()
            begin
                //Procurement.SuggestNoticeOfAward(Rec);
            end;
        }
        field(26;"Awarded Bid No";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Purchase Header"."No." where ("Document Type"=const(Quote));
        }
        field(27;"Awarded Bidder No.";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = Vendor."No.";
        }
        field(28;"Awarded Bidder Name";Text[80])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(29;"Award Tender Sum Inc Taxes";Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Award Tender Sum Inc Taxes (LCY)';
            Editable = false;
        }
        field(30;"Award Acceptance Deadline";Code[20])
        {
            Caption = 'Award Acceptance Deadline Duration';
            DataClassification = ToBeClassified;
            Description = 'Award Acceptance Deadline Duration';
            Editable = false;
        }
        field(31;"Award Acceptance Response";Date)
        {
            Caption = 'Award Acceptance Response Deadline';
            DataClassification = ToBeClassified;
            Description = 'Award Acceptance Response Deadline';
            Editable = false;
        }
        field(32;"Min. Contract Holding";Code[20])
        {
            Caption = 'Min. Contract Holding/Standstill Duration';
            DataClassification = ToBeClassified;
            Description = 'Min. Contract Holding/Standstill Duration';
            Editable = false;
        }
        field(33;"Earliest Contract Issuance Dt";Date)
        {
            DataClassification = ToBeClassified;
            Description = 'Earliest Contract Issuance Date Date';
            Editable = false;
        }
        field(34;"Bidder NoA Response Type";Option)
        {
            DataClassification = ToBeClassified;
            Description = 'Bidder NoA Response Type';
            OptionCaption = ',Accepted,Declined';
            OptionMembers = ,Accepted,Declined;
        }
        field(35;"Bidder NoA Response Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(36;"No. of Post-Award Disputes";Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(37;"Document Status";Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = 'Active,Rejected,Submitted,Terminated,Approved';
            OptionMembers = Active,Rejected,Submitted,Terminated,Approved;
        }
        field(38;"No. Series";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(39;"Created By";Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(40;"Created Date";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(41;"Created Time";Time)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(42;Posted;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(43;"Posted By";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(44;"Posted Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(45;"Financial Evaluation ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bid Evaluation Register".Code where ("Evaluation Type"=const("Financial Evaluation"));

            trigger OnValidate()
            begin
                //Procurement.SuggestFinalEvalReport(Rec);
            end;
        }
        field(46;"General Procurement Remarks";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(47;"No of submitted bids";Integer)
        {
            CalcFormula = count("Purchase Header" where ("Invitation For Supply No"=field("IFS Code")));
            Editable = true;
            FieldClass = FlowField;
        }
        field(48;"No of Opened Bids(Tech)";Integer)
        {
            CalcFormula = count("Bid Opening Register Line" where ("IFS Code"=field("IFS Code"),
                                                                   Code=field("Bid Opening Register(Tech)")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(49;"No of Opened Bids(Finance)";Integer)
        {
            CalcFormula = count("Bid Opening Register Line" where ("IFS Code"=field("IFS Code"),
                                                                   Code=field("Bid Opening Register(Finance)")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50;"No of Responsive(Tech)";Integer)
        {
            CalcFormula = count("Purchase Header" where ("Invitation For Supply No"=field("IFS Code"),
                                                         "Passed Tech Evaluation"=const(true)));
            FieldClass = FlowField;
        }
        field(51;"No of non- Responsive(Tech)";Integer)
        {
            CalcFormula = count("Purchase Header" where ("Invitation For Supply No"=field("IFS Code"),
                                                         "Passed Tech Evaluation"=const(false)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(52;"No of Responsive(Finance)";Integer)
        {
            CalcFormula = count("Purchase Header" where ("Invitation For Supply No"=field("IFS Code"),
                                                         "Awarded Bid No"=field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(53;"No of non- Responsive(Finance)";Integer)
        {
            CalcFormula = count("Purchase Header" where ("Invitation For Supply No"=field("IFS Code"),
                                                         "Awarded Bid No"=filter(<>'CODE')));
            Editable = false;
            FieldClass = FlowField;
        }
        field(54;"Bid Opening Register(Tech)";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(55;"Bid Opening Register(Finance)";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(56;"Procurement Officer License No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(57;"Procurement Method";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Solicitation Type";
        }
        field(58;"Process Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'IFS,IFP,IFR';
            OptionMembers = IFS,IFP,IFR;
        }
        field(59;"IFP Code";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Request For Information".Code where (Status=const(Released),
                                                                  Published=const(true));

            trigger OnValidate()
            begin
                IFP.Reset;
                IFP.SetRange(Code,"IFP Code");
                if IFP.FindSet then
                  "Document Date":=Today;
                Description:=IFP.Description+' Evaluation Report';
                "Appointed Bid Evaluation Com":=IFP."Evaluation Committee";
                "Appointed Bid Opening Comm":=IFP."Opening Committee";
                Validate("Appointed Bid Evaluation Com");
                Validate("Appointed Bid Opening Comm");
                "Primary Region":=IFP."Responsibility Centre";
                "Created By":=UserId;
                "Created Date":=Today;
                "Created Time":=Time;
                UserSetup.Reset;
                UserSetup.SetRange("User ID",UserId);
                if UserSetup.FindSet then
                "Raised By":=UserSetup."Employee No.";
                Name:=UserSetup."Employee Name";
            end;
        }
        field(60;"Prequalification Category";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "RFI Prequalification Category"."Prequalification Category ID" where ("Document No"=field("IFP Code"));

            trigger OnValidate()
            begin
                //IFPResponseLine.RESET;
                // IFPResponseLine.SETRANGE(Code,"Prequalification Category");
                // IF IFPResponseLine.FINDSET THEN
                //  "Category Name":=IFPResponseLine.Description;
            end;
        }
        field(61;"Category Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(62;Appealed;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(63;"Linked to NOA";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(64;"Reason for Rejection";Text[2000])
        {
            DataClassification = ToBeClassified;
        }
        field(65;"Reason for Tender Termination";Text[2000])
        {
            DataClassification = ToBeClassified;
        }
        field(66;"Tender Cancellation Reason";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Tender Cancel Reason Code".Code;
        }
        field(67;"Termination Request";Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown;"Code",Description,"Raised By",Name)
        {
        }
    }

    trigger OnInsert()
    begin
        if Code='' then begin
        ProcurementSetup.Get;
        // IF "Document Type"="Document Type"::" " THEN
        //  BEGIN
        // ProcurementSetup.TESTFIELD("Final Evaluation Report Nos");
        // NoMgt.InitSeries(ProcurementSetup."Final Evaluation Report Nos",xRec."No. Series",0D,Code,"No. Series");
        // END;
        if "Document Type"="document type"::"Evaluation Report" then begin
        ProcurementSetup.TestField("Proffesional Opinion Nos");
        NoMgt.InitSeries(ProcurementSetup."Proffesional Opinion Nos",xRec."No. Series",0D,Code,"No. Series");
        end;
        if "Document Type"="document type"::"Professional Opinion" then begin
        ProcurementSetup.TestField("Notice of Award");
        NoMgt.InitSeries(ProcurementSetup."Notice of Award",xRec."No. Series",0D,Code,"No. Series");
        end;
        end;

        "Created By":=UserId;
        "Created Date":=Today;
        "Created Time":=Time;
    end;

    var
        ProcurementSetup: Record "Procurement Setup";
        NoMgt: Codeunit NoSeriesManagement;
        IFS: Record "Standard Purchase Code";
        IFSTenderCommitte: Record "IFS Tender Committee Member";
        BidCommitte: Record "Bid Evaluation Committee";
        Bids: Record "Purchase Header";
        Bidevaluationscore: Record "Bid Evaluation Score Entry";
        BidSCoreGuide: Record "Bid Score Requirement";
        LineNo: Integer;
        BidScore: Record "Bid Score Guide";
        BidEvaluationCriteria: Record "Bid Evaluation Criteria Group";
        EvaluationCriteria: Record "Bid Score Criteria Group";
        BidEvalScore: Record "Bid Evaluation Score Guide";
        BidEvaluationregister: Record "Bid Evaluation Register";
        BidOpening: Record "Bid Opening Register";
        Procurement: Codeunit "Procurement Processing";
        IFPResponseLine: Record "Procurement Category";
        IFP: Record "Request For Information";
        UserSetup: Record "User Setup";
}

