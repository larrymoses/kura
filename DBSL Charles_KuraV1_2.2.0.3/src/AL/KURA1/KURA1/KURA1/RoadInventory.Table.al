#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72111 "Road Inventory"
{
    DrillDownPageID = "Global Road Inventory";
    LookupPageID = "Global Road Inventory";

    fields
    {
        field(1; "Road Code"; Code[20])
        {
            
        }
        field(2; "Link Name"; Text[250])
        {
            
        }
        field(3; "Road Class ID"; Code[20])
        {
            
            TableRelation = "Road Class"."Road Class ID";

            trigger OnValidate()
            begin
                RoadClass.Reset;
                RoadClass.SetRange(RoadClass."Road Class ID", "Road Class ID");
                if RoadClass.FindSet then
                    "Desired Road Reserve Width(M)" := RoadClass."Desired Road Reserve Width (M)";
            end;
        }
        field(4; "Road Category"; Enum "Road Category")
        {
            
           // OptionCaption = ' ,National Trunk Road,National Secondary Road,County Road, Urban Road,KWS Road, Special Purpose Road, Unclassified Road';
           // OptionMembers = " ","National Trunk Road","National Secondary Road","County Road"," Urban Road","KWS Road"," Special Purpose Road"," Unclassified Road";
        }
        field(5; "Carriageway Type"; Option)
        {
            
            OptionCaption = ' ,Single,Dual';
            OptionMembers = " ",Single,Dual;
        }
        field(6; "Primary County ID"; Code[30])
        {
            
            TableRelation = County1.Code;
        }
        field(7; "Primary Region ID"; Code[30])
        {
            
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Region));
        }
        field(8; "Start Chainage(KM)"; Decimal)
        {
            
            DecimalPlaces = 3 : 3;

            trigger OnValidate()
            begin
                if "Start Chainage(KM)" < 0 then
                    Error('Value cannot be negative');
            end;
        }
        field(9; "End Chainage(KM)"; Decimal)
        {
            
            DecimalPlaces = 3 : 3;

            trigger OnValidate()
            begin
                if "End Chainage(KM)" < 0 then
                    Error('Value cannot be negative');

                if "End Chainage(KM)" < "Start Chainage(KM)" then
                    Error('End chainage should be greater than start chainage');

                if "End Chainage(KM)" > 0 then
                    "Gazetted Road Length (KMs)" := "End Chainage(KM)" - "Start Chainage(KM)";
            end;
        }
        field(10; "Gazetted Road Length (KMs)"; Decimal)
        {
            
            DecimalPlaces = 3 : 3;
        }
        field(11; "No. of Road Sections"; Integer)
        {
            CalcFormula = count("Road Section" where("Road Code" = field("Road Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(12; "Total Section Length (KMs)"; Decimal)
        {
            
            DecimalPlaces = 3 : 3;
        }
        field(13; "General Road Surface Condition"; Option)
        {
            
            OptionCaption = ' ,Excellent,Good,Poor,Very Poor,Fair';
            OptionMembers = " ",Excellent,Good,Poor,"Very Poor",Fair;
        }
        field(14; "Start Point Longitude"; Decimal)
        {
            
            DecimalPlaces = 10 : 10;
        }
        field(15; "Start Point Latitude"; Decimal)
        {
            
            DecimalPlaces = 10 : 10;
        }
        field(16; "End Point Longitude"; Decimal)
        {
            
            DecimalPlaces = 10 : 10;
        }
        field(17; "End Point Latitude"; Decimal)
        {
            
            DecimalPlaces = 10 : 10;
        }
        field(18; "Paved Road Length (Km)"; Decimal)
        {
            
            DecimalPlaces = 3 : 3;
        }
        field(19; "Paved Road Length %"; Decimal)
        {
            
            DecimalPlaces = 2 : 2;
        }
        field(20; "Unpaved Road Length %"; Decimal)
        {
            
            DecimalPlaces = 2 : 2;
        }
        field(21; "Original Road Agency"; Code[20])
        {
            
            TableRelation = "Road Authority"."Road Authority Code" ;//where("Current Road Agency" = filter(true));
        }
        field(22; Blocked; Boolean)
        {
            
        }
        field(23; "Last Road Condition Survey ID"; Code[20])
        {
            
        }
        field(24; "Last Road Cond. Survey Date"; Date)
        {
            
            Description = 'Last Road Condition Survey Date';
        }
        field(25; "No. of Awarded Contracts"; Integer)
        {
            CalcFormula = count("Purchase Header" where("Document Type" = filter("Blanket Order"),
                                                             "Contract Status" = filter(" "),
                                                             "Road Code" = field("Road Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(26; "No. of Planned Road Projects"; Integer)
        {
            CalcFormula = count(Job where("Road Code" = field("Road Code"),
                                          Status = filter(Planned)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(27; "No. of Ongoing Road Projects"; Integer)
        {
            CalcFormula = count(Job where("Road Code" = field("Road Code"),
                                            Status = filter("Completed/Under DLP")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(28; "No. of Completed Road Projects"; Integer)
        {
            CalcFormula = count(Job where("Road Code" = field("Road Code"),

                                          Status = filter("Under PBRM")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(29; "Budget (Total Cost)"; Decimal)
        {
            CalcFormula = sum("Job Planning Line"."Total Cost (LCY)" where("Line Type" = filter(Budget),
                                                                                "Road Code" = field("Road Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(30; "Actual (Total Cost)"; Decimal)
        {
            CalcFormula = sum("Job Ledger Entry"."Total Cost (LCY)" where("Entry Type" = filter(Usage),
                                                                               "Road Code" = field("Road Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(31; "No. of Res. Land Acq. W_orders"; Integer)
        {
            
            Description = 'No. of Res. Land Acq. W_orders';
        }
        field(32; "No. of Roadside Devpt Apps"; Integer)
        {
            
            Description = 'No. of Pending Roadside Devpt Apps';
        }
        field(33; "No. of Enchmt Stop W_orders"; Integer)
        {
            
            Description = 'No. of Enchmt Stop W_orders';
        }
        field(34; "No. of Axle Load Inspections"; Integer)
        {
            
        }
        field(35; "No. of Axle Load Exempt Prmts"; Integer)
        {
            
            Description = 'No. of Axle Load Exempt Prmts';
        }
        field(36; "No. of Filed Road Misuse Inc."; Integer)
        {
            
            Description = 'No. of Filed Road Misuse Inc.';
        }
        field(37; "Total No. of Fatalities"; Integer)
        {
            
        }
        field(38; "Old Data"; Boolean)
        {
            
        }
        field(39; "Surface Type"; Code[20])
        {
            
            TableRelation = "Pavement Surface Type".Code;
        }
        field(40; "KeRRA Road Code"; Text[200])
        {
            
            Description = 'KURA Road Code';
        }
        field(41; "Web GIS URL"; Text[100])
        {
            
        }
        field(42; "No. of Feasibility Studies"; Integer)
        {
            
        }
        field(43; "No. of Environmental Studies"; Integer)
        {
            
        }
        field(44; "No. of Topographic Surveys"; Integer)
        {
            
        }
        field(45; "No. of Traffic Census reports"; Integer)
        {
            
        }
        field(46; "No. of Road Safety Audits"; Integer)
        {
            
        }
        field(47; "No. of Works Purchase Req"; Integer)
        {
            Caption = 'No. of Works Purchase Requisitions';
            
            Description = 'No. of Works Purchase Req';
        }
        field(48; "No. of Tender Invitations"; Integer)
        {
            
        }
        field(49; "Total Contract Value"; Decimal)
        {
            
        }
        field(50; "Planned Construction Proj"; Integer)
        {
            CalcFormula = count(Job where(Status = const(Planned),
                                         "Road Project Category" = const('2'),
                                       "Road Code" = field("Road Code")));
            Caption = 'Planned Construction Projects';
            Description = 'Planned Construction Projects';
            Editable = false;
            FieldClass = FlowField;
        }
        field(51; "Ongoing Construction Proj"; Integer)
        {
            CalcFormula = count(Job where(Status = const("Completed/Under DLP"),
                                         "Road Project Category" = const('2'),
                                       "Road Code" = field("Road Code")));
            Caption = 'Ongoing Construction Projects';
            Description = 'Ongoing Construction Projects';
            Editable = false;
            FieldClass = FlowField;
        }
        field(52; "Completed Construction Proj"; Integer)
        {
            CalcFormula = count(Job where(Status = const("Under PBRM"),
                                          "Road Project Category" = const('2'), "Road Code" = field("Road Code")));
            Caption = 'Completed Construction Projects';
            Description = 'Completed Construction Projects';
            Editable = false;
            FieldClass = FlowField;
        }
        field(53; "Construction Budget"; Decimal)
        {
            CalcFormula = sum("Job Planning Line"."Total Cost (LCY)" where("Line Type" = const(Budget),
                                                                                Text = const('2'),
                                                                                "Road Code" = field("Road Code")));
            Caption = 'Construction Budget (Total Cost)';
            Description = 'Construction Budget (Total Cost)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(54; "Construction Actual"; Decimal)
        {
            CalcFormula = sum("Job Ledger Entry"."Total Cost (LCY)" where("Entry Type" = const(Usage),
                                                                               "Road Project Category" = const("Construction Works"),
                                                                               "Road Code" = field("Road Code")));
            Caption = 'Construction Actual (Total Cost)';
            Description = 'Construction Actual (Total Cost)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(55; "Planned Maintenance Proj"; Integer)
        {
            CalcFormula = count(Job where(Status = const(Planned),
                                         "Road Project Category" = const('3'), "Road Code" = field("Road Code")));
            Caption = 'Planned Maintenance Projects';
            Description = 'Planned Maintenance Projects';
            Editable = false;
            FieldClass = FlowField;
        }
        field(56; "Ongoing Maintenance Proj"; Integer)
        {
            CalcFormula = count(Job where(Status = const("Completed/Under DLP"),
                                           "Road Project Category" = const('3'), "Road Code" = field("Road Code")));
            Caption = 'Ongoing Maintenance Projects';
            Description = 'Ongoing Maintenance Projects';
            Editable = false;
            FieldClass = FlowField;
        }
        field(57; "Completed Maintenance Proj"; Integer)
        {
            CalcFormula = count(Job where(Status = const("Under PBRM"),
                                           "Road Project Category" = const('3'), "Road Code" = field("Road Code")));
            Caption = 'Completed Maintenance Projects';
            Description = 'Completed Maintenance Projects';
            Editable = false;
            FieldClass = FlowField;
        }
        field(58; "Maintenance Budget"; Decimal)
        {
            CalcFormula = sum("Job Planning Line"."Total Cost (LCY)" where("Line Type" = const(Budget),
                                                                                Text = const('2'),
                                                                                "Road Code" = field("Road Code")));
            Caption = 'Maintenance Budget (Total Cost)';
            Description = 'Maintenance Budget (Total Cost)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(59; "Maintenance Actual"; Decimal)
        {
            CalcFormula = sum("Job Ledger Entry"."Total Cost (LCY)" where("Entry Type" = const(Usage),
                                                                               "Road Project Category" = const("Maitenance Works"),
                                                                               "Road Code" = field("Road Code")));
            Caption = 'Maintenance Actual (Total Cost)';
            Description = 'Maintenance Actual (Total Cost)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(60; "Road Valuation"; Decimal)
        {
            
        }
        field(61; Layer; Text[250])
        {
            
        }
        field(62; Material; Text[250])
        {
            
        }
        field(63; "Chainage Description"; Text[250])
        {
            
        }
        field(64; "KeRRA Road Reference Code"; Code[100])
        {
            
            Description = 'KURA Road Reference Code';
        }
        field(65; "No. of App Roadside Devpt Apps"; Integer)
        {
            
            Description = 'No. of Approved Roadside Devpt Apps';
        }
        field(66; "No. of Rej Roadside Devpt Apps"; Integer)
        {
            
            Description = 'No. of Rejected Roadside Devpt Apps';
        }
        field(67; "Desired Road Reserve Width(M)"; Decimal)
        {
            
            Editable = false;
        }
        field(68; "Authenti Road Reserve Width(M)"; Decimal)
        {
            Caption = 'Authentic Road Reserve Width(M)';
            
        }
        field(69; "Actual Road Reserve Width(M)"; Decimal)
        {
            
        }
        field(70; "No. Series"; Code[20])
        {
            
        }
        field(71; "Start Chainage Name"; Text[100])
        {
            
        }
        field(50000; Town; Code[20])
        {
            
            TableRelation = Towns.Code;
            Description = 'Town Code';
            trigger OnValidate()
            begin
                tTown.Reset;
                TTown.SetRange(TTown."Code", Town);
                if TTown.FindSet then
                    Description := TTown.Description;
            end;
        }
        field(50001; Description; text[60])
        {
            
            Description = 'Town Description';
        }
        field(50002; "Paved Start Chainage(KM)"; Decimal)
        {
            
            DecimalPlaces = 3 : 3;

            trigger OnValidate()
            begin
                if "Start Chainage(KM)" < 0 then
                    Error('Value cannot be negative');
            end;
        }
        field(50003; "Paved End Chainage(KM)"; Decimal)
        {
            
            DecimalPlaces = 3 : 3;

            trigger OnValidate()
            begin
                if "End Chainage(KM)" < 0 then
                    Error('Value cannot be negative');

                if "End Chainage(KM)" < "Start Chainage(KM)" then
                    Error('End chainage should be greater than start chainage');

                if "End Chainage(KM)" > 0 then
                    "Gazetted Road Length (KMs)" := "End Chainage(KM)" - "Start Chainage(KM)";
            end;
        }
        field(50004; "UnPaved Start Chainage(KM)"; Decimal)
        {
            
            DecimalPlaces = 3 : 3;

            trigger OnValidate()
            begin
                if "Start Chainage(KM)" < 0 then
                    Error('Value cannot be negative');
            end;
        }
        field(50005; "UnPaved End Chainage(KM)"; Decimal)
        {
            
            DecimalPlaces = 3 : 3;

            trigger OnValidate()
            begin
                if "End Chainage(KM)" < 0 then
                    Error('Value cannot be negative');

                if "End Chainage(KM)" < "Start Chainage(KM)" then
                    Error('End chainage should be greater than start chainage');

                if "End Chainage(KM)" > 0 then
                    "Gazetted Road Length (KMs)" := "End Chainage(KM)" - "Start Chainage(KM)";
            end;
        }
        field(50006;"Known Name"; Text[200])
        {
            Caption ='Local Name';
        }
    }


    keys
    {
        key(Key1; "Road Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Road Code", "Link Name","Known Name", "Road Class ID", "Primary County ID", "Start Chainage(KM)", "End Chainage(KM)")
        {
        }
        fieldgroup(Brick; "Road Code", "Link Name","Known Name", "Road Class ID", "Primary County ID", "Start Chainage(KM)", "End Chainage(KM)")
        {
        }
    }

    trigger OnInsert()
    begin
        if "Road Code" = '' then begin
            RoadManagementSetup.Get();
            RoadManagementSetup.TestField("KeRRA Road Code Nos");
            NoSeriesManagement.InitSeries(RoadManagementSetup."KeRRA Road Code Nos", xRec."No. Series", Today, "Road Code", "No. Series");
        end;

        if UserSetup.Get(UserId) then begin
            if not UserSetup."Allow Create Road Links" = true then
                Error('You are not allowed to create road links. Please contact Development/Maintenance Directorate.');
        end;
    end;

    var
        RoadClass: Record "Road Class";
        RoadManagementSetup: Record "Road Management Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        UserSetup: Record "User Setup";
        TTOWN: RECORD Towns;
}

