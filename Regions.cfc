<cfcomponent output="false" mixin="controller">

	<cffunction access="public" returntype="Regions" name="init">
		<cfscript>
			this.version = "1.1.8";
			return this;
		</cfscript>
	</cffunction>

	<cffunction name="getUSStates" returntype="array" access="public" output="false" displayname="getUSStates" hint="I return a query of structures for US states">
    <cfif !StructKeyExists(application, 'states')>
      <cffile action="read" file="#GetDirectoryFromPath(GetBaseTemplatePath())#plugins/Regions/assets/states.json" variable="states_json" />
      <cfset application.states = DeserializeJSON(states_json)>
    </cfif>

    <cfreturn application.states>
	</cffunction>

	<cffunction name="getCanadianProvinces" returntype="array" access="public" output="false" displayname="getCanadianProvinces" hint="I return a query of structures for Canadian provinces">
    <cfif !StructKeyExists(application, 'provinces')>
      <cffile action="read" file="#GetDirectoryFromPath(GetBaseTemplatePath())#plugins/Regions/assets/provinces.json" variable="provinces_json" />
      <cfset application.provinces = DeserializeJSON(provinces_json)>
    </cfif>

    <cfreturn application.provinces>
	</cffunction>

	<cffunction name="getUSStatesAndCanadianProvinces" returntype="struct" access="public" output="false" displayname="getUSStatesAndCanadianProvinces" hint="I return a query of structures for US states and Canadian provinces">
    <cfset states = getUSStates()>
    <cfset provinces = getCanadianProvinces()>
    <cfreturn { "us": states, "ca": provinces }>
	</cffunction>

	<cffunction name="getCountries" returntype="array" access="public" output="false" displayname="getCountries" hint="I return a query of structures countries">
    <cfif !StructKeyExists(application, 'countries')>
      <cffile action="read" file="#GetDirectoryFromPath(GetBaseTemplatePath())#plugins/Regions/assets/countries.json" variable="countries_json" />
      <cfset application.countries = DeserializeJSON(countries_json)>
    </cfif>
    <cfreturn application.countries>
	</cffunction>

</cfcomponent>