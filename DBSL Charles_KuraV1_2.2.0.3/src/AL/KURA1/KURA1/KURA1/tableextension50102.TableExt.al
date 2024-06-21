#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50102 "tableextension50102" extends Contact
{
    fields
    {
        modify("Company No.")
        {
            TableRelation = Contact."No." where(Type = const(Company));
        }

        //Unsupported feature: Code Modification on ""No."(Field 1).OnValidate".

        //trigger "(Field 1)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF "No." <> xRec."No." THEN BEGIN
          RMSetup.GET;
          NoSeriesMgt.TestManual(RMSetup."Contact Nos.");
          "No. Series" := '';
        END;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        IF "No." <> xRec."No." THEN BEGIN
          IF "Portal Request"=FALSE THEN BEGIN
        #2..4
          END ELSE BEGIN
           IF "Applicant Type"="Applicant Type"::" " THEN BEGIN
              ProcSetup.GET;
              NoSeriesMgt.TestManual(ProcSetup."Request For Registration Nos");
             "No. Series" := '';
           END;
           IF "Applicant Type"="Applicant Type"::"E-Recruitment" THEN BEGIN
               HumanResourcesSetup.GET;
              NoSeriesMgt.TestManual( HumanResourcesSetup."Applicants Request  Nos");
             "No. Series" := '';
           END;

            END;
        END;
        */
        //end;
        field(50099; TEST; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50100; password; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(50101; "KRA PIN"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50102; "Tax Compliance Certificate No"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50103; "Director 1 Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50104; "Director 2 Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50105; "Director 3 Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50106; Group; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Stakeholder Group".Code;
        }
        field(50107; "Sub-Group"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Stakeholder Sub-Group".Code where("Stakeholder Group" = field(Group));
        }
        field(50108; "Parent Contact ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Contact;
        }
        field(50109; "Entity Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Organization,Individual';
            OptionMembers = Organization,Individual;
        }
        field(50110; UserVerified; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50111; "ID Number"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50112; "Portal Request"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50113; "Applicant Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,E-Procurment,E-Recruitment,ESS';
            OptionMembers = " ","E-Procurment","E-Recruitment",ESS;
        }
        field(50114; Generated; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }


    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    RMSetup.GET;

    IF "No." = '' THEN BEGIN
      RMSetup.TESTFIELD("Contact Nos.");
      NoSeriesMgt.InitSeries(RMSetup."Contact Nos.",xRec."No. Series",0D,"No.","No. Series");
    END;

    IF NOT SkipDefaults THEN BEGIN
    #9..26

    TypeChange;
    SetLastDateTimeModified;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..3
      IF "Portal Request"=FALSE THEN BEGIN
      RMSetup.TESTFIELD("Contact Nos.");
      NoSeriesMgt.InitSeries(RMSetup."Contact Nos.",xRec."No. Series",0D,"No.","No. Series");
      END;

      IF "Portal Request" = TRUE THEN BEGIN
        IF "Applicant Type"="Applicant Type"::" " THEN BEGIN
          ProcSetup.GET;
          ProcSetup.TESTFIELD(ProcSetup."Request For Registration Nos");
          NoSeriesMgt.InitSeries(ProcSetup."Request For Registration Nos",xRec."No. Series",0D,"No.","No. Series");
       END;
        IF "Applicant Type"="Applicant Type"::"E-Recruitment" THEN BEGIN
          HumanResourcesSetup.GET;
          HumanResourcesSetup.TESTFIELD(HumanResourcesSetup."Applicants Request  Nos");
          NoSeriesMgt.InitSeries(HumanResourcesSetup."Applicants Request  Nos",xRec."No. Series",0D,"No.","No. Series");
       END;
      END;
    #6..29
    */
    //end;

    //Unsupported feature: Variable Insertion (Variable: PortalUSer) (VariableCollection) on "CreateVendor(PROCEDURE 7)".


    //Unsupported feature: Variable Insertion (Variable: RandomDigit) (VariableCollection) on "CreateVendor(PROCEDURE 7)".


    //Unsupported feature: Variable Insertion (Variable: Procurement) (VariableCollection) on "CreateVendor(PROCEDURE 7)".


    //Unsupported feature: Variable Insertion (Variable: entryno) (VariableCollection) on "CreateVendor(PROCEDURE 7)".



    //Unsupported feature: Code Modification on "CreateVendor(PROCEDURE 7)".

    //procedure CreateVendor();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CheckForExistingRelationships(ContBusRel."Link to Table"::Vendor);
    CheckIfPrivacyBlockedGeneric;
    TESTFIELD("Company No.");
    #4..23
    OnAfterVendorInsert(Vend,Rec);

    UpdateCustVendBank.UpdateVendor(ContComp,ContBusRel);

    IF OfficeMgt.IsAvailable THEN
      PAGE.RUN(PAGE::"Vendor Card",Vend)
    ELSE
      IF NOT HideValidationDialog THEN
        MESSAGE(RelatedRecordIsCreatedMsg,Vend.TABLECAPTION);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..26
    // Update Dynasoft Portal user
    PortalUSer.RESET;
    IF PortalUSer.FINDLAST THEN
      entryno:=PortalUSer."Entry No";
    PortalUSer.RESET;
    PortalUSer.SETRANGE("User Name","E-Mail");
    IF NOT PortalUSer.FINDSET THEN BEGIN
      PortalUSer.INIT;
      PortalUSer."Entry No":=entryno+1;
      PortalUSer."User Name":="E-Mail";
      PortalUSer."Full Name":=Name;
      PortalUSer."Authentication Email":="E-Mail";
      PortalUSer."Mobile Phone No.":="Phone No.";
      PortalUSer.State:=PortalUSer.State::Enabled;
      PortalUSer."Record Type":=PortalUSer."Record Type"::Vendor;
      PortalUSer."Record ID":=Vend."No.";

    RandomDigit := CREATEGUID;
    RandomDigit := DELCHR(RandomDigit,'=','{}-01');
    RandomDigit := COPYSTR(RandomDigit,1,8);
    //MESSAGE(RandomDigit);
      PortalUSer."Password Value":=RandomDigit;
      PortalUSer.INSERT;
      ProcSetup.GET;
      Vend."Gen. Bus. Posting Group":=ProcSetup."Default General Product PG";
      Vend."Vendor Posting Group":=ProcSetup."Default Vendor PG";
      Procurement.FnSendEmaiNotificationOnSupplierAccountActivation(Rec);
      END;



    #27..32
    */
    //end;

    procedure CreateApplicant()
    var
        PortalUSer: Record "Dynasoft Portal User";
        RandomDigit: Text[50];
        Procurement: Codeunit "Procurement Processing";
        entryno: Integer;
        ApplicantProfile: Record "Applicant Profile";
        HumanResourcesSetup: Record "Human Resources Setup";
    begin
        TestField("No.");
        TestField(Name);
        TestField("E-Mail");
        TestField("Phone No.");


        HumanResourcesSetup.Get;
        ApplicantProfile.Init;
        // ApplicantProfile."No.":=NoSeriesMgt.GetNextNo(HumanResourcesSetup."Applicant Profile Nos",Today,true);
        ApplicantProfile."Full Names" := Name;
        ApplicantProfile."E-Mail" := "E-Mail";
        ApplicantProfile."Phone No." := "Phone No.";
        ApplicantProfile.Insert(true);

        // Update Dynasoft Portal user {PortalUSer.RESET;
        if PortalUSer.FindLast then
            entryno := PortalUSer."Entry No";
        PortalUSer.Reset;
        PortalUSer.SetRange("User Name", "E-Mail");
        if not PortalUSer.FindSet then begin

            PortalUSer.Init;
            PortalUSer."Entry No" := entryno + 1;
            PortalUSer."User Name" := "E-Mail";
            PortalUSer."Full Name" := Name;
            PortalUSer."Authentication Email" := "E-Mail";
            PortalUSer."Mobile Phone No." := "Phone No.";
            PortalUSer.State := PortalUSer.State::Enabled;
            PortalUSer."Record Type" := PortalUSer."record type"::Vendor;
            PortalUSer."Record ID" := ApplicantProfile."No.";

            RandomDigit := CreateGuid;
            RandomDigit := DelChr(RandomDigit, '=', '{}-01');
            RandomDigit := CopyStr(RandomDigit, 1, 8);
            //MESSAGE(RandomDigit);
            PortalUSer."Password Value" := RandomDigit;
            PortalUSer.Insert;


            //ShortlistingCriteria.FnSendEmaiNotificationOnApplicantAccountActivation(Rec);
        end;

        Generated := true;
        Modify;
    end;

    var
        ProcSetup: Record "Procurement Setup";
        HumanResourcesSetup: Record "Human Resources Setup";
        ShortlistingCriteria: Codeunit "Shortlisting Criteria";
}

