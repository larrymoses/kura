#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
/// <summary>
/// TableExtension "tableextension50028" (ID 50028) extends Record Resource.
/// </summary>
TableExtension 50028 tableextension50028 extends Resource
{
    fields
    {

        //Unsupported feature: Property Modification (Data type) on ""Job Title"(Field 10)".


        //Unsupported feature: Code Modification on ""No."(Field 1).OnValidate".

        //trigger "(Field 1)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF "No." <> xRec."No." THEN BEGIN
          ResSetup.GET;
          NoSeriesMgt.TestManual(ResSetup."Resource Nos.");
          "No. Series" := '';
        END;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        IF ("Resource Type"="Resource Type"::" ") THEN BEGIN
        #1..5
        END;

        IF ("Resource Type"="Resource Type"::Normal) THEN BEGIN
        IF "No." <> xRec."No." THEN BEGIN
           GrantSetup.GET;
          NoSeriesMgt.TestManual(GrantSetup."Researcher Nos");
          "No. Series" := '';
        END;
        END;

        IF ("Resource Type"="Resource Type"::Researcher) THEN BEGIN
        IF "No." <> xRec."No." THEN BEGIN
           GrantSetup.GET;
          NoSeriesMgt.TestManual(GrantSetup."Grant Admin Nos");
          "No. Series" := '';
        END;
        END;
        */
        //end;
        field(50020; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,1,3';
            Caption = 'Shorstcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(3,"Shortcut Dimension 3 Code");
            end;
        }
        field(50021; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,1,4';
            Caption = 'Shortcut Dimension 4 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));

            trigger OnValidate()
            begin
                ///ValidateShortcutDimCode(4,"Shortcut Dimension 4 Code");
            end;
        }
        field(50022; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,1,5';
            Caption = 'Shortcut Dimension 5 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(5));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(5,"Shortcut Dimension 5 Code");
            end;
        }
        field(50023; "Researcher?"; Boolean)
        {
            
        }
        field(65002; "No. of Awarded GFO"; Integer)
        {
            CalcFormula = count("Grant Funding Application" where("Principal Investigator" = field("No."),
                                                                   "Application Status" = const(Won),
                                                                   "Document Date" = field("Date Filter")));
            Description = 'For Statistics';
            FieldClass = FlowField;
        }
        field(65003; "No. of Lost Grant GFO"; Integer)
        {
            CalcFormula = count("Grant Funding Application" where("Principal Investigator" = field("No."),
                                                                   "Application Status" = const(Lost),
                                                                   "Document Date" = field("Date Filter")));
            Description = 'For Statistics';
            FieldClass = FlowField;
        }
        field(65004; "No. of Ongoing RProjects"; Integer)
        {
            CalcFormula = count(Job where("Person Responsible" = field("No."),
                                           "Document Type" = const(Project),
                                           "Starting Date" = field("Date Filter")));
            Description = 'For Statistics';
            FieldClass = FlowField;
        }
        field(65005; "No. of Completed RProjects"; Integer)
        {
            CalcFormula = count(Job where("Person Responsible" = field("No."),
                                           "Document Type" = const(Project),
                                           "Ending Date" = field("Date Filter")));
            Description = 'For Statistics';
            FieldClass = FlowField;
        }
        field(65006; "No. of Research Outputs"; Integer)
        {
            CalcFormula = count("Research Output Register" where("Principle Investigator" = field("No."),
                                                                  "Document Date" = field("Date Filter")));
            Description = 'For Statistics';
            FieldClass = FlowField;
        }
        field(65007; "Total Amount Awarded(LCY)"; Decimal)
        {
            CalcFormula = sum("Grant Funding Application"."Awarded Grant Amount (LCY)" where("Principal Investigator" = field("No.")));
            Description = 'For Statistics';
            FieldClass = FlowField;
        }
        field(65008; Admin; Boolean)
        {
            
        }
        field(65009; "Employee No"; Code[30])
        {
            CalcFormula = lookup(Employee."No." where("Resource No." = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(65010; "Employee Name"; Code[100])
        {
            
        }
        field(65011; "Resource Type"; Option)
        {
            
            OptionCaption = ' ,Normal,Researcher,Administrator,Project Engineer';
            OptionMembers = " ",Normal,Researcher,Administrator,"Project Engineer";
        }
        field(65012; "External Consultant"; Boolean)
        {
            
        }
        field(65013; "Researcher's Major"; Text[100])
        {
            
        }
        field(65014; "Researcher Biography"; Text[250])
        {
            
        }
        field(65015; "Job Group"; Code[20])
        {
            CalcFormula = lookup(Employee."Salary Scale" where("Resource No." = field("No.")));
            FieldClass = FlowField;
        }
        field(72000; "Project Engineer"; Boolean)
        {
            
            Description = 'RMS Field';
        }
        field(72001; "No. Of Ongoing Road Projects"; Integer)
        {
            CalcFormula = count(Job where("Project Manager" = field("No.")));
            Description = 'RMS Field';
            FieldClass = FlowField;
        }
        field(72002; "No. Of Finished Road Projects"; Integer)
        {
            CalcFormula = count(Job where("Project Manager" = field("No.")));
            Description = 'RMS Field';
            FieldClass = FlowField;
        }
        field(72003; "No. Of Planned Road Projects"; Integer)
        {
            CalcFormula = count(Job where("Project Manager" = field("No.")));
            Description = 'RMS Field';
            FieldClass = FlowField;
        }
        field(72004; "Road Planner"; Boolean)
        {
            
        }
        field(72005; "Planning Level"; Option)
        {
            
            OptionCaption = 'Regional,Constituency';
            OptionMembers = Regional,Constituency;
        }
        field(72006; "Constituency ID"; Code[20])
        {
            
            TableRelation = Constituency.Code;

            trigger OnValidate()
            begin
                Constituency.Reset;
                Constituency.SetRange(Constituency.Code, "Constituency ID");
                if Constituency.FindSet then begin
                    "Region ID" := Constituency."Region Code";
                end;


                if "Planning Level" = "planning level"::Regional then begin
                    Error('Regional planners cannot be mapped to a constituency');
                end;
            end;
        }
        field(72007; "Region ID"; Code[20])
        {
            
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Region),
                                                                Blocked = const(false));
        }
        field(72008; "No. Of Constituencies"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
        }
        field(72009; "User ID"; Text[200])
        {
            CalcFormula = lookup(Employee."User ID" where("No." = field("Employee No")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(72010; Email; Text[250])
        {
            
        }
        field(72011; Signature; Blob)
        {
            SubType = Bitmap;
        }
    }


    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF "No." = '' THEN BEGIN
      ResSetup.GET;
      ResSetup.TESTFIELD("Resource Nos.");
      NoSeriesMgt.InitSeries(ResSetup."Resource Nos.",xRec."No. Series",0D,"No.","No. Series");
    END;

    IF GETFILTER("Resource Group No.") <> '' THEN
      IF GETRANGEMIN("Resource Group No.") = GETRANGEMAX("Resource Group No.") THEN
        VALIDATE("Resource Group No.",GETRANGEMIN("Resource Group No."));

    DimMgt.UpdateDefaultDim(
      DATABASE::Resource,"No.",
      "Global Dimension 1 Code","Global Dimension 2 Code");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*

    IF ("Resource Type"="Resource Type"::" ") THEN BEGIN
    #1..5
    END;

    IF ("Resource Type"="Resource Type"::Normal) THEN BEGIN
    IF "No." = '' THEN BEGIN
      GrantSetup.GET;
      GrantSetup.TESTFIELD("Researcher Nos");
      NoSeriesMgt.InitSeries(GrantSetup."Researcher Nos",xRec."No. Series",0D,"No.","No. Series");
    END;
    END;

    IF ("Resource Type"="Resource Type"::Researcher) THEN BEGIN
    IF "No." = '' THEN BEGIN
      GrantSetup.GET;
      GrantSetup.TESTFIELD("Grant Admin Nos");
      NoSeriesMgt.InitSeries(GrantSetup."Grant Admin Nos",xRec."No. Series",0D,"No.","No. Series");
    END;
    END;
    #6..13
    */
    //end;

    var
        GrantSetup: Record "Grants Setup";
        Employee: Record Employee;
        ResponsibilityCenter: Record "Responsibility Center";
        Constituency: Record Constituency;
}

