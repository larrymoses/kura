#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72102 "Road Management Setup"
{

    fields
    {
        field(1; "Primary Key"; Code[30])
        {
        }
        field(2; "Current Road Authority Code"; Code[30])
        {

            TableRelation = "Road Authority"."Road Authority Code";
        }
        field(3; "Primary Legislation ID"; Code[30])
        {

            //  TableRelation = "Legislation Register"."Legislation ID";
        }
        field(4; "RICS Existing Link No"; Code[20])
        {

            TableRelation = "No. Series";
        }
        field(5; "RICS New Link No"; Code[20])
        {

            TableRelation = "No. Series";
        }
        field(6; "Road Work Plan Nos(Maintenanc)"; Code[20])
        {

            TableRelation = "No. Series";
        }
        field(7; "Staff Appointment Voucher Nos"; Code[20])
        {

            TableRelation = "No. Series";
        }
        field(8; "Measurement Sheet Nos"; Code[20])
        {

            Description = '"No. Series"';
            TableRelation = "No. Series";
        }
        field(9; "Inspection Nos"; Code[20])
        {

            TableRelation = "No. Series";
        }
        field(10; "Payment Certificate Nos"; Code[20])
        {

            TableRelation = "No. Series";
        }
        field(11; "Commencement Order Nos"; Code[20])
        {

            TableRelation = "No. Series";
        }
        field(12; "Work Execution Plan  Nos"; Code[20])
        {

            TableRelation = "No. Series";
        }
        field(13; "Notice Of Completed Works Nos"; Code[20])
        {

            TableRelation = "No. Series";
        }
        field(14; "Contractor Payment Request Nos"; Code[20])
        {

            TableRelation = "No. Series";
        }
        field(15; "Road Budget  Nos(Maintenance)"; Code[20])
        {

            Description = '"No. Series"';
            TableRelation = "No. Series";
        }
        field(16; "Road Budget  Nos(Development)"; Code[20])
        {

            Description = '"No. Series"';
            TableRelation = "No. Series";
        }
        field(17; "Road Work Plan Nos(Constructi)"; Code[20])
        {

            Description = '"No. Series"';
            TableRelation = "No. Series";
        }
        field(18; "Bill-To Customer No"; Code[20])
        {

            Description = 'Customer.No.';
            TableRelation = Customer."No.";
        }
        field(19; "RICS Project Based Nos"; Code[20])
        {

            TableRelation = "No. Series";
        }
        field(20; "Facility Nos(Structure)"; Code[20])
        {

            TableRelation = "No. Series";
        }
        field(21; "Facility Nos(Furniture)"; Code[20])
        {

            TableRelation = "No. Series";
        }
        field(22; "Multi Year Projects No"; Code[20])
        {

            TableRelation = "No. Series".Code;
        }
        field(23; "Road Environs Nos"; Code[20])
        {

            TableRelation = "No. Series".Code;
        }
        field(24; "Road Reserve Nos"; Code[10])
        {

            TableRelation = "No. Series";
        }
        field(25; "Project Checklist Nos"; Code[20])
        {

            TableRelation = "No. Series";
        }
        field(26; "Deafult Checklist Template No"; Code[20])
        {

            TableRelation = "Project Checklist  Template"."Template ID";
        }
        field(27; "Default Meeting Template ID"; Code[20])
        {

        }
        field(28; "Default Staff App Template ID"; Code[20])
        {

        }
        field(29; "Default BoQ Template ID"; Code[10])
        {

        }
        field(30; "PCO Notification Enabled"; Boolean)
        {

        }
        field(31; "Meeting Register Nos"; Code[20])
        {

            TableRelation = "No. Series";
        }
        field(32; "Material Test Template Nos"; Code[20])
        {

            TableRelation = "No. Series";
        }
        field(33; "Project Photo Record Nos"; Code[20])
        {

            TableRelation = "No. Series";
        }
        field(34; "Daily Work Record Nos"; Code[20])
        {

            TableRelation = "No. Series";
        }
        field(35; "Material Test Record Nos"; Code[20])
        {

            TableRelation = "No. Series";
        }
        field(36; "EOT Request Nos"; Code[20])
        {

            Description = ' ,Extension of Time Request,Contractor Variation Request,Project Variation Order,Budget Reallocation Voucher';
            TableRelation = "No. Series";
        }
        field(37; "Contractor Variation Req Nos"; Code[20])
        {

            TableRelation = "No. Series";
        }
        field(38; "Project Variation Order Nos"; Code[20])
        {

            TableRelation = "No. Series";
        }
        field(39; "Budget Reallocation Nos"; Code[20])
        {

            TableRelation = "No. Series";
        }
        field(40; "Contractor Variation Notify"; Boolean)
        {

        }
        field(41; "New Job Vouche Nos"; Code[20])
        {

            TableRelation = "No. Series";
        }
        field(42; "Advance Payment Nos"; Code[20])
        {

            TableRelation = "No. Series";
        }
        field(43; "Vehicle Temp SuperV Nos"; Code[20])
        {

            TableRelation = "No. Series".Code;
        }
        field(44; "REs Office Temp SuperV Nos"; Code[20])
        {

            TableRelation = "No. Series".Code;
        }
        field(45; "Survey Equip Temp SuperV Nos"; Code[20])
        {

            TableRelation = "No. Series".Code;
        }
        field(46; "Lab Equip Temp SuperV Nos"; Code[20])
        {

            TableRelation = "No. Series".Code;
        }
        field(47; "Site Agent Appointment Nos"; Code[20])
        {

            TableRelation = "No. Series".Code;
        }
        field(48; "Contractor Personnel App Nos"; Code[20])
        {

            TableRelation = "No. Series".Code;
        }
        field(49; "Contractor Equipment Reg Nos"; Code[20])
        {

            TableRelation = "No. Series".Code;
        }
        field(50; "Quality Management Plan Nos"; Code[20])
        {

            TableRelation = "No. Series".Code;
        }
        field(51; "Corrective Order Nos"; Code[20])
        {

            TableRelation = "No. Series".Code;
        }
        field(52; "Quality Inspection Nos"; Code[20])
        {

            TableRelation = "No. Series".Code;
        }
        field(53; "Corrective Order Response Nos"; Code[20])
        {

            TableRelation = "No. Series".Code;
        }
        field(54; "Request for Close-Out Nos"; Code[20])
        {

            TableRelation = "No. Series".Code;
        }
        field(55; "TakeOver Inspection Nos"; Code[20])
        {

            TableRelation = "No. Series".Code;
        }
        field(56; "Request for Post DLP Nos"; Code[20])
        {

            TableRelation = "No. Series".Code;
        }
        field(57; "Post DLP Inspection Nos"; Code[20])
        {

            TableRelation = "No. Series".Code;
        }
        field(58; "Subcontractor Nos"; Code[20])
        {

            TableRelation = "No. Series";
        }
        field(59; "Engineer Variation Request Nos"; Code[20])
        {

            TableRelation = "No. Series";
        }
        field(60; "Project Material Template Nos"; Code[20])
        {

            TableRelation = "No. Series";
        }
        field(61; "Final Account Nos"; Code[20])
        {

            TableRelation = "No. Series".Code;
        }
        field(62; "Moblization Checklist Nos"; Code[20])
        {

            TableRelation = "No. Series";
        }
        field(63; "Mobllization Checklist Status"; Code[20])
        {

            TableRelation = "No. Series";
        }
        field(64; "Insurance Of Works Nos"; Code[20])
        {

            TableRelation = "No. Series";
        }
        field(65; "Advance Guarantee Nos"; Code[20])
        {

            TableRelation = "No. Series";
        }
        field(66; "Communication Plan Nos"; Code[20])
        {

            TableRelation = "No. Series";
        }
        field(67; "Meeting In Attendance Nos"; Code[20])
        {

            TableRelation = "No. Series".Code;
        }
        field(68; "Daily WorkPlan Nos"; Code[20])
        {

            TableRelation = "No. Series";
        }
        field(69; "Weekly Workplan Nos"; Code[20])
        {

            TableRelation = "No. Series";
        }
        field(70; "Monthly Workplan Nos"; Code[20])
        {

            TableRelation = "No. Series";
        }
        field(71; "Daily Test Request Nos"; Code[20])
        {

            TableRelation = "No. Series";
        }
        field(72; "Weekly Test Request Nos"; Code[20])
        {

            TableRelation = "No. Series";
        }
        field(73; "Monthly Test Request Nos"; Code[20])
        {

            TableRelation = "No. Series";
        }
        field(74; "Default Subcontracting Templat"; Code[20])
        {
            Caption = 'Default Subcontracting Template';

            TableRelation = "Project Document Template"."Template ID" where(Blocked = filter(false));
        }
        field(75; "Meeting In Attendance Nos."; Code[20])
        {

            TableRelation = "No. Series".Code;
        }
        field(76; "KeRRA Road Code Nos"; Code[20])
        {

            TableRelation = "No. Series";
        }
        field(77; "e-Notify Project Staff Termina"; Boolean)
        {

            Description = 'e-Notify-Project Staff Termination';
        }
        field(78; "Project Evaluation Report Nos"; Code[20])
        {

            TableRelation = "No. Series";
        }
        field(79; "Project Opinion Nos"; Code[20])
        {

            TableRelation = "No. Series";
        }
        field(80; "Performance Guarantee Nos"; Code[20])
        {

            TableRelation = "No. Series".Code;
        }
        field(81; "Survey Quality Checks Nos"; Code[20])
        {

            TableRelation = "No. Series".Code;
        }
        field(82; "Ext. Technologist/Surveyor Nos"; Code[20])
        {

            TableRelation = "No. Series".Code;
        }
        field(83; "RE Payment Schedule Nos"; Code[20])
        {

            TableRelation = "No. Series".Code;
        }
        field(84; "Contractor Staff Disengagement"; Code[20])
        {

            TableRelation = "No. Series".Code;
        }
        field(85; "Site Instructions Nos"; Code[20])
        {

            TableRelation = "No. Series";
        }
        field(86; "Project Transition Nos"; Code[20])
        {

            TableRelation = "No. Series";
        }
        field(87; "Cost Claim Nos"; Code[20])
        {

            TableRelation = "No. Series".Code;
        }
        field(88; "Pavement Test Nos"; Code[20])
        {

            TableRelation = "No. Series";
        }
        field(89; "PC Targets&Output Nos"; Code[20])
        {

            TableRelation = "No. Series".Code;
        }
        field(90; "Road Budget Nos(Study/Survey)"; Code[20])
        {

            TableRelation = "No. Series".Code;
        }
        field(91; "Equipment Repair Tracking"; Code[20])
        {

            TableRelation = "No. Series".Code;
        }
        field(92; "Workplan Nos(Studies/Surveys)"; Code[20])
        {

            TableRelation = "No. Series".Code;
        }
        field(93; "Road Camps Nos"; Code[20])
        {

            TableRelation = "No. Series".Code;
        }
        field(94; "Professional Indemnity Nos"; Code[20])
        {

            TableRelation = "No. Series".Code;
        }
        field(95; "Survey Request Nos"; Code[20])
        {

            TableRelation = "No. Series";
        }
        field(96; "Report Submission Nos"; Code[20])
        {

            TableRelation = "No. Series";
        }
        field(97; "Fee Note Nos"; Code[20])
        {

            TableRelation = "No. Series";
        }
        field(98; "Project Approval Template Nos"; Code[20])
        {

            TableRelation = "No. Series";
        }
        field(99; "Use Default Project Template"; Boolean)
        {

        }
        field(100; "Material Test Certificate Nos"; Code[20])
        {

            TableRelation = "No. Series".Code;
        }
        field(101; "Order to Commence(RoadWorks)"; DateFormula)
        {

        }
        field(102; "Order to Commence(Consultancy)"; DateFormula)
        {

        }
        field(103; "Land Acquisition Workorder Nos"; Code[30])
        {

            Description = 'RAM';
            TableRelation = "No. Series";
        }
        field(104; "GazettAcquisitionWorkorder Nos"; Code[30])
        {

            Description = 'RAM';
            TableRelation = "No. Series";
        }
        field(105; "Axle Load"; Code[30])
        {

            Description = 'RAM';
            TableRelation = "No. Series";
        }

        field(124; "Insurance/Gua Provider Nos"; Code[50])
        {

            Description = 'Insurance/Guarantee Provider Nos';
            TableRelation = "No. Series";
        }
        field(125; "RAM Workplan Nos(Regional)"; Code[50])
        {

            TableRelation = "No. Series";
        }
        field(126; "RAM Workplan Nos(Consolidated)"; Code[50])
        {

            TableRelation = "No. Series";
        }
        field(127; "RAM Directorate Office Email"; Text[300])
        {

            ExtendedDatatype = EMail;
        }
        field(128; "Variation Notice Nos"; Code[20])
        {

            TableRelation = "No. Series".Code;
        }
        field(129; "Chief Engineer Materials Email"; Text[300])
        {

            ExtendedDatatype = EMail;
        }
        field(130; "Chief Engineer Address"; Text[300])
        {

        }
        field(131; "Chief Engineer Address 2"; Text[300])
        {

        }
        field(132; "Chief Engineer Post Code"; Code[100])
        {

            TableRelation = "Post Code".Code;
        }
        field(133; "Guarantee Recall Nos"; Code[50])
        {

            TableRelation = "No. Series".Code;
        }
        field(134; "Project Correspondences Nos"; Code[50])
        {

            TableRelation = "No. Series".Code;
        }
        field(135; "Amendment of Contract Clauses"; Code[50])
        {

            TableRelation = "No. Series".Code;
        }
        field(136; "Roadworks Budget Ceiling Nos"; Code[50])
        {

            TableRelation = "No. Series".Code;
        }
        field(137; "Workplan Recall Expiry Period"; DateFormula)
        {

        }
        field(138; "RAM Workplan Nos(Constituency)"; Code[50])
        {

            TableRelation = "No. Series";
        }
        field(139; "RAM Workplan Nos(Consol West)"; Code[50])
        {

            TableRelation = "No. Series";
        }
        field(140; "RAM Workplan Nos(Consol East)"; Code[50])
        {

            TableRelation = "No. Series";
        }
        field(141; "Variation RAM Workplan Nos"; Code[50])
        {

            TableRelation = "No. Series";
        }
        field(142; "Consultancy Workplan Nos"; Code[20])
        {

            TableRelation = "No. Series".Code;
        }
        field(143; "Award Nos(EoT)"; Code[20])
        {

            TableRelation = "No. Series".Code;
        }
        field(144; "Award Nos(CVR)"; Code[20])
        {

            TableRelation = "No. Series".Code;
        }
        field(145; "Award Nos(EVR)"; Code[20])
        {

            TableRelation = "No. Series";
        }
        field(146; "Award(Cost Claim)"; Code[20])
        {

            TableRelation = "No. Series";
        }
        field(147; "Award(Party To Contract)"; Code[20])
        {

            TableRelation = "No. Series";
        }
        field(148; "NEMA Submission Form Nos"; Code[20])
        {

            TableRelation = "No. Series".Code;
        }
        field(149; "Consultant Discharge Nos"; Code[20])
        {

            TableRelation = "No. Series";
        }
        field(150; "Project ME Header Nos"; Code[20])
        {

            TableRelation = "No. Series";
        }
        field(151; "ME Workplan Nos"; Code[20])
        {

            TableRelation = "No. Series";
        }
        field(152; "Default ME Workplan No"; Code[20])
        {

            // TableRelation = "Project ME Workplan Header"."Document No" WHERE (Status=CONST(Approved));
        }
        field(153; "M&E Staff App Nos"; Code[30])
        {

            TableRelation = "No. Series".Code;
        }
        field(154; "Project ME Report No"; Code[30])
        {

            TableRelation = "No. Series".Code;
        }
        field(155; "Send Site Instruction Not"; Boolean)
        {
            Caption = 'Send Site Instruction Notification';
        }
        field(156; "Gen. Prod Posting Group"; Code[20])
        {
            Caption = 'General Product Posting Group';
            TableRelation = "Gen. Product Posting Group";
        }
        field(157; "Financier's Posting Group"; Code[20])
        {
            TableRelation = "Customer Posting Group";
        }
        field(158; "RAM Workplan Nos(Towns)"; Code[20])
        {

            TableRelation = "No. Series";
        }
        field(258; "PC Sum Request"; Code[20])
        {

            TableRelation = "No. Series";
        }


        field(159; "Default Dimension 3"; Code[20])
        {
            //  CaptionClass = '1,1,3' ;
            //CaptionClass = '1,1,3'+' Default';
            Caption = 'Default Department Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = filter(3));
        }
        field(160; "Default Dimension 4"; Code[20])
        {
            // CaptionClass = '1,1,4' +' Default';
            Caption = 'Default Project Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = filter(4));
        }
        field(161; "Default Dimension 5"; Code[20])
        {
            //  CaptionClass = '1,1,5' +' Default';
            // CaptionClass = '1,1,5';
            Caption = 'Default Town Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = filter(5));
        }

    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

