#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72274 "Inspection Headersss"
{

    fields
    {
        field(1;"Inspection No";Code[20])
        {
            
            Editable = false;
        }
        field(2;"Inspection Type";Option)
        {
            
            Editable = false;
            OptionCaption = ' ,Daily Works Inspection,Taking Over Inspection,End of DLP Inspection';
            OptionMembers = " ","Daily Works Inspection","Taking Over Inspection","End of DLP Inspection";
        }
        field(3;"Project ID";Code[40])
        {
            
            //TableRelation = Job."No." where (Status=filter("Completed/Under DLP"|Ongoing|"Under PBRM"));

            trigger OnValidate()
            begin
                Job.Reset;
                Job.SetRange(Job."No.","Project ID");
                if Job.FindSet then begin
                  "Contract ID":=Job."Purchase Contract ID";
                  Validate("Contract ID");
                  "Contractor No":=Job."Contractor No.";
                  Validate("Contractor No");
                  "Work Execution Plan 1D":=Job."Work Execution Plan ID";
                  Validate("Work Execution Plan 1D");
                  "Project End Date":=Job."Project End Date";
                  "Project Start Date":=Job."Project Start Date";
                  "Awarded Tender Sum Inc Tax":=Job."Project Budget";
                  "Region ID":=Job."Region ID";
                  "Directorate ID":=Job."Directorate Code";
                  "Department ID":=Job."Department ID";
                  "Project Name":=Job.Description;
                  "KeRRA Budget Code":=Job."KeRRA Budget Code";
                  end;

                 ProjectRoadLink.Reset;
                 ProjectRoadLink.SetRange(ProjectRoadLink."Global Budget Book Code","Project ID");
                 ProjectRoadLink.SetRange(ProjectRoadLink."KeRRA Budget Code",Rec."KeRRA Budget Code");
                 //ProjectRoadLink.SETRANGE(ProjectRoadLink."Global Budget Book Code",Rec."Global Budget Book Code");
                 if ProjectRoadLink.FindSet then begin
                  repeat
                    TakingOverSection.Init;
                    TakingOverSection."Inspection No":="Inspection No";
                    TakingOverSection."Document Type":="Inspection Type";
                    TakingOverSection."Line No":=TakingOverSection.Count+10;
                    TakingOverSection."Project ID":="Project ID";
                    TakingOverSection."Road Code":=ProjectRoadLink."Road Code";
                    TakingOverSection."Road Section No":=ProjectRoadLink."Road Section No";
                    TakingOverSection."Link Name":=ProjectRoadLink."Link Name";
                    TakingOverSection."Section Name":=ProjectRoadLink."Section Name";
                    TakingOverSection."Start Chainage":=ProjectRoadLink."Start Chainage(KM)";
                    TakingOverSection."End Chainage":=ProjectRoadLink."End Chainage(KM)";
                    TakingOverSection."Workplannned Length":=ProjectRoadLink."Workplanned Length(KM)";
                    if not TakingOverSection.Get(TakingOverSection."Inspection No",TakingOverSection."Document Type",TakingOverSection."Line No") then
                      TakingOverSection.Insert(true);
                    until ProjectRoadLink.Next=0;
                    end;
                CommunicationPlanHeader.Reset;
                CommunicationPlanHeader.SetRange(CommunicationPlanHeader."Project ID","Project ID");
                if CommunicationPlanHeader.FindSet then begin
                  "Project Communication Plan No.":=CommunicationPlanHeader."Document No";
                  Validate("Project Communication Plan No.");
                end;



                //Validate If it Requires PBRM
                JobPlanningLine.Reset;
                JobPlanningLine.SetRange(JobPlanningLine."Job No.","Project ID");
                JobPlanningLine.SetRange(JobPlanningLine."Contract Type",JobPlanningLine."contract type"::PBRM);
                if JobPlanningLine.FindFirst then
                  begin
                    "Has PBRM Component":=true;
                     Modify(true);
                    end;
            end;
        }
        field(4;"Contract ID";Code[20])
        {
            
            TableRelation = "Purchase Header"."No." where ("Document Type"=filter("Blanket Order"));

            trigger OnValidate()
            begin
                PurchaseHeader.Reset;
                PurchaseHeader.SetRange(PurchaseHeader."No.","Contract ID");
                if PurchaseHeader.FindSet then begin
                  "DLP Period":=PurchaseHeader."Defects Liability Period";
                  "Awarded Tender Sum Inc Tax":=PurchaseHeader."Award Tender Sum Inc Taxes";
                  end;

                PurchaseContractSignatory.Reset;
                PurchaseContractSignatory.SetRange(PurchaseContractSignatory.No,"Contract ID");
                if PurchaseContractSignatory.FindSet then begin
                  "Primary Contractor Rep.":=PurchaseContractSignatory."Representative Name";
                  "Contractor Representative Role":=PurchaseContractSignatory."Contract Signing Role";
                  "Contractor Rep. Email":=PurchaseContractSignatory.Email;
                  end;
            end;
        }
        field(5;"Contractor Request No";Code[20])
        {
            
            TableRelation = "Measurement &  Payment Header"."Document No." where ("Document Type"=filter("Contractor Request for Taking Over"|"Contractor Request for End of DLP Inspection"),
                                                                                  "Project ID"=field("Project ID"),
                                                                                  "Contractor No"=field("Contractor No"));
        }
        field(6;"Inspection Date";Date)
        {
            
            Editable = false;
        }
        field(7;"Contractor No";Code[20])
        {
            
            TableRelation = Vendor."No.";

            trigger OnValidate()
            begin
                Vendor.Reset;
                Vendor.SetRange(Vendor."No.","Contractor No");
                if Vendor.FindSet then
                  "Contractor Name":=Vendor.Name;
            end;
        }
        field(8;"Contractor Name";Text[250])
        {
            
            Editable = false;
        }
        field(9;"Committee No";Code[20])
        {
            
            TableRelation = "IFS Tender Committee"."Document No." where ("Committee Type"=filter('TO'|'DLP'));
        }
        field(10;"Project Start Date";Date)
        {
            
        }
        field(11;"Project End Date";Date)
        {
            
        }
        field(12;"DLP Start Date";Date)
        {
            

            trigger OnValidate()
            begin
                Validate("DLP Period");
            end;
        }
        field(13;"DLP Period";DateFormula)
        {
            

            trigger OnValidate()
            begin
                "DLP End Date":=CalcDate("DLP Period","DLP Start Date");
            end;
        }
        field(14;"DLP End Date";Date)
        {
            
        }
        field(15;"Awarded Tender Sum Inc Tax";Decimal)
        {
            
        }
        field(16;"Payments To Date";Decimal)
        {
            
        }
        field(17;Status;Option)
        {
            
            Editable = false;
            OptionCaption = ' ,Open,Pending Approval,Released';
            OptionMembers = " ",Open,"Pending Approval",Released;
        }
        field(18;"Committee Decision";Option)
        {
            
            OptionCaption = ' ,Satisfactory,Not Satisfactory';
            OptionMembers = " ",Accept,Reject;
        }
        field(19;"Created By";Text[100])
        {
            
        }
        field(20;"Created DateTime";DateTime)
        {
            
        }
        field(21;"Works Start Chainage";Decimal)
        {
            
        }
        field(22;"Works End Chainage";Decimal)
        {
            
        }
        field(23;"Primary Contractor Rep.";Code[20])
        {
            
            Description = 'Primary Contractor Rep.';
        }
        field(24;"Contractor Representative Role";Text[100])
        {
            
        }
        field(25;"Contractor Rep. Email";Text[100])
        {
            
            Description = 'Contractor Rep. Email';
        }
        field(26;"Work Execution Plan 1D";Code[20])
        {
            
            TableRelation = "Project Mobilization Header"."Document No." where ("Document Type"=filter("Work Execution Programme"));

            trigger OnValidate()
            begin
                ProjectMobilizationHeader.Reset;
                ProjectMobilizationHeader.SetRange(ProjectMobilizationHeader."Document No.","Work Execution Plan 1D");
                if ProjectMobilizationHeader.FindSet then
                  "Commencement Order No":=ProjectMobilizationHeader."Commencement Order ID";
            end;
        }
        field(27;"Commencement Order No";Code[20])
        {
            
            TableRelation = "Project Mobilization Header"."Document No." where ("Document Type"=filter("Order-To-Commence"));
        }
        field(28;Posted;Boolean)
        {
            
            Editable = true;
        }
        field(29;"Project Name";Text[2048])
        {
            
        }
        field(32;"Project Manager/Engineer";Text[100])
        {
            
        }
        field(33;"Region ID";Code[20])
        {
            
            Description = '"Responsibility Center".Code WHERE (Operating Unit Type=FILTER(Region))';
            TableRelation = "Responsibility Center".Code where ("Operating Unit Type"=filter(Region));
        }
        field(34;"Directorate ID";Code[20])
        {
            
            Description = '"Responsibility Center".Code WHERE (Operating Unit Type=FILTER(Region))';
        }
        field(35;"Department ID";Code[20])
        {
            
            Description = '"Responsibility Center".Code WHERE (Operating Unit Type=FILTER(Region))';
        }
        field(36;"Constituency ID";Code[20])
        {
            
            Description = '"Responsibility Center".Code WHERE (Operating Unit Type=FILTER(Region))';
        }
        field(37;"Funding Agency No.";Code[20])
        {
            
        }
        field(38;"Road Code";Code[20])
        {
            
           // TableRelation = "Road Inventory"."Road Code" where (Blocked=filter(false));
        }
        field(39;"Road Section No.";Code[20])
        {
            
          //  TableRelation = "Road Section"."Road Section No.";
        }
        field(40;"Section Name";Text[250])
        {
            
        }
        field(41;"No Series";Code[20])
        {
            
        }
        field(42;"Project Supervision Template";Code[20])
        {
            
            TableRelation = "Project Supervision Template"."Template ID" where ("Project Stage"=filter(Execution));

            trigger OnValidate()
            begin
                //Insert the Lines
                SupervisionTemplateCategory.Reset;
                SupervisionTemplateCategory.SetRange(SupervisionTemplateCategory."Template ID","Project Supervision Template");
                if SupervisionTemplateCategory.FindSet then
                  repeat
                    InspectionLine.Init;
                    InspectionLine."Inspection No":="Inspection No";
                    InspectionLine."Inspection Type":="Inspection Type";
                    InspectionLine."Category ID":=SupervisionTemplateCategory."Category ID";
                    InspectionLine."Line No":=InspectionLine.Count+1;
                    InspectionLine."Project ID":="Project ID";
                    InspectionLine.Description:=SupervisionTemplateCategory.Description;
                    InspectionLine."Total Weight":=SupervisionTemplateCategory."Total Weight";
                    if not InspectionLine.Insert(true) then
                      InspectionLine.Modify(true);

                //Insert the plan lines
                SupervisionTemplateLine.Reset;
                SupervisionTemplateLine.SetRange(SupervisionTemplateLine."Template ID","Project Supervision Template");
                SupervisionTemplateLine.SetRange(SupervisionTemplateLine."Category ID",InspectionLine."Category ID");
                SupervisionTemplateLine.SetRange(SupervisionTemplateLine.Type,SupervisionTemplateLine.Type::"Works Inspection");
                if SupervisionTemplateLine.FindSet then
                  repeat
                    InspectionPlanLine.Init;
                    InspectionPlanLine."Inspection No":="Inspection No";
                    InspectionPlanLine."Inspection Type":="Inspection Type";
                    InspectionPlanLine."Category ID":=SupervisionTemplateCategory."Category ID";
                    InspectionPlanLine."Requirement ID":=InspectionPlanLine.Count+1;
                    InspectionPlanLine."Line No":=InspectionLine."Line No";
                    InspectionPlanLine."Project ID":="Project ID";
                    InspectionPlanLine.Description:=SupervisionTemplateLine.Description;
                    InspectionPlanLine."Maximum Weight":=SupervisionTemplateLine."Maximum Weight";
                    InspectionPlanLine."Response Type":=SupervisionTemplateLine."Response Type";
                    if not InspectionPlanLine.Insert(true) then
                     InspectionPlanLine.Modify(true);
                  until SupervisionTemplateLine.Next=0;
                  until SupervisionTemplateCategory.Next=0;
            end;
        }
        field(43;"QMP Plan Line No.";Code[20])
        {
            
        }
        field(44;"Works Inspection Template No.";Code[20])
        {
            
            TableRelation = "Project Supervision Template"."Template ID" where ("Project Stage"=filter(Execution),
                                                                                Type=filter("Works Inspection"));

            trigger OnValidate()
            begin
                //Insert the Lines
                SupervisionTemplateCategory.Reset;
                SupervisionTemplateCategory.SetRange(SupervisionTemplateCategory."Template ID","Works Inspection Template No.");
                SupervisionTemplateCategory.SetRange(SupervisionTemplateCategory.Type,SupervisionTemplateCategory.Type::"Works Inspection");
                if SupervisionTemplateCategory.FindSet then
                  repeat
                    InspectionLine.Init;
                    InspectionLine."Inspection No":="Inspection No";
                    InspectionLine."Inspection Type":="Inspection Type";
                    InspectionLine.Type:=SupervisionTemplateCategory.Type;
                    InspectionLine."Category ID":=SupervisionTemplateCategory."Category ID";
                    InspectionLine."Line No":=InspectionLine.Count+1;
                    InspectionLine."Project ID":="Project ID";
                    InspectionLine.Description:=SupervisionTemplateCategory.Description;
                    InspectionLine."Total Weight":=SupervisionTemplateCategory."Total Weight";
                    if not InspectionLine.Insert(true) then
                      InspectionLine.Modify(true);

                //Insert the plan lines
                SupervisionTemplateLine.Reset;
                SupervisionTemplateLine.SetRange(SupervisionTemplateLine."Template ID","Works Inspection Template No.");
                SupervisionTemplateLine.SetRange(SupervisionTemplateLine."Category ID",InspectionLine."Category ID");
                //SupervisionTemplateLine.SETRANGE(SupervisionTemplateLine.Type,SupervisionTemplateLine.Type::"Works Inspection");
                if SupervisionTemplateLine.FindSet then
                  repeat
                    InspectionPlanLine.Init;
                    InspectionPlanLine."Inspection No":="Inspection No";
                    InspectionPlanLine."Inspection Type":="Inspection Type";
                    InspectionPlanLine."Category ID":=SupervisionTemplateCategory."Category ID";
                    InspectionPlanLine."Requirement ID":=InspectionPlanLine.Count+1;
                    InspectionPlanLine."Line No":=InspectionLine."Line No";
                    InspectionPlanLine."Project ID":="Project ID";
                    InspectionPlanLine.Description:=SupervisionTemplateLine.Description;
                    InspectionPlanLine."Maximum Weight":=SupervisionTemplateLine."Maximum Weight";
                    InspectionPlanLine."Response Type":=SupervisionTemplateLine."Response Type";
                    if not InspectionPlanLine.Insert(true) then
                     InspectionPlanLine.Modify(true);
                  until SupervisionTemplateLine.Next=0;
                  until SupervisionTemplateCategory.Next=0;
            end;
        }
        field(45;"Survey Works Template No.";Code[20])
        {
            
            TableRelation = "Project Supervision Template"."Template ID" where ("Project Stage"=filter(Execution),
                                                                                Type=filter("Survey Works"));

            trigger OnValidate()
            begin
                //Insert the Lines
                SupervisionTemplateCategory.Reset;
                SupervisionTemplateCategory.SetRange(SupervisionTemplateCategory."Template ID","Survey Works Template No.");
                SupervisionTemplateCategory.SetRange(SupervisionTemplateCategory.Type,SupervisionTemplateCategory.Type::"Survey Works");
                if SupervisionTemplateCategory.FindSet then
                  repeat
                    InspectionLine.Init;
                    InspectionLine."Inspection No":="Inspection No";
                    InspectionLine."Inspection Type":="Inspection Type";
                    InspectionLine.Type:=SupervisionTemplateCategory.Type;
                    InspectionLine."Category ID":=SupervisionTemplateCategory."Category ID";
                    InspectionLine."Line No":=InspectionLine.Count+1;
                    InspectionLine."Project ID":="Project ID";
                    InspectionLine.Description:=SupervisionTemplateCategory.Description;
                    InspectionLine."Total Weight":=SupervisionTemplateCategory."Total Weight";
                    if not InspectionLine.Insert(true) then
                      InspectionLine.Modify(true);

                //Insert the plan lines
                SupervisionTemplateLine.Reset;
                SupervisionTemplateLine.SetRange(SupervisionTemplateLine."Template ID","Survey Works Template No.");
                SupervisionTemplateLine.SetRange(SupervisionTemplateLine."Category ID",InspectionLine."Category ID");
                //SupervisionTemplateLine.SETRANGE(SupervisionTemplateLine.Type,SupervisionTemplateLine.Type::"Works Inspection");
                if SupervisionTemplateLine.FindSet then
                  repeat
                    InspectionPlanLine.Init;
                    InspectionPlanLine."Inspection No":="Inspection No";
                    InspectionPlanLine."Inspection Type":="Inspection Type";
                    InspectionPlanLine."Category ID":=SupervisionTemplateCategory."Category ID";
                    InspectionPlanLine."Requirement ID":=InspectionPlanLine.Count+1;
                    InspectionPlanLine."Line No":=InspectionLine."Line No";
                    InspectionPlanLine."Project ID":="Project ID";
                    InspectionPlanLine.Description:=SupervisionTemplateLine.Description;
                    InspectionPlanLine."Maximum Weight":=SupervisionTemplateLine."Maximum Weight";
                    InspectionPlanLine."Response Type":=SupervisionTemplateLine."Response Type";
                    if not InspectionPlanLine.Insert(true) then
                     InspectionPlanLine.Modify(true);
                  until SupervisionTemplateLine.Next=0;
                  until SupervisionTemplateCategory.Next=0;
            end;
        }
        field(46;"Lab Works Template No.";Code[20])
        {
            
            TableRelation = "Project Supervision Template"."Template ID" where ("Project Stage"=filter(Execution),
                                                                                Type=filter("Lab Works"));

            trigger OnValidate()
            begin
                //Insert the Lines
                SupervisionTemplateCategory.Reset;
                SupervisionTemplateCategory.SetRange(SupervisionTemplateCategory."Template ID","Lab Works Template No.");
                SupervisionTemplateCategory.SetRange(SupervisionTemplateCategory.Type,SupervisionTemplateCategory.Type::"Lab Works");
                if SupervisionTemplateCategory.FindSet then
                  repeat
                    InspectionLine.Init;
                    InspectionLine."Inspection No":="Inspection No";
                    InspectionLine."Inspection Type":="Inspection Type";
                    InspectionLine.Type:=SupervisionTemplateCategory.Type;
                    InspectionLine."Category ID":=SupervisionTemplateCategory."Category ID";
                    InspectionLine."Line No":=InspectionLine.Count+1;
                    InspectionLine."Project ID":="Project ID";
                    InspectionLine.Description:=SupervisionTemplateCategory.Description;
                    InspectionLine."Total Weight":=SupervisionTemplateCategory."Total Weight";
                    if not InspectionLine.Insert(true) then
                      InspectionLine.Modify(true);

                //Insert the plan lines
                SupervisionTemplateLine.Reset;
                SupervisionTemplateLine.SetRange(SupervisionTemplateLine."Template ID","Lab Works Template No.");
                SupervisionTemplateLine.SetRange(SupervisionTemplateLine."Category ID",InspectionLine."Category ID");
                //SupervisionTemplateLine.SETRANGE(SupervisionTemplateLine.Type,SupervisionTemplateLine.Type::"Works Inspection");
                if SupervisionTemplateLine.FindSet then
                  repeat
                    InspectionPlanLine.Init;
                    InspectionPlanLine."Inspection No":="Inspection No";
                    InspectionPlanLine."Inspection Type":="Inspection Type";
                    InspectionPlanLine."Category ID":=SupervisionTemplateCategory."Category ID";
                    InspectionPlanLine."Requirement ID":=InspectionPlanLine.Count+1;
                    InspectionPlanLine."Line No":=InspectionLine."Line No";
                    InspectionPlanLine."Project ID":="Project ID";
                    InspectionPlanLine.Description:=SupervisionTemplateLine.Description;
                    InspectionPlanLine."Maximum Weight":=SupervisionTemplateLine."Maximum Weight";
                    InspectionPlanLine."Response Type":=SupervisionTemplateLine."Response Type";
                    if not InspectionPlanLine.Insert(true) then
                     InspectionPlanLine.Modify(true);
                  until SupervisionTemplateLine.Next=0;
                  until SupervisionTemplateCategory.Next=0;
            end;
        }
        field(47;"KeRRA Budget Code";Code[20])
        {
            
        }
        field(48;"Project Communication Plan No.";Code[20])
        {
            
        }
        field(49;"Has PBRM Component";Boolean)
        {
            
        }
        field(50;"Revised End Date";Date)
        {
            
        }
        field(51;"Maintenance Period";DateFormula)
        {
            
        }
        field(52;"Final Taking Over Inspection?";Option)
        {
            
            OptionCaption = ' ,Yes,No';
            OptionMembers = " ",Yes,No;
        }
        field(53;"Taking Over Certificate No.";Integer)
        {
            
        }
        field(54;"Refence No";Text[100])
        {
            
        }
        field(55;"Rejection Remarks";Text[2048])
        {
            
        }
        field(56;"Rejected By";Code[100])
        {
            
        }
        field(57;Rejected;Boolean)
        {
            
        }
        field(58; "Length of Bridge(M)"; Decimal)
        {
            
        }
        field(59; "Clause No."; Code[20])
        {
            
        }
        field(60; "Clause Description"; Text[200])
        {
            
        }
        field(61; "Agreed Take Over Date"; Date)
        {
            
        }
    }

    keys
    {
        key(Key1;"Inspection No","Inspection Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
         if "Inspection No"='' then begin
          RoadManagementSetup.Get;
          RoadManagementSetup.TestField("Quality Inspection Nos");
          NoSeriesManagement.InitSeries(RoadManagementSetup."Quality Inspection Nos",xRec."No Series",Today,"Inspection No","No Series");
          end;
         "Inspection Date":=Today;
         Status:=Status::Open;
         "Created By":=UserId;
         "Created DateTime":=CreateDatetime(Today,Time);

        if xRec."Inspection Date"=Rec."Inspection Date" then
          Error('Inspection for %1 already exists. Kindly edit the existing record.',"Inspection Date");
    end;

    var
        RoadManagementSetup: Record "Road Management Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        Job: Record Job;
        PurchaseHeader: Record "Purchase Header";
        PurchaseContractSignatory: Record "Purchase Contract Signatory";
        IFSTenderCommittee: Record "IFS Tender Committee";
        Vendor: Record Vendor;
        ProjectMobilizationHeader: Record "Project Mobilization Header";
        ProjectSupervisionTemplate: Record "Project Supervision Template";
        SupervisionResponseType: Record "Supervision Response Type";
        SupervisionTemplateCategory: Record "Supervision Template Category";
        SupervisionTemplateLine: Record "Supervision Template Line";
        InspectionLine: Record "Inspection Line";
        InspectionPlanLine: Record "Inspection Plan Line";
        TakingOverSection: Record "Taking Over Section";
        ProjectRoadLink: Record "Project Road Link";
        CommunicationPlanHeader: Record "Communication Plan Header";
        CommPlanLineStakeholder: Record "Comm Plan Line Stakeholder";
        PurchaseContractCirTeam: Record "Purchase Contract Cir Team";
        InspectionHeadersss: Record "Inspection Headersss";
        JobPlanningLine: Record "Job Planning Line";
}

