using HTTP
using JSON
using DataFrames
using Dates

struct FMIDataset
    """This struct represents datasets that can be extracted from the FMI API"""
    database_id::String
    base_url::String
end

function FMIDataset(database_id::String)
    base_url = "http://dataservices.imf.org/REST/SDMX_JSON.svc/CompactData/$database_id"
    return FMIDataset(database_id, base_url)
end

function joiner(input_lists::Vararg{Array})
    joined_strings = tuple([join(input_list, "+") for input_list in input_lists]...)
    return joined_strings
end

function fetch_data(dataset::FMIDataset, frequency::String, region::String, indicator::String)
    # Construct the full URL
    url = "$(dataset.base_url)/$frequency.$region.$indicator"
    
    # Request data from the API
    response = JSON.parse(String(HTTP.request("GET", url).body))
    return response
end

function process_data(response)
    # Access the 'Series' key to get the list of indicators
    indicadores = response["CompactData"]["DataSet"]["Series"]
    
    df = DataFrame(
        "Código do indicador" => Vector{Union{String}}(),
        "Localização" => Vector{Union{String}}(),
        "Período" => Vector{Union{String}}(),
        "Valor" => Vector{Union{String, Missing}}()
    )
    # Access the 'Series' key to get the list of indicators
    indicadores = response["CompactData"]["DataSet"]["Series"]

    # Iterate over the lists of indicators
    for indicador in indicadores
        for obs in indicador["Obs"]
            dataset_info = Dict(
                "Código do indicador" => indicador["@INDICATOR"],
                "Localização" => indicador["@REF_AREA"],
                "Período" => get(obs, "@TIME_PERIOD", missing),
                "Valor" => get(obs, "@OBS_VALUE", missing)
            )
            push!(df, dataset_info)
        end
    end
    
    return df
end

function get_indicator(dataset::FMIDataset, frequency_list::Vector{String}, region_list::Vector{String}, indicator_list::Vector{String})
    frequency, region, indicator = joiner(frequency_list, region_list, indicator_list)
    response = fetch_data(dataset, frequency, region, indicator)
    df = process_data(response)
    return df
end