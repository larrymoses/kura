#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69125 "Job Advert Lines"
{
    LookupPageID = "Training Needs Card";

    fields
    {
        field(1;"Entry No.";Integer)
        {
            AutoIncrement = true;
        }
        field(2;"Vacancy No.";Code[30])
        {
            TableRelation = Vacancyx."Requisition No.";

            trigger OnValidate()
            begin
                Vacancy.Reset;
                Vacancy.SetRange("Requisition No.","Vacancy No.");
                if Vacancy.FindSet then begin
                  "Job Id":=Vacancy."Job Id";
                  Vacancy.CalcFields("Job Description");
                  "Job Title":=Vacancy."Job Description";
                end
            end;
        }
        field(3;"Job Id";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Job Title";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Media Outlet";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Print,Online';
            OptionMembers = ,Print,Online;
        }
        field(6;Description;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(7;Date;Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8;URL;Text[30])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = URL;
        }
        field(9;"Outlet Used";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Advertisement Channels";

            trigger OnValidate()
            begin
                AdvertisementChannels.Reset;
                AdvertisementChannels.SetRange(Code,"Outlet Used");
                if AdvertisementChannels.FindSet then begin
                  "Media Outlet":=AdvertisementChannels.Mode;
                  Description:=AdvertisementChannels.Description;
                end
            end;
        }
    }

    keys
    {
        key(Key1;"Entry No.","Vacancy No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Vacancy: Record Vacancyx;
        AdvertisementChannels: Record "Advertisement Channels";
}

