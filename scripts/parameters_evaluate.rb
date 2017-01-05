#!/usr/bin/ruby
require 'yaml'
require 'pry'

yaml = YAML.load(File.read("parameters.yml"))

parameters = []
yaml.each do |elem|
    hash = {}
    elem["preprocessing_parameters"].each do |p|
        hash=hash.merge(p)
    end

    if hash["saliency_map_thresh_factor"]<0.4 &&
       hash["saliency_map_block_count"]<=10
        parameters<<hash
    end
end

sorted_parameters=parameters.sort_by{|hash| hash["intersection_percentage"]}.reverse

occurrences=Hash.new
sorted_parameters[0..9].each do |e|
    e.each do |k, v|
        if (k != "intersection_percentage")
            if !occurrences.has_key? k
                occurrences[k] = Hash.new
            end

            if !occurrences[k].has_key? v
                occurrences[k][v]=0
            end
            occurrences[k][v]=occurrences[k][v]+1
        end
    end
end

File.open("sorted_parameters.yml","w") do |file|
   file.write sorted_parameters.to_yaml
end

File.open("occurrences.yml","w") do |file|
   file.write occurrences.to_yaml
end
